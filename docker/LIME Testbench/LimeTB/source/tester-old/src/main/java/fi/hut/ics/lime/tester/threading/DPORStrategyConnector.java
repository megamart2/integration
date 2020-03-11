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

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.Map.Entry;

import fi.hut.ics.lime.tester.communication.Communication;

/**
 * Implements the client side functionality of the dynamic partial-order reduction algorithm by Flanagan and Godefroid.
 * 
 * @author osaariki
 */
public class DPORStrategyConnector implements SchedulingStrategyConnector
{
    private static final String                          SCHEDULING_HEADER = "Scheduling:";
    private static final String                          BACKTRACK_HEADER  = "New backtrack:";
    private static final String                          SLEEPSET_HEADER   = "Changed sleepset:";

    private boolean                                      readsCommute;

    private Communication                                communication;
    private SchedulingStrategyConnector                  fallbackConnector;

    private Queue<EventSelection>                        serverSchedule;
    private HashSet<EventIdentity>                       sleepSet;

    private ArrayList<Event>                             transitionStack;
    private ArrayList<Map<Integer, Set<EventIdentity>>>  enabled;
    private Map<CommunicationObject, ArrayList<Integer>> rLastAccesses;
    private Map<CommunicationObject, Integer>            rwLastAccess;
    private Map<Integer, ThreadClock>                    clocksByThread;
    private Map<CommunicationObject, ThreadClock>        rClocksByCO;
    private Map<CommunicationObject, ThreadClock>        rwClocksByCO;

    /**
     * Constructs a new instance of {@link DPORStrategyConnector} with the specified connection to server, initial
     * schedule and fallback connector.
     * 
     * @param communication
     *            the connection to the server.
     * @param serverSchedule
     *            the initial schedule to execute.
     * @param fallbackConnector
     *            the connector to use as a fallback when the server schedule runs out.
     */
    public DPORStrategyConnector(Communication communication, Collection<EventSelection> serverSchedule, Collection<EventIdentity> potentialSleepSet,
            SchedulingStrategyConnector fallbackConnector, boolean readsCommute)
    {
        this.communication = communication;
        this.serverSchedule = new LinkedList<EventSelection>(serverSchedule);
        sleepSet = new HashSet<EventIdentity>(potentialSleepSet);
        this.fallbackConnector = fallbackConnector;
        this.readsCommute = readsCommute;
    }

    public void initialize()
    {
        fallbackConnector.initialize();

        transitionStack = new ArrayList<Event>();
        enabled = new ArrayList<Map<Integer, Set<EventIdentity>>>();
        rLastAccesses = new HashMap<CommunicationObject, ArrayList<Integer>>();
        rwLastAccess = new HashMap<CommunicationObject, Integer>();
        clocksByThread = new HashMap<Integer, ThreadClock>();
        rClocksByCO = new HashMap<CommunicationObject, ThreadClock>();
        rwClocksByCO = new HashMap<CommunicationObject, ThreadClock>();
    }

    public void close()
    {
        fallbackConnector.close();
    }

    public <T extends Event> T getDecision(Map<? extends EventIdentity, T> options)
    {
        Map<EventIdentity, T> enabledEvents = new HashMap<EventIdentity, T>();
        for (T event : options.values())
            if (event.isEnabled())
                enabledEvents.put(event.getIdentity(), event);

        T decision = null;
        if (!serverSchedule.isEmpty()) {
            /*
             * Replay the server provided schedule to the end.
             */
            EventSelection serverSelection = serverSchedule.remove();
            decision = enabledEvents.get(serverSelection.getSelectedEvent());

            if (decision == null || !enabledEvents.keySet().equals(serverSelection.getOptions())) {
                /*
                 * TODO: This isn't really the right thing to do currently, as the server can't tolerate the client
                 * deviating from the desired execution path. However throwing an exception here would also be ugly.
                 * The server should be rewritten to allow the client to follow unexpected execution paths.
                 */
                decision=null;
                serverSchedule.clear();
                sleepSet.clear();
            }
        }

        if (decision==null) {
            /*
             * This is where all the main logic of the DPOR is.
             */

            Map<Integer, Event> eventsPerThread = new HashMap<Integer, Event>();
            for (Entry<? extends EventIdentity, ? extends Event> entry : options.entrySet()) {
                eventsPerThread.put(entry.getKey().getExecutingThreadId(), entry.getValue());
            }

            for (Entry<Integer, Event> entry : eventsPerThread.entrySet()) {
                int thread = entry.getKey();
                Event event = entry.getValue();
                CommunicationObject co = event.getCommunicationObject();

                /*
                 * If the event is a pure read from a communication object, then the candidate backtracking point is
                 * the last read-write transition. Reads between the last read-write transition and this transition are
                 * skipped, as different interleavings of reads produce the same result.
                 * 
                 * If the event is not a pure read the collected stack of read accesses is traversed backwards until a
                 * backtracking point is found or the stack ends.
                 */
                if (event.getType() == Event.Type.READ && readsCommute) {
                    if (rwLastAccess.containsKey(co)) {
                        int transitionIndex = rwLastAccess.get(co);
                        handlePotentialBacktrack(transitionIndex, thread);
                    }
                } else {
                    if (rLastAccesses.containsKey(co)) {
                        ArrayList<Integer> accesses = rLastAccesses.get(co);
                        for (int i = accesses.size() - 1; i >= 0; --i) {
                            boolean handled = handlePotentialBacktrack(accesses.get(i), thread);
                            if (handled)
                                break;
                        }
                    }
                }
            }

            decision = selectOne(enabledEvents);
        }

        if (decision != null) {
            if (serverSchedule.isEmpty()) {
                boolean changed = false;
                Iterator<EventIdentity> iter = sleepSet.iterator();
                while (iter.hasNext()) {
                    EventIdentity identity = iter.next();
                    T event = options.get(identity);
                    if (event != null && decision.mightBeDependentWith(event)) {
                        iter.remove();
                        changed = true;
                    }
                }
                if (changed)
                    reportChangedSleepSet(sleepSet);
            }

            recordSelection(decision, enabledEvents);
            reportScheduling(new EventSelection(decision.getIdentity(), enabledEvents.keySet()));
        }

        return decision;
    }

    private boolean handlePotentialBacktrack(int transitionIndex, int thread)
    {
        Event transitionAtI = transitionStack.get(transitionIndex);
        ThreadClock clock = getClockForThread(thread);

        if (transitionIndex > clock.get(transitionAtI.getIdentity().getExecutingThreadId())) {
            Map<Integer, Set<EventIdentity>> enabledAtI = enabled.get(transitionIndex);
            Set<EventIdentity> newBacktracks = new HashSet<EventIdentity>();
            if (enabledAtI.containsKey(thread)) {
                newBacktracks.addAll(enabledAtI.get(thread));
            } else {
                for (Set<EventIdentity> events : enabledAtI.values()) {
                    newBacktracks.addAll(events);
                }
            }
            // Ensure that the transition this execution explored is not added to backtrack.
            newBacktracks.remove(transitionStack.get(transitionIndex).getIdentity());

            if (newBacktracks.size() > 0)
                reportBacktrack(transitionIndex, newBacktracks);

            return true; // This was a backtracking point.
        } else {
            return false; // This was not a backtracking point.
        }
    }

    private <T extends Event> T selectOne(Map<EventIdentity, T> events)
    {
        Map<EventIdentity, T> allowedEvents = new HashMap<EventIdentity, T>(events);
        allowedEvents.keySet().removeAll(sleepSet);

        boolean containsEnabled = false;
        for (Event event : allowedEvents.values())
            if (event.isEnabled()) {
                containsEnabled = true;
                break;
            }

        if (!containsEnabled) {
            return null;
        } else {
            /*
             * TODO: This affects the efficiency of DPOR. Look into good heuristics (there are papers about this,
             * at least one from uiuc).
             */
            return fallbackConnector.getDecision(allowedEvents);
        }
    }

    private ThreadClock getClockForThread(int thread)
    {
        if (clocksByThread.containsKey(thread))
            return clocksByThread.get(thread);
        else {
            ThreadClock newClock = new ThreadClock();
            clocksByThread.put(thread, newClock);
            return newClock;
        }
    }

    private ThreadClock getRWClockForCO(CommunicationObject co)
    {
        if (rwClocksByCO.containsKey(co))
            return rwClocksByCO.get(co);
        else {
            ThreadClock newClock = new ThreadClock();
            rwClocksByCO.put(co, newClock);
            return newClock;
        }
    }

    private ThreadClock getRClockForCO(CommunicationObject co)
    {
        if (rClocksByCO.containsKey(co))
            return rClocksByCO.get(co);
        else {
            ThreadClock newClock = new ThreadClock();
            rClocksByCO.put(co, newClock);
            return newClock;
        }
    }

    private <T extends Event> void recordSelection(T decision, Map<EventIdentity, T> options)
    {
        Map<Integer, Set<EventIdentity>> enabledEvents = new HashMap<Integer, Set<EventIdentity>>();
        for (Event event : options.values()) {
            int threadId = event.getIdentity().getExecutingThreadId();
            Set<EventIdentity> eventsForThread = null;
            if (enabledEvents.containsKey(threadId)) {
                eventsForThread = enabledEvents.get(threadId);
            } else {
                eventsForThread = new HashSet<EventIdentity>();
                enabledEvents.put(threadId, eventsForThread);
            }

            eventsForThread.add(event.getIdentity());
        }
        enabled.add(enabledEvents);

        int transitionIndex = transitionStack.size(); // The index starts from zero and is the point before the event.
        transitionStack.add(decision);

        CommunicationObject co = decision.getCommunicationObject();
        int thread = decision.getIdentity().getExecutingThreadId();
        ThreadClock threadClock = getClockForThread(thread);

        /*
         * The selected thread's vector clock is updated so that it is greater than or equal to the vector clocks of
         * all preceding dependent events. All the preceding vector clocks are not stored. Instead for each CO two
         * VCs are used: one that aggregates VCs from all events (the "read clock") and one that aggregates VCs from
         * all events except pure read ones (the "read-write clock").
         */
        if (decision.getType() == Event.Type.READ && readsCommute) {
            /*
             * By updating with the read-write clock the vector clock updates from other pure read events (after the
             * last read-write event) are skipped.
             */
            if (rwClocksByCO.containsKey(co))
                threadClock.merge(rwClocksByCO.get(co));

            threadClock.set(thread, transitionIndex);

            getRClockForCO(co).merge(threadClock); // The read clock is updated for all events.
        } else {
            /*
             * As read-write events can be dependent with all other events on this CO the thread's VC is updated with
             * the read clock (which aggregates VCs from all events).
             */
            if (rClocksByCO.containsKey(co))
                threadClock.merge(rClocksByCO.get(co));

            threadClock.set(thread, transitionIndex);

            getRClockForCO(co).merge(threadClock); // The read clock is updated for all events.
            getRWClockForCO(co).merge(threadClock); // The read-write clock is also updated.
        }

        switch (decision.getType()) {
        case INSIDEMONITOR:
            /*
             * The last access is not updated, because other events on this monitor object can never be co-enabled with
             * this event.
             */
            break;
        case READ:
            if (readsCommute) {
                ArrayList<Integer> accesses = getLastReadAccesses(co);
                accesses.add(transitionIndex);
                break;
            }
        default:
            ArrayList<Integer> accesses = getLastReadAccesses(co);
            accesses.clear();
            accesses.add(transitionIndex);
            rwLastAccess.put(co, transitionIndex);
        }
    }

    private ArrayList<Integer> getLastReadAccesses(CommunicationObject co)
    {
        ArrayList<Integer> accesses;
        if (rLastAccesses.containsKey(co)) {
            accesses = rLastAccesses.get(co);
        } else {
            accesses = new ArrayList<Integer>();
            rLastAccesses.put(co, accesses);
        }
        return accesses;
    }

    private void reportChangedSleepSet(Set<EventIdentity> sleepSet)
    {
        StringBuilder sb = new StringBuilder(SLEEPSET_HEADER);

        sb.append(' ').append(Schedules.formatEventList(sleepSet));

        communication.sendMessage(sb.toString());
    }

    private void reportBacktrack(int i, Set<EventIdentity> backtracks)
    {
        StringBuilder sb = new StringBuilder(BACKTRACK_HEADER);

        sb.append(' ').append(Schedules.formatBacktrack(i, backtracks));

        communication.sendMessage(sb.toString());
    }

    private void reportScheduling(EventSelection selection)
    {
        StringBuilder sb = new StringBuilder(SCHEDULING_HEADER);

        sb.append(' ').append(Schedules.formatEventSelection(selection));

        communication.sendMessage(sb.toString());
    }
}
