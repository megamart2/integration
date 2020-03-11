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

public class RandomPriority extends BasicSearchStrategy implements ExecutionStrategy {

    private int heuristicValue;


    public RandomPriority (Object o)
    {
        super(o);
        heuristicValue      = -1;
    }



    @Override
    public void inform (String message)
    {
        if (message.startsWith("Heuristic value:")) {
            String value = message.substring(17);
            heuristicValue = Integer.valueOf(value).intValue();
        }
        else
            super.inform(message);
    }



    @Override
    protected SymbolicExecutionNode selectNextNode() {
        return ((RandomTree)tree).getNextNode();
    }



    @Override
    protected void handleNewOpenBranch(SymbolicExecutionNode node) {
        RandomTree t = (RandomTree)tree;

        if (heuristicValue < 0)
            t.markPathOpen((PriorityNode)node);
        else
            t.markPathOpen((PriorityNode)node, heuristicValue);
    }



    @Override
    SymbolicExecutionNode getNewNode(SymbolicExecutionNode node) {
        return new PriorityNode((PriorityNode)node);
    }
}
