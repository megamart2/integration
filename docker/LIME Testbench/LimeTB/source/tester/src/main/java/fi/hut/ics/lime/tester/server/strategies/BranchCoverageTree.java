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

import java.util.TreeMap;
import java.util.LinkedList;

public class BranchCoverageTree extends RandomTree {
    private TreeMap<Integer,LinkedList<PriorityNode>> nodesToBeVisited;


    public BranchCoverageTree ()
    {
        super();
        nodesToBeVisited = new TreeMap<Integer,LinkedList<PriorityNode>>();
    }



    public void coverBranch (int branch) {
        nodesToBeVisited.remove(branch);
    }


    
    public void addBranchCoverageNode (PriorityNode node, int branch)
    {
        if (nodesToBeVisited.get(branch) == null) {
            LinkedList<PriorityNode> list = new LinkedList<PriorityNode>();
            list.add(node);
            nodesToBeVisited.put(branch, list);
        }
        else {
            LinkedList<PriorityNode> list = nodesToBeVisited.get(branch);
            list.add(node);
        }      
    }

    

    public PriorityNode getBranchCoverageNode()
    {
        if (nodesToBeVisited.isEmpty())
            return null;

        LinkedList<PriorityNode> list = nodesToBeVisited.remove(nodesToBeVisited.firstKey());

        PriorityNode node = list.removeFirst();

        nodeVector.remove(node);
        priorityQueue.remove(node);

        return node;
    }
}
