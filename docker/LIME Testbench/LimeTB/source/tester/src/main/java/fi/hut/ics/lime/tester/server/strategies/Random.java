/*
Copyright (c) 2008 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester.server.strategies;

import java.util.Collections;
import java.util.Set;

import fi.hut.ics.lime.tester.server.SystemInformation;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;

public class Random implements ExecutionStrategy {

    private boolean isFinished;
    private BasicTree tree;

    public Random (Object o)
    {
        tree = (BasicTree)o;

        isFinished = false;
    }

    public String getInputs()
    {

        if (SystemInformation.getNumberOfRuns() > 0) {
            SystemInformation.setNumberOfRuns(SystemInformation.getNumberOfRuns() - 1);

            return "empty";
        }
        else if (SystemInformation.getNumberOfRuns() == -1)
            return "empty";

        return "All done.";
    }




    public boolean isFinished()
    {
       return isFinished;
    }



    public void setFinished (String reason)
    {
        isFinished = true;
    }



    public void addBranch (String condition, boolean branch, int id, String path)
    {

    }

    public void addLimits (String symbolicVariable, String min, String max)
    {

    }


    public void addAssignment (String condition)
    {

    }

    public void updatePath(String path)
    {

    }

    public void addPointerCondition (String condition, boolean branch, String path)
    {

    }

    public void inform (String message)
    {

    }

    public void scheduled(EventSelection selection)
    {
        
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

    public void computeNewInputs()
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getPrimitiveInputs()
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getReferenceInputs()
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Iterable<EventSelection> getScheduling()
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Iterable<EventIdentity> getSleepSet()
    {
        return Collections.emptySet();
    }

	public void addMethodCall(String signature)
	{

	}

	
}
