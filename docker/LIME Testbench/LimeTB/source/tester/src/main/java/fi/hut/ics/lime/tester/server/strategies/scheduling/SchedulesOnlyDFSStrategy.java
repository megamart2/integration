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

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import fi.hut.ics.lime.tester.server.strategies.ExecutionStrategy;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;

/**
 * This class implements an execution strategy that goes through all schedules in depth first order. This execution
 * strategy does not go through executions reachable with different input values.
 * 
 * @author osaariki
 */
public class SchedulesOnlyDFSStrategy implements ExecutionStrategy
{
    private SchedulesOnlyTree        tree;
    private Iterable<EventSelection> serverSchedule;
    private List<EventSelection>     transitionStack;
    private SchedulesOnlyNode        current;
    private boolean                  finished;

    /**
     * Creates a new instance of {@link SchedulesOnlyDFSStrategy} with the specified execution tree.
     * 
     * @param executionTree
     */
    public SchedulesOnlyDFSStrategy(Object executionTree)
    {
        tree = (SchedulesOnlyTree) executionTree;
        transitionStack = new ArrayList<EventSelection>();
        finished = false;
    }

    public void addAssignment(String condition)
    {
    }

    public void addBranch(String condition, boolean branch, int id, String path)
    {
    }

    public void addLimits(String symbolicValue, String min, String max)
    {
    }

    public void addPointerCondition(String condition, boolean branch, String path)
    {
    }

    public void updatePath(String path)
    {
    }

    public void computeNewInputs()
    {
        serverSchedule = tree.getUnexploredScheduleDFS();

        if (serverSchedule == null)
            finished = true;
    }

    public String getPrimitiveInputs()
    {
        if (serverSchedule != null)
            return "Solved: ";
        else
            return "All done.";
    }

    public String getReferenceInputs()
    {
        return "Solved: ";
    }

    public Iterable<EventSelection> getScheduling()
    {
        if (serverSchedule != null)
            return serverSchedule;
        else
            return Collections.emptyList();
    }

    public Iterable<EventIdentity> getSleepSet()
    {
        return Collections.emptyList();
    }

    public void inform(String message)
    {
    }

    public boolean isFinished()
    {
        return finished;
    }

    public void scheduled(EventSelection selection)
    {
        transitionStack.add(selection);
        current = tree.descendInTree(current, selection);
    }

    public void addBacktrack(int transitionNum, Set<EventIdentity> backtrack)
    {
    }

    public void updateSleepSet(Set<EventIdentity> sleepSet)
    {
    }

    public boolean isPartialOrderReductionStrategy()
    {
        return false;
    }

    public void setFinished(String reason)
    {
        finished = true; // TODO: Mark the current node.
    }

	public void addMethodCall(String signature)
	{
	}

}