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

import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import fi.hut.ics.lime.tester.threading.EventIdentity;

/**
 * A node in the tree of schedules for the "dpor only" and "schedules only" strategies.
 * 
 * @author osaariki
 */
public class SchedulesOnlyNode
{
    private SchedulesOnlyNode                         parent;
    private TreeMap<EventIdentity, SchedulesOnlyNode> explored;
    private TreeSet<EventIdentity>                        enabled;
    private TreeSet<EventIdentity>                        backtrack;

    /**
     * Constructs a new instance of {@link SchedulesOnlyNode} with the specified parent.
     * 
     * @param parent
     *            the parent.
     */
    public SchedulesOnlyNode(SchedulesOnlyNode parent)
    {
        this.parent = parent;
        explored = new TreeMap<EventIdentity, SchedulesOnlyNode>();
        enabled = null;
        backtrack = new TreeSet<EventIdentity>();
    }

    /**
     * @return the parent
     */
    public SchedulesOnlyNode getParent()
    {
        return parent;
    }

    /**
     * @return a map from transitions that have been explored from this node to the children they lead to.
     */
    public TreeMap<EventIdentity, SchedulesOnlyNode> getExplored()
    {
        return explored;
    }

    /**
     * @return the set of events (transitions) enabled in this node.
     */
    public TreeSet<EventIdentity> getEnabled()
    {
        return enabled;
    }

    /**
     * @return the backtrack set of this node.
     */
    public TreeSet<EventIdentity> getBacktrack()
    {
        return backtrack;
    }

    /**
     * Sets the set of enabled transitions in this node.
     * 
     * @param enabled
     *            the set of enabled events.
     */
    public void setEnabled(Set<? extends EventIdentity> enabled)
    {
        this.enabled = new TreeSet<EventIdentity>(enabled);
    }

    /**
     * @param event
     *            the transition that lead to the subtree.
     * @param subTree
     *            the subtree.
     */
    public void addExplored(EventIdentity event, SchedulesOnlyNode subTree)
    {
        assert !explored.containsKey(event) && enabled.contains(event);
        explored.put(event, subTree);
    }

    /**
     * @param event
     *            the backtrack to add.
     */
    public void addBacktracks(Set<EventIdentity> events)
    {
        assert enabled.containsAll(events);
        backtrack.addAll(events);
    }
}
