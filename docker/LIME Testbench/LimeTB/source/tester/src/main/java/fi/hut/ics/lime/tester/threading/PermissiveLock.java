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

import java.util.Collection;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.AbstractQueuedSynchronizer;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

/**
 * A non-reentrant mutual exclusion FIFO {@link Lock} that allows locking and unlocking to occur from any thread. Thus
 * this lock has no "owning" thread and it can be unlocked from a different thread than in which it was locked. Extra
 * care should be used when performing synchronization with this lock to ensure correct behavior.
 * 
 * @author osaariki
 */
public class PermissiveLock implements Lock
{
    /**
     * A basic synchronizer based on the AbstractQueuedSynchronizer.
     * 
     * @author osaariki
     * @see AbstractQueuedSynchronizer
     */
    private class BasicSynchronizer extends AbstractQueuedSynchronizer
    {
        private static final long serialVersionUID = 1L;

        @Override
        protected boolean tryAcquire(int arg)
        {
            return compareAndSetState(0, 1);
        }

        @Override
        protected int tryAcquireShared(int arg)
        {
            // Forbid shared ownership
            return -1;
        }

        @Override
        protected boolean tryRelease(int arg)
        {
            setState(0);
            return true;
        }

        @Override
        protected boolean tryReleaseShared(int arg)
        {
            // Shared releases have no effect
            return false;
        }

        @Override
        protected boolean isHeldExclusively()
        {
            return getState() == 1;
        }

        /**
         * @return a new {@link Condition} linked to this synchronizer.
         */
        public Condition createCondition()
        {
            return new ConditionObject();
        }
    }

    private BasicSynchronizer synchronizer;
    private Thread owner=null;
    private StackTraceElement[] stack={};

    private synchronized void locking() {
        owner = Thread.currentThread();
        stack = owner.getStackTrace();
    }

    private synchronized void unlocking() {;
        owner = null;
        stack = new StackTraceElement[0];
    }

    /**
     * Creates an instance of {@link PermissiveLock}.
     */
    public PermissiveLock()
    {
        synchronizer = new BasicSynchronizer();
    }

    public Thread getOwner() {
        return owner;
    }

    public StackTraceElement[] getStack() {
        return stack;
    }

    public void lock()
    {
        synchronizer.acquire(0);
        locking();
    }

    public void lockInterruptibly() throws InterruptedException
    {
        synchronizer.acquireInterruptibly(0);
        locking();
    }

    public Condition newCondition()
    {
        return synchronizer.createCondition();
    }

    public boolean tryLock()
    {
        boolean ret = synchronizer.tryAcquire(0);
        locking();
        return ret;
    }

    public boolean tryLock(long timeout, TimeUnit unit) throws InterruptedException
    {
        boolean ret = synchronizer.tryAcquireNanos(1, unit.toNanos(timeout));
        locking();
        return ret;
    }

    public void unlock()
    {
        synchronizer.release(0);
        unlocking();
    }

    /**
     * @return <code>true</code> if this lock is locked (by any thread), <code>false</code> otherwise.
     */
    public boolean isLocked()
    {
        return synchronizer.isHeldExclusively();
    }

    /**
     * @param thread
     *            the thread to check.
     * @return true if the thread is in the waiting queue of this lock. False otherwise.
     */
    public boolean isQueued(Thread thread)
    {
        return synchronizer.isQueued(thread);
    }

    /**
     * @return a collection of the threads waiting on this lock.
     */
    public Collection<Thread> getQueuedThreads()
    {
        return synchronizer.getQueuedThreads();
    }
}
