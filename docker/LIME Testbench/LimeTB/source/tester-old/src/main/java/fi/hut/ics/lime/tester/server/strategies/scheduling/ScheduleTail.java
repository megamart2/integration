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

package fi.hut.ics.lime.tester.server.strategies.scheduling;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Map.Entry;

import fi.hut.ics.lime.tester.threading.EventIdentity;

/**
 * A tail for a node that corresponds to a scheduling point.
 * 
 * @author osaariki
 */
public class ScheduleTail extends ExecutionNodeTail
{
    private TreeMap<EventIdentity, ExecutionNodeHead>  children;
    private HashMap<EventIdentity, Set<EventIdentity>> sleepSets;
    private HashSet<EventIdentity>                     nextSleepSet;
    private TreeSet<EventIdentity>                     enabled;

    /**
     * Creates a new instance of {@link ScheduleTail} with the specified enabled events.
     * 
     * @param enabled
     *            the set of the events enabled at this point.
     * @param baseSleepSet
     *            the sleep set inherited from the previous event.
     */
    public ScheduleTail(Set<? extends EventIdentity> enabled, Set<EventIdentity> baseSleepSet)
    {
        children = new TreeMap<EventIdentity, ExecutionNodeHead>();
        sleepSets = new HashMap<EventIdentity, Set<EventIdentity>>();
        nextSleepSet = new HashSet<EventIdentity>(baseSleepSet);
        this.enabled = new TreeSet<EventIdentity>(enabled);
    }

    @Override
    public Collection<ExecutionNodeHead> getChildren()
    {
        return children.values();
    }

    /**
     * @param event
     *            the event to get the subtree for.
     * @return the corresponding subtree's root.
     */
    public ExecutionNodeHead getChild(EventIdentity event)
    {
        return children.get(event);
    }

    /**
     * @return the set of existing event-subtree pairs.
     */
    public Set<Entry<EventIdentity, ExecutionNodeHead>> getChildEntries()
    {
        return children.entrySet();
    }

    /**
     * @param event
     *            the event to get the sleep set for.
     * @return the sleep set.
     */
    public Set<EventIdentity> getSleepSet(EventIdentity event)
    {
        return sleepSets.get(event);
    }

	/**
	 * Get all the sleepsets (used when writing to disk)
	 *
	 * @return all sleepsets (used in writing the tree to disk)
	 */
	public Set<Entry<EventIdentity, Set<EventIdentity>>> directGetSleepSets() {
		return this.sleepSets.entrySet();
	}

	/**
	 * Add individual sleepsets (used in rebuilding from disk)
	 *
	 * @param eventId
	 *            the eventidentity corresponding to the sleepset
	 * @param sleepSet
	 *            the sleepset to be added
	 */
	public void directAddSleepSet(EventIdentity eventId, Set<EventIdentity> sleepSet) {
		this.sleepSets.put(eventId, new HashSet<EventIdentity>(sleepSet));
	}

	/**
	 * @return nextsleepset
	 */
	public Set<EventIdentity> directGetNextSleepSet() {
		return this.nextSleepSet;
	}

    /**
     * @return the set of events (transitions) enabled in this node.
     */
    public TreeSet<EventIdentity> getEnabled()
    {
        return enabled;
    }

    /**
     * @param event
     *            the event to add a subtree for.
     * @param node
     *            the subtree root.
     */
    public void addChild(EventIdentity event, ExecutionNodeHead node)
    {
        if (!enabled.contains(event))
            throw new RuntimeException("Event to add not in set of enabled events.");

        if (!children.containsKey(event)) {
            children.put(event, node);
            sleepSets.put(event, new HashSet<EventIdentity>(nextSleepSet));
            nextSleepSet.add(event);
        } else
            throw new RuntimeException("Child already exists.");
    }

	/**
	 * Add individual children directly (used in rebuilding from disk)
	 *
	 * @param eventid
	 *            the eventidentity corresponding to the child node
	 * @param node
	 *            the child node to be added
	 */
	public void directAddChild(EventIdentity eventId, ExecutionNodeHead node) {
		this.children.put(eventId, node);
	}

    /**
     * @param events
     *            the events to add backtracking points for.
     * @param nodeFactory
     *            a factory for obtaining new nodes to add as backtracking points.
     * @return the set of new nodes that were added as backtracking points.
     */
    public Set<ExecutionNodeHead> addBacktracks(Set<EventIdentity> events, ExecutionNodeHeadFactory nodeFactory)
    {
        if (!enabled.containsAll(events))
            throw new RuntimeException("Events to add not in set of enabled events.");

        Set<ExecutionNodeHead> newNodes = new HashSet<ExecutionNodeHead>();

        for (EventIdentity event : events) {
            if (!children.containsKey(event)) {
                ExecutionNodeHead newChild = nodeFactory.createExecutionNodeHead();
                newChild.setBranchString(newChild.getParent().getBranchString() + event);
                addChild(event, newChild);
                newNodes.add(newChild);
            }
        }

        return newNodes;
    }
}
