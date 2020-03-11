/*
Copyright (c) 2010 Helsinki University of Technology (TKK)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 */

package fi.hut.ics.lime.tester.threading;

import java.lang.Thread.UncaughtExceptionHandler;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.Condition;

import fi.hut.ics.lime.tester.symbolicexecution.Execution;
import fi.hut.ics.lime.tester.symbolicexecution.Initializer;

/**
 * Implements scheduling functionality. Instrumented code calls the "pre", "post" and "do" methods, which act as the
 * scheduling points. The main scheduler loop uses a scheduling strategy through a {@link SchedulingStrategyConnector}
 * and runs the selected threads one at a time.
 * 
 * @author osaariki
 */
public class Scheduler
{
    /**
     * The global scheduler lock. Calls to the "pre" and "post" methods must be protected with this lock. The critical
     * section should also include the related visible event. The "do" methods acquire and release the lock on their own
     * and calling them while holding the scheduler lock would result in deadlock. Please note that
     */
    public static final PermissiveLock             schedulerLock           = new PermissiveLock();

    /**
     * This condition is signaled when a new thread is added to <code>runPermissions</code>.
     */
    private static final Condition                 permissionAdded         = schedulerLock.newCondition();

    /**
     * This condition is signaled when a tracked thread is removed or a tracked thread enters the scheduler.
     */
    private static final Condition                 threadEnteredOrRemoved  = schedulerLock.newCondition();

    private static final Map<Thread, EventOptions> eventsPerThread         = new IdentityHashMap<Thread, EventOptions>();
    private static final Set<Thread>               runPermissions          = Collections
                                                                                   .newSetFromMap(new IdentityHashMap<Thread, Boolean>());

    private static final Map<Object, Set<Thread>>  waitingThreadsPerObject = new IdentityHashMap<Object, Set<Thread>>();
    private static final Map<Object, Thread>       lockedObjects           = new IdentityHashMap<Object, Thread>();

    private static final Set<Thread>               unparkPermits           = Collections
                                                                                   .newSetFromMap(new IdentityHashMap<Thread, Boolean>());
    private static final Map<Thread, Object>       parkBlockers            = new IdentityHashMap<Thread, Object>();

    private static final Map<Thread, Integer>      trackedThreadIds        = new IdentityHashMap<Thread, Integer>();

    private static int                             nextThreadId            = 0;

    private static boolean                         spuriousWakeups         = false;

    private static SchedulingStrategyConnector     connector;

    private static Thread                          schedulerThread;

    private static boolean                         running;

    private static Set<Thread> waitingThreads = new HashSet<Thread>();

    public static Map<String, String> debugData = new HashMap<String, String>();
    
    /**
     * An interface for classes holding the events of threads. The {@link #getEvents()} method can return different
     * available events depending on the state of the scheduler. For example threads that have performed a wait only
     * have their acquire lock event available after they have been woken up.
     * 
     * @author osaariki
     */
    private static abstract class EventOptions
    {
        public abstract Set<? extends SchedulerEvent> getEvents();
        @Override
        public String toString() {
            return getEvents().toString();
        }
    }

    /**
     * This is an internal implementation of the {@link Event} interface. All events created in the scheduler extend
     * this class and add their event specific functionality to the {@link #apply()} method. The overriding events are
     * anonymous classes, so that the event's functionality is defined inside the relevant scheduling function.
     * 
     * @author osaariki
     */
    private static abstract class SchedulerEvent implements Event
    {
        private String              eventName;
        private String              sourceLocation;
        private EventIdentity       identity;
        private Type                type;
        private CommunicationObject communicationObject;

        /**
         * Creates an instance of <code>Event</code>.
         * 
         * @param eventName
         *            a human readable name for the event.
         * @param sourceLocation
         *            a string that identifies the source file and line number from which this event originated.
         * @param identity
         *            the identity of this event.
         * @param type
         *            the type of this event.
         * @param communicationObject
         *            the communication object related to this event.
         */
        public SchedulerEvent(String eventName, String sourceLocation, EventIdentity identity, Type type,
                CommunicationObject communicationObject)
        {
            this.eventName = eventName;
            this.sourceLocation = sourceLocation;
            this.identity = identity;
            this.type = type;
            this.communicationObject = communicationObject;
        }

        /**
         * Applies the effects of this event. Usually this includes giving the thread that owns this event permission to
         * continue.
         */
        public abstract void apply();

        public String getEventName()
        {
            return eventName;
        }

        public String getSourceLocation()
        {
            return sourceLocation;
        }

        public EventIdentity getIdentity()
        {
            return identity;
        }

        public CommunicationObject getCommunicationObject()
        {
            return communicationObject;
        }

        public Type getType()
        {
            return type;
        }

        public boolean mightBeDependentWith(Event other)
        {
            if (other instanceof SchedulerEvent) {
                SchedulerEvent otherSE = (SchedulerEvent) other;
                return communicationObject.equals(otherSE.communicationObject)
                        && (type != Type.READ || otherSE.type != Type.READ);
            } else {
                return true; // Returning true is always safe (may result in less reduction).
            }
        }

        @Override
        public String toString() {
            return "SchedulerEvent" + "(" + getEventName() + "):" + getIdentity() + ":" + getSourceLocation();
        }
    }

    /**
     * @param thread the thread to get the id for.
     * @return the id.
     */
    public static int getThreadId(Thread thread)
    {
        Integer id = trackedThreadIds.get(thread);
        if (id == null) {
            System.err.println("An untracked thread tried to execute a visible event. This could result in\n"
                    + "undeterministic behaviour. Terminating the execution.");
            Initializer.end(1);
            throw new RuntimeException();
        } else {
            return id;
        }
    }

    /**
     * Notifies the scheduler that the current thread is about to perform a read on a shared variable and waits until
     * the scheduler gives permission to run. The scheduler lock must be locked when this method is called and should be
     * unlocked only after the read has been done.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param object
     *            the base object.
     * @param fieldName
     *            the field name.
     */
    public static void preRead(String sourceLocation, Object object, String fieldName)
    {
        assert schedulerLock.isLocked();

        preSimpleOperation("Read", sourceLocation, Event.Type.READ, new SharedVariable(object, fieldName));
    }

    /**
     * Notifies the scheduler that the current thread is about to perform a read on a shared variable and waits until
     * the scheduler gives permission to run. The scheduler lock must be locked when this method is called and should be
     * unlocked only after the read has been done.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param object
     *            the base object.
     * @param index
     *            the array index.
     */
    public static void preRead(String sourceLocation, Object object, int index)
    {
        preRead(sourceLocation, object, Integer.toString(index));
    }

    /**
     * Notifies the scheduler that the current thread is about to perform a write on a shared variable and waits until
     * the scheduler gives permission to run. The scheduler lock must be locked when this method is called and should be
     * unlocked only after the write has been done.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param object
     *            the base object.
     * @param fieldName
     *            the field name.
     */
    public static void preWrite(String sourceLocation, Object object, String fieldName)
    {
        assert schedulerLock.isLocked();

        preSimpleOperation("Write", sourceLocation, Event.Type.READ_WRITE, new SharedVariable(object,
                fieldName));
    }

    /**
     * Notifies the scheduler that the current thread is about to perform a write on a shared variable and waits until
     * the scheduler gives permission to run. The scheduler lock must be locked when this method is called and should be
     * unlocked only after the write has been done.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param object
     *            the base object.
     * @param index
     *            the array index.
     */
    public static void preWrite(String sourceLocation, Object object, int index)
    {
        preWrite(sourceLocation, object, Integer.toString(index));
    }

    /**
     * Notifies the scheduler that the current thread is about to perform a write on a shared variable and waits until
     * the scheduler gives permission to run. The scheduler lock must be locked when this method is called and should be
     * unlocked only after the write has been done. This method is intended for instrumenting calls to uninstrumented
     * code.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param targetName
     *            a name for the target.
     */
    public static void preWrite(String sourceLocation, String targetName)
    {
        assert schedulerLock.isLocked();

        preSimpleOperation("Write", sourceLocation, Event.Type.READ_WRITE, new SharedExternal(targetName));
    }

    private static void preSimpleOperation(String eventName, String sourceLocation, Event.Type type,
        CommunicationObject communicationObject)
    {
        final Thread thread = Thread.currentThread();
        final SchedulerEvent event = new SchedulerEvent(eventName, sourceLocation, new EventIdentity(getThreadId(thread)), type, communicationObject) {
            @Override
            public void apply()
            {
                addRunPermission(thread);
            }

            public boolean isEnabled()
            {
                return true;
            }
        };

        setSingleEventOption(thread, event);

        // Wait until this thread is given permission to run.
        while (!tryConsumeRunPermission(thread)) {
            permissionAdded.awaitUninterruptibly();
        }
    }

    /**
     * Notifies the scheduler that the current thread is about to enter a monitor and waits until the scheduler gives
     * permission to run. The scheduler lock must be locked when this method is called and should be unlocked only after
     * the monitor has been entered.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     */
    public static void preEnterMonitor(String sourceLocation, final Object monitorObject)
    {
        assert schedulerLock.isLocked();

        final Thread thread = Thread.currentThread();
        final SchedulerEvent acquireLockEvent = new SchedulerEvent("Enter monitor", sourceLocation, new EventIdentity(getThreadId(thread)), Event.Type.ENTERMONITOR, new LockObject(monitorObject)) {
            @Override
            public void apply()
            {
                assert (!lockedObjects.containsKey(monitorObject) || lockedObjects.get(monitorObject) == thread);
                addRunPermission(thread);
            }

            public boolean isEnabled()
            {
                return (!lockedObjects.containsKey(monitorObject) || lockedObjects.get(monitorObject) == thread);
            }
        };

        setSingleEventOption(thread, acquireLockEvent);

        // Wait until this thread is given permission to run.
        while (!tryConsumeRunPermission(thread)) {
            permissionAdded.awaitUninterruptibly();
        }

        lockedObjects.put(monitorObject, thread);
    }

    /**
     * Notifies the scheduler that the current thread is about to exit a monitor and waits until the scheduler gives
     * permission to run. The scheduler lock must be locked when this method is called and should be unlocked only after
     * the monitor has been exited.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     */
    public static void preExitMonitor(String sourceLocation, final Object monitorObject)
    {
        assert schedulerLock.isLocked();

        if (!Thread.holdsLock(monitorObject))
            return; /*
                     * Preferable to throwing IllegalMonitorStateException ourselves as the possible error message will
                     * not be modified this way.
                     */

        final Thread thread = Thread.currentThread();
        SchedulerEvent releaseLockEvent = new SchedulerEvent("Exit monitor", sourceLocation, new EventIdentity(getThreadId(thread)), Event.Type.INSIDEMONITOR, new LockObject(monitorObject)) {
            @Override
            public void apply()
            {
                addRunPermission(thread);
            }

            public boolean isEnabled()
            {
                return true;
            }
        };

        setSingleEventOption(thread, releaseLockEvent);

        // Wait until this thread is given permission to run.
        while (!tryConsumeRunPermission(thread)) {
            permissionAdded.awaitUninterruptibly();
        }
    }

    /**
     * Informs the scheduler that the current thread has exited a monitor. The scheduler lock must be locked when this
     * method is called.
     * 
     * @param monitorObject
     *            the monitor object.
     */
    public static void postExitMonitor(Object monitorObject)
    {
        if (lockedObjects.get(monitorObject) == Thread.currentThread() && !Thread.holdsLock(monitorObject))
            lockedObjects.remove(monitorObject);
    }

    /**
     * Performs a scheduled wait on the given monitor. The scheduler lock must not be locked when this method is called.
     * A call to <code>doWait(monitorObject)</code> when using the scheduler should be semantically equivalent
     * to calling <code>monitorObject.wait()</code> when the scheduler is not in use.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     * @throws InterruptedException
     *             if another thread interrupted the current thread before or while the current thread was waiting for a
     *             notification. The interrupted status of the current thread is cleared when this exception is thrown.
     * @throws IllegalMonitorStateException
     *             if the current thread is not the owner of the object's monitor.
     */
    public static void doWait(String sourceLocation, final Object monitorObject)
            throws InterruptedException
    {
        if (!Thread.holdsLock(monitorObject))
            throw new IllegalMonitorStateException();

        schedulerLock.lock();
        try {
            final Thread thread = Thread.currentThread();
            final Set<Thread> waitingThreads = getWaitingThreads(monitorObject);
            waitingThreads.add(thread);

            final SchedulerEvent acquireLockEvent = new SchedulerEvent("Reenter monitor", sourceLocation,
                    new EventIdentity(getThreadId(thread)), Event.Type.ENTERMONITOR, new LockObject(
                            monitorObject)) {
                @Override
                public void apply()
                {
                    assert !lockedObjects.containsKey(monitorObject);
                    addRunPermission(thread);
                    synchronized (monitorObject) {
                        monitorObject.notifyAll();
                    }
                }

                public boolean isEnabled()
                {
                    return (!waitingThreads.contains(thread)) && (!lockedObjects.containsKey(monitorObject));
                }
            };

            setSingleEventOption(thread, acquireLockEvent);

            performWait(monitorObject);
        } finally {
            schedulerLock.unlock();
        }
    }

    /**
     * Performs a scheduled wait with a timeout on the given monitor. The scheduler lock must not be locked when this
     * method is called. A call to <code>doWait(monitorObject)</code> when using the scheduler should be
     * semantically equivalent to calling <code>monitorObject.wait()</code> when the scheduler is not in use.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     * @param timeout
     *            the maximum time to wait in milliseconds.
     * @throws IllegalArgumentException
     *             if the value of timeout is negative.
     * @throws InterruptedException
     *             if another thread interrupted the current thread before or while the current thread was waiting for a
     *             notification. The interrupted status of the current thread is cleared when this exception is thrown.
     * @throws IllegalMonitorStateException
     *             if the current thread is not the owner of the object's monitor.
     */
    public static void doWait(String sourceLocation, final Object monitorObject, long timeout)
            throws InterruptedException
    {
        if (!Thread.holdsLock(monitorObject))
            throw new IllegalMonitorStateException();
        if (timeout < 0)
            throw new IllegalArgumentException("Negative timeout.");

        if (timeout == 0) {
            doWait(sourceLocation, monitorObject);
        } else {
            schedulerLock.lock();
            try {
                final Thread thread = Thread.currentThread();
                final Set<Thread> waitingThreads = getWaitingThreads(monitorObject);
                waitingThreads.add(thread);

                final SchedulerEvent timeoutEvent = new SchedulerEvent("Timeout wait", sourceLocation,
                        new EventIdentity(getThreadId(thread)), Event.Type.ENTERMONITOR,
                        new LockObject(monitorObject)) {
                    @Override
                    public void apply()
                    {
                        getWaitingThreads(monitorObject).remove(thread);
                    }

                    public boolean isEnabled()
                    {
                        return waitingThreads.contains(thread);
                    }
                };

                final SchedulerEvent acquireLockEvent = new SchedulerEvent("Reenter monitor", sourceLocation,
                        new EventIdentity(getThreadId(thread)), Event.Type.ENTERMONITOR,
                        new LockObject(monitorObject)) {
                    @Override
                    public void apply()
                    {
                        assert !lockedObjects.containsKey(monitorObject);
                        addRunPermission(thread);
                        synchronized (monitorObject) {
                            monitorObject.notifyAll();
                        }
                    }

                    public boolean isEnabled()
                    {
                        return (!waitingThreads.contains(thread)) && (!lockedObjects.containsKey(monitorObject));
                    }
                };

                setEventOptions(thread, new EventOptions() {
                    public Set<? extends SchedulerEvent> getEvents()
                    {
                        /*
                         * If the thread has not been woken up the event to timeout the wait is available. Otherwise the
                         * event to reacquire the lock is available.
                         */
                        if (waitingThreads.contains(thread))
                            return Collections.singleton(timeoutEvent);
                        else
                            return Collections.singleton(acquireLockEvent);
                    }
                });

                performWait(monitorObject);
            } finally {
                schedulerLock.unlock();
            }
        }
    }

    /**
     * Performs a scheduled wait with a timeout on the given monitor. The scheduler lock must not be locked when this
     * method is called. A call to <code>doWait(monitorObject)</code> when using the scheduler should be
     * semantically equivalent to calling <code>monitorObject.wait()</code> when the scheduler is not in use.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     * @param timeout
     *            the maximum time to wait in milliseconds.
     * @param nanos
     *            additional time, in nanoseconds range 0-999999.
     * @throws IllegalArgumentException
     *             if the value of timeout is negative or the value of nanos is not in the range 0-999999.
     * @throws InterruptedException
     *             if another thread interrupted the current thread before or while the current thread was waiting for a
     *             notification. The interrupted status of the current thread is cleared when this exception is thrown.
     * @throws IllegalMonitorStateException
     *             if the current thread is not the owner of the object's monitor.
     */
    public static void doWait(String sourceLocation, final Object monitorObject, long timeout, int nanos)
            throws InterruptedException
    {
        if (!(0 <= nanos && nanos <= 999999))
            throw new IllegalArgumentException("Nanos not in the range 0-999999.");

        doWait(sourceLocation, monitorObject, timeout);
    }

    private static Set<Thread> getWaitingThreads(Object monitorObject)
    {
        Set<Thread> threads;
        if (waitingThreadsPerObject.containsKey(monitorObject)) {
            threads = waitingThreadsPerObject.get(monitorObject);
        } else {
            threads = Collections.newSetFromMap(new IdentityHashMap<Thread, Boolean>());
            waitingThreadsPerObject.put(monitorObject, threads);
        }
        return threads;
    }

    private static void performWait(Object monitorObject) throws InterruptedException
    {
        Thread thread = Thread.currentThread();
        InterruptedException interrupt = null;

        lockedObjects.remove(monitorObject);

        // Wait on the given object until it is our turn to run.
        while (!tryConsumeRunPermission(thread)) {
            /*
             * Monitorenter instructions try to acquire a monitor while holding the scheduler lock, so here we can't
             * wait to acquire the scheduler lock indefinitely while owning the monitor, or else we get deadlocks. For
             * this reason we try to lock the scheduler lock and upon failing go back to a wait on the monitor to give
             * others a chance to get it.
             */
            schedulerLock.unlock();
            do {
                try {
                    monitorObject.wait(50); // TODO: this doesn't seem very efficient, is there another way to do this?
                } catch (InterruptedException e) {
                    interrupt = e;
                }
            } while (!schedulerLock.tryLock());
        }

        lockedObjects.put(monitorObject, thread);

        if (interrupt != null)
            throw interrupt;
    }

    /**
     * Tells the scheduler to wake up a single thread waiting on the provided object's monitor. The scheduler and the
     * scheduling strategy it is connected to does the actual decision of which thread to wake up. The scheduler lock
     * must not be locked when this method is called.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     * @throws IllegalMonitorStateException
     *             if the current thread is not the owner of this object's monitor.
     */
    public static void doNotify(String sourceLocation, Object monitorObject)
    {
        if (!Thread.holdsLock(monitorObject))
            throw new IllegalMonitorStateException();

        Thread thread = Thread.currentThread();

        schedulerLock.lock();
        try {
            createNotifyEvents(sourceLocation, monitorObject, thread, getWaitingThreads(monitorObject));

            // Wait until this thread is given permission to run.
            while (!tryConsumeRunPermission(thread)) {
                permissionAdded.awaitUninterruptibly();
            }
        } finally {
            schedulerLock.unlock();
        }
    }

    private static void createNotifyEvents(String sourceLocation, final Object monitorObject,
            final Thread notifyingThread, Collection<Thread> waitingThreads)
    {
        final HashSet<SchedulerEvent> notifyEvents = new HashSet<SchedulerEvent>();
        for (final Thread waitingThread : waitingThreads) {
            SchedulerEvent notifyEvent = new SchedulerEvent("Notify", sourceLocation, new NotifyEventIdentity(getThreadId(notifyingThread), getThreadId(waitingThread)),
                    Event.Type.INSIDEMONITOR, new LockObject(monitorObject)) {
                @Override
                public void apply()
                {
                    addRunPermission(notifyingThread);
                    getWaitingThreads(monitorObject).remove(waitingThread);
                }

                public boolean isEnabled()
                {
                    return true;
                }
            };
            notifyEvents.add(notifyEvent);
        }

        if (notifyEvents.isEmpty()) {
            SchedulerEvent wakeNone = new SchedulerEvent("Notify none", sourceLocation, new EventIdentity(getThreadId(notifyingThread)), Event.Type.INSIDEMONITOR, new LockObject(monitorObject)) {
                @Override
                public void apply()
                {
                    addRunPermission(notifyingThread);
                }

                public boolean isEnabled()
                {
                    return true;
                }
            };
            notifyEvents.add(wakeNone);
        }

        setEventOptions(notifyingThread, new EventOptions() {
            public Set<? extends SchedulerEvent> getEvents()
            {
                return notifyEvents;
            }
        });
    }

    /**
     * Tells the scheduler to wake up all threads waiting on the provided object's monitor. The scheduler lock must not
     * be locked when this method is called.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param monitorObject
     *            the monitor object.
     * @throws IllegalMonitorStateException
     *             if the current thread is not the owner of this object's monitor.
     */
    public static void doNotifyAll(String sourceLocation, final Object monitorObject)
    {
        if (!Thread.holdsLock(monitorObject))
            throw new IllegalMonitorStateException();

        schedulerLock.lock();
        try {
            final Thread thread = Thread.currentThread();
            final SchedulerEvent notifyAll = new SchedulerEvent("Notify all", sourceLocation, new EventIdentity(getThreadId(thread)), Event.Type.INSIDEMONITOR, new LockObject(monitorObject)) {
                @Override
                public void apply()
                {
                    addRunPermission(thread);
                    getWaitingThreads(monitorObject).clear();
                }

                public boolean isEnabled()
                {
                    return true;
                }
            };

            setSingleEventOption(thread, notifyAll);

            // Wait until this thread is given permission to run.
            while (!tryConsumeRunPermission(thread)) {
                permissionAdded.awaitUninterruptibly();
            }
        } finally {
            schedulerLock.unlock();
        }
    }

    /**
     * Performs a scheduled call to {@link LockSupport.#park(Object)}.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param blocker
     *            the synchronization object responsible for this thread parking.
     */
    public static void doPark(String sourceLocation, Object blocker)
    {
        performPark(sourceLocation, blocker, false);
    }

    /**
     * Performs a scheduled call to {@link LockSupport.#parkNanos(Object, long)}.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param blocker
     *            the synchronization object responsible for this thread parking.
     * @param nanos
     *            the maximum number of nanoseconds to wait.
     */
    public static void doParkNanos(String sourceLocation, Object blocker, long nanos)
    {
        if (nanos > 0)
            performPark(sourceLocation, blocker, true);
    }

    /**
     * Performs a scheduled call to {@link LockSupport.#parkUntil(Object, long)}.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param blocker
     *            the synchronization object responsible for this thread parking.
     * @param deadline
     *            the absolute time, in milliseconds from the Epoch, to wait until.
     */
    public static void doParkUntil(String sourceLocation, Object blocker, long deadline)
    {
        performPark(sourceLocation, blocker, true);
    }

    private static void performPark(String sourceLocation, Object blocker, final boolean canTimeout)
    {
        schedulerLock.lock();
        try {
            final Thread thread = Thread.currentThread();

            final SchedulerEvent otherUnparkEvent = new SchedulerEvent("Timeout, interrupted or spurious unpark", sourceLocation,
                    new EventIdentity(getThreadId(thread)), Event.Type.PARKRELATED, new LockObject(thread)) {

                @Override
                public void apply()
                {
                    addRunPermission(thread);
                }

                public boolean isEnabled()
                {
                    return !unparkPermits.contains(thread) && (canTimeout || spuriousWakeups || thread.isInterrupted());
                }
            };

            final SchedulerEvent normalUnparkEvent = new SchedulerEvent("Consume unpark permit", sourceLocation,
                    new EventIdentity(getThreadId(thread)), Event.Type.PARKRELATED, new LockObject(thread)) {

                @Override
                public void apply()
                {
                    addRunPermission(thread);
                    unparkPermits.remove(thread);
                }

                public boolean isEnabled()
                {
                    return unparkPermits.contains(thread);
                }
            };

            setEventOptions(thread, new EventOptions() {

                public Set<? extends SchedulerEvent> getEvents()
                {
                    if (unparkPermits.contains(thread)) {
                        return Collections.singleton(normalUnparkEvent);
                    } else {
                        return Collections.singleton(otherUnparkEvent);
                    }
                }
            });

            parkBlockers.put(thread, blocker);

            while (!tryConsumeRunPermission(thread)) {
                permissionAdded.awaitUninterruptibly();
            }

            parkBlockers.remove(thread);
        } finally {
            schedulerLock.unlock();
        }
    }

    /**
     * Performs a scheduled call to {@link LockSupport.#unpark(Thread)}.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param parkedThread
     *            the thread to unpark, or <code>null</code>, in which case this operation has no effect.
     */
    public static void doUnpark(String sourceLocation, final Thread parkedThread)
    {
        if (parkedThread != null) {
            schedulerLock.lock();
            try {
                final Thread thread = Thread.currentThread();

                final SchedulerEvent unparkEvent = new SchedulerEvent("Unpark", sourceLocation, new EventIdentity(getThreadId(thread)), Event.Type.PARKRELATED, new LockObject(thread)) {

                    @Override
                    public void apply()
                    {
                        addRunPermission(thread);
                        unparkPermits.add(parkedThread);
                    }

                    public boolean isEnabled()
                    {
                        return true;
                    }
                };

                setSingleEventOption(thread, unparkEvent);

                while (!tryConsumeRunPermission(thread)) {
                    permissionAdded.awaitUninterruptibly();
                }
            } finally {
                schedulerLock.unlock();
            }
        }
    }

    /**
     * Returns the blocker object.
     * 
     * @param sourceLocation
     *            a string identifying the source location of the event.
     * @param parkedThread
     *            the thread to get the blocker object for.
     * @return the blocker.
     */
    public static Object doGetBlocker(String sourceLocation, final Thread parkedThread)
    {
        if (parkedThread != null) {
            schedulerLock.lock();
            try {
                preSimpleOperation("Get blocker", sourceLocation, Event.Type.PARKRELATED, new LockObject(
                        parkedThread));
                return parkBlockers.get(parkedThread);
            } finally {
                schedulerLock.unlock();
            }
        } else {
            // This is not exactly correct behavior. At least Java HotSpot(TM) 64-Bit Server VM (16.3-b01 mixed mode
            // linux-amd64) would segfault when called with null.
            throw new NullPointerException("Can not get blocker for null. This was thrown from the instrumented "
                    + "replacement for LockSupport.getBlocker(Thread).");
        }
    }

    /**
     * Informs the scheduler that the current thread is about to wait and a visible event should not be expected from
     * it. A visible event should not be reached after this method has been called and before
     * {@link Scheduler#informEndWait()} is called.
     */
    public static void informStartWait()
    {
        schedulerLock.lock();
        try {
            final Thread thread = Thread.currentThread();

            waitingThreads.add(thread);

            setEventOptions(thread, new EventOptions() {

                public Set<? extends SchedulerEvent> getEvents()
                {
                    return Collections.emptySet();
                }
            });
        } finally {
            schedulerLock.unlock();
        }
    }

    /**
     * Informs the scheduler that the wait signaled with {@link Scheduler#informStartWait()} has ended.
     */
    public static void informEndWait()
    {
        schedulerLock.lock();
        try {
            final Thread thread = Thread.currentThread();

            waitingThreads.remove(thread);

            eventsPerThread.remove(thread);
        } finally {
            schedulerLock.unlock();
        }
    }

    private static void setEventOptions(Thread thread, EventOptions options)
    {
        eventsPerThread.put(thread, options);
        threadEnteredOrRemoved.signalAll();
    }

    private static void setSingleEventOption(Thread thread, final SchedulerEvent event)
    {
        setEventOptions(thread, new EventOptions() {

            public Set<? extends SchedulerEvent> getEvents()
            {
                return Collections.singleton(event);
            }
        });
    }

    private static void addRunPermission(Thread thread)
    {
        eventsPerThread.remove(thread);
        runPermissions.add(thread);
        permissionAdded.signalAll();
    }

    private static boolean tryConsumeRunPermission(Thread thread)
    {
        assert (eventsPerThread.get(thread)!=null);
        return runPermissions.remove(thread);
    }

    /**
     * Informs the scheduler that a new thread may have been started. Instrumented code calls this after every call to
     * the <code>start()</code> method in {@link Thread}. The scheduler lock must be locked when this method is called
     * and the related call to <code>start()</code> should also be protected in the same lock.
     * 
     * @param thread
     *            the thread that might have been started.
     */
    public static void informThreadStart(final Thread thread)
    {
        if (thread.getState() == Thread.State.TERMINATED) {
            return;
        }

        trackedThreadIds.put(thread, nextThreadId++);

        Thread joiningThread = new Thread() {
            public void run()
            {
                try {
                    thread.join();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    System.err.println("A join for tracking thread termination was interrupted and the "
                            + "scheduler might deadlock.");
                    return;
                }
                schedulerLock.lock();
                try {
                    trackedThreadIds.remove(thread);
                    threadEnteredOrRemoved.signalAll();
                } finally {
                    schedulerLock.unlock();
                }
            }
        };
        joiningThread.setDaemon(true);
        joiningThread.start();

        // TODO: Move elsewhere if a more suitable place arises.
        // Note that newHandler is declared below this function declaration.
        Thread.setDefaultUncaughtExceptionHandler(newHandler);
    }

    private static final UncaughtExceptionHandler newHandler = new Thread.UncaughtExceptionHandler() {
                                                                 public void uncaughtException(Thread t, Throwable e)
                                                                 {
                                                                     System.out.println("Uncaught exception in Scheduler");
                                                                     e.printStackTrace();
                                                                     Initializer.end(1);
                                                                 }
                                                             };

    /**
     * Starts all scheduler threads.
     * 
     * @param connector
     *            a connector to the scheduling strategy this scheduler should use.
     * @throws IllegalStateException
     *             if the scheduler is already running.
     */
    public synchronized static void start(SchedulingStrategyConnector connector)
    {
        if (running)
            throw new IllegalStateException("Scheduler already running.");

        Scheduler.connector = connector;

        schedulerThread = new Thread(new Runnable() {

            public void run()
            {
                mainSchedulerLoop();
            }
        }, "MainSchedulerLoop");

        schedulerThread.setDaemon(true);
        schedulerThread.start();

        running = true;
    }

    /**
     * Stops all scheduler threads. After a successful call to this method the scheduler can be restarted with a
     * different {@link SchedulingStrategyConnector}.
     * 
     * @throws InterruptedException
     *             if the thread is interrupted before or while waiting for the scheduler threads to finish.
     * @throws IllegalStateException
     *             if the scheduler is not running.
     */
    public synchronized static void stop() throws InterruptedException
    {
        if (!running)
            throw new IllegalStateException("Scheduler is not running.");

        schedulerThread.interrupt();
        schedulerThread.join();
        running = false;
    }

    /**
     * @return <code>true</code> if the scheduler is running, <code>false</code> otherwise.
     */
    public synchronized static boolean isRunning()
    {
        return running;
    }

    private static void mainSchedulerLoop()
    {
        schedulerLock.lock();
        SchedulerWatchdog dog = new SchedulerWatchdog(trackedThreadIds);
        dog.start();

        try {
            Map<EventIdentity, SchedulerEvent> schedulableEvents = new HashMap<EventIdentity, SchedulerEvent>();

            boolean triedWaiting=false;

            MainLoop: while (!Thread.interrupted()) {

                dog.happy=true;

                /*
                 * Wait until there is at least one thread waiting to be scheduled and no tracked threads are outside
                 * the scheduler.
                 */
                while ((trackedThreadIds.size() - eventsPerThread.size()) > 0 || eventsPerThread.isEmpty() || triedWaiting) {
                    try {
                        threadEnteredOrRemoved.await();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        break MainLoop;
                    }
                }

                schedulableEvents.clear();
                for (EventOptions options : eventsPerThread.values())
                    for (SchedulerEvent event : options.getEvents())
                        schedulableEvents.put(event.getIdentity(), event);

                /*
                 * If no events are enabled, we have a bit of a problem.
                 */
                boolean containsEnabled = false;
                for (Event event : schedulableEvents.values())
                    if (event.isEnabled()) {
                        containsEnabled = true;
                        break;
                    }
                if (!containsEnabled) {
                    if (!triedWaiting && !waitingThreads.isEmpty()) {
                        try {
                            Thread.sleep(500);
                        } catch (InterruptedException e) {}
                        triedWaiting=true;
                        continue MainLoop;
                    }
                    Execution.communication.sendMessage("Deadlock");
                    System.err.println("No events to schedule!? Deadlock?");
                    System.exit(0);
                }

                triedWaiting = false;

                SchedulerEvent nextEvent = connector.getDecision(schedulableEvents);

                if (nextEvent != null) {
                    if (!schedulableEvents.containsKey(nextEvent.getIdentity()) || !nextEvent.isEnabled())
                        throw new RuntimeException("Event returned by scheduling strategy "
                                + "not in the set of schedulable events.");

                    nextEvent.apply();
                } else {
                    /*
                     * No event is to be run next so we shut down the VM.
                     */
                    System.out.println("No events outside sleep set to run. Shutting down.");
                    System.exit(0);
                }
            }
        } finally {
            schedulerLock.unlock();
            dog.stop=true;
        }
    }
}

class SchedulerWatchdog extends Thread {
    public volatile boolean happy=true;
    public volatile boolean stop=false;
    private Map<Thread, Integer> trackedThreads;
    public SchedulerWatchdog(Map<Thread, Integer> trackedThreads) {
        this.trackedThreads = trackedThreads;
    }
    public void run() {
        while (!stop) {
            happy=false;
            try {
                sleep(10000);
            } catch (InterruptedException e) {}
            if (!happy) {
                System.out.println("Scheduler watchdog biting!");
                System.out.println("Tracked threads:");
                for (Thread t : trackedThreads.keySet()) {
                    System.out.println("Thread " + t.getName() + "(" + trackedThreads.get(t) + ") is at:");
                    for (StackTraceElement e : t.getStackTrace()) {
                        System.out.println("\t" + e.toString());
                    }
                }
                System.out.println("\nDebug data:");
                for (Map.Entry<String, String> e : Scheduler.debugData.entrySet()) {
                    System.out.println(e.getKey() + ": " + e.getValue());
                }
                System.exit(1);
            }
        }
    }
}
