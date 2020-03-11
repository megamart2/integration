/*
Copyright (c) 2009 Helsinki University of Technology (TKK)

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

import java.util.Random;

import fi.hut.ics.lime.tester.server.SystemInformation;

/**
 * This search strategy aims to obtain good branch coverage of the system
 * under test by keeping track of the unvisited nodes that resulted from
 * branches in the programs control flow that have not yet been executed.
 * If such nodes exist, they are selected first by this strategy. In other
 * cases the node to be expanded is selected randomly.
 */
public class BranchCoverageStrategy extends BasicSearchStrategy implements ExecutionStrategy
{
    private int nextBranch;
    private Random r;
    private int heuristicValue;
    private int heuristicPercentage;


    public BranchCoverageStrategy (Object o)
    {
        super(o);
        r                       = new Random();
        heuristicValue          = -1;
        heuristicPercentage     = SystemInformation.getHeuristicPercentage();
    }



    @Override
    protected SymbolicExecutionNode selectNextNode() {
        PriorityNode result = null;

        result = ((BranchCoverageTree)tree).getBranchCoverageNode();
        
        if (result == null && r.nextInt(100) < heuristicPercentage)
            result = ((RandomTree)tree).getNextNode();
        else if (result == null)
            result = ((RandomTree)tree).getRandomNode();

        return result;
    }



    @Override
    public void inform (String message)
    {
        if (message.startsWith("Branch ID:")) {
            String[] s = message.substring(11).split(" ");

            nextBranch = Integer.valueOf(s[0]).intValue();
            nextBranch *= 2;
            
            if (!s[1].equals("true")) {
                ((BranchCoverageTree)tree).coverBranch(nextBranch);
                nextBranch++;
            }
            else {
                 ((BranchCoverageTree)tree).coverBranch(nextBranch + 1);
            }
        }
        else
            super.inform(message);
    }


    
    @Override
    void handleNewOpenBranch(SymbolicExecutionNode node)
    {
        RandomTree t = (RandomTree)tree;

        if (heuristicValue < 0)
            t.markPathOpen((PriorityNode)node);
        else
            t.markPathOpen((PriorityNode)node, heuristicValue);

        if (!SystemInformation.hasBranchBeenCovered(nextBranch)) {
            ((BranchCoverageTree)tree).addBranchCoverageNode((PriorityNode)node, nextBranch);
        }
    }


    
    @Override
    SymbolicExecutionNode getNewNode(SymbolicExecutionNode node) {
        return new PriorityNode((PriorityNode)node);
    }

}
