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

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeSet;
import java.util.Map.Entry;

import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;

/**
 * The root of the tree that keeps track of explored schedules in the "dpor only" strategy.
 * 
 * @author osaariki
 */
public class SchedulesOnlyTree
{
    private SchedulesOnlyNode root;

    /**
     * @return an unexplored schedule or null if all schedules have been explored.
     */
    public synchronized Iterable<EventSelection> getUnexploredScheduleDFS()
    {
        LinkedList<EventSelection> schedule = new LinkedList<EventSelection>();

        if (root != null) {
            boolean found = findUnexploredDFS(root, schedule);
            if (found)
                return schedule;
            else
                return null;
        } else
            return schedule;
    }

    @SuppressWarnings("unchecked")
    private boolean findUnexploredDFS(SchedulesOnlyNode localRoot, LinkedList<EventSelection> schedule)
    {
        for (Entry<EventIdentity, SchedulesOnlyNode> entry : localRoot.getExplored().entrySet()) {
            boolean found = findUnexploredDFS(entry.getValue(), schedule);
            if (found) {
                schedule.addFirst(new EventSelection(entry.getKey(), localRoot.getEnabled()));
                return true;
            }
        }

        TreeSet<EventIdentity> enabled = localRoot.getEnabled();
        if (enabled != null) {
            TreeSet<EventIdentity> enabledClone = (TreeSet<EventIdentity>) enabled.clone();
            enabledClone.removeAll(localRoot.getExplored().keySet());
            if (!enabledClone.isEmpty()) {
                EventIdentity selected = enabledClone.first();
                enabledClone.remove(selected);
                schedule.addFirst(new EventSelection(selected, localRoot.getEnabled()));
                return true;
            } else
                return false;
        } else
            return false;
    }

    /**
     * @return a schedule to an unexplored backtrack or null if all backtracks have been explored.
     */
    public synchronized Iterable<EventSelection> getUnexploredBacktrackScheduleDFS()
    {
        LinkedList<EventSelection> schedule = new LinkedList<EventSelection>();

        if (root != null) {
            boolean found = findBacktrackDFS(root, schedule);
            if (found)
                return schedule;
            else
                return null;
        } else
            return schedule;
    }

    @SuppressWarnings("unchecked")
    private boolean findBacktrackDFS(SchedulesOnlyNode localRoot, LinkedList<EventSelection> schedule)
    {
        for (Entry<EventIdentity, SchedulesOnlyNode> entry : localRoot.getExplored().entrySet()) {
            boolean found = findBacktrackDFS(entry.getValue(), schedule);
            if (found) {
                schedule.addFirst(new EventSelection(entry.getKey(), localRoot.getEnabled()));
                return true;
            }
        }

        TreeSet<EventIdentity> backtrack = (TreeSet<EventIdentity>) localRoot.getBacktrack().clone();
        backtrack.removeAll(localRoot.getExplored().keySet());
        if (!backtrack.isEmpty()) {
            EventIdentity selected = backtrack.first();
            backtrack.remove(selected);
            schedule.addFirst(new EventSelection(selected, localRoot.getEnabled()));
            return true;
        } else
            return false;
    }

    /**
     * Returns a child of the specified "current" node based on an {@link EventSelection}. A new child is created if it
     * doesn't exist.
     * 
     * @param current
     *            the node to descend from.
     * @param selection
     *            the selection to descend by.
     * @return the child node.
     */
    public synchronized SchedulesOnlyNode descendInTree(SchedulesOnlyNode current, EventSelection selection)
    {
        if (current == null) {
            if (root == null) {
                root = new SchedulesOnlyNode(null);
            }
            current = root;
        }

        if (current.getEnabled() == null)
            current.setEnabled(new TreeSet<EventIdentity>(selection.getOptions()));
        else
            assert current.getEnabled().equals(selection.getOptions()); // TODO: Handle gracefully.

        assert current.getEnabled().containsAll(selection.getOptions());

        SortedMap<EventIdentity, SchedulesOnlyNode> explored = current.getExplored();
        EventIdentity selectedEvent = selection.getSelectedEvent();
        if (explored.containsKey(selectedEvent))
            return explored.get(selectedEvent);
        else {
            SchedulesOnlyNode subTree = new SchedulesOnlyNode(current);
            current.addExplored(selectedEvent, subTree);
            return subTree;
        }
    }

    /**
     * Adds the specified backtracks to the position in the given transition stack specified by the given transition
     * number. A transition number of zero refers to the root of the schedule tree. The transition stack must be at
     * least the size of the transition number.
     * 
     * @param transitionNum
     *            the position to add to.
     * @param backtrack
     *            the backtracks to add.
     * @param transitionStack
     *            the transition stack.
     */
    public synchronized void addBacktrack(int transitionNum, Set<EventIdentity> backtrack,
            Iterable<EventSelection> transitionStack)
    {
        Iterator<EventSelection> iter = transitionStack.iterator();
        SchedulesOnlyNode current = root;
        for (int i = 0; i < transitionNum; ++i) {
            EventSelection selection = iter.next();

            assert current.getEnabled().containsAll(selection.getOptions());

            current = current.getExplored().get(selection.getSelectedEvent());
        }

        current.addBacktracks(backtrack);
    }
}
