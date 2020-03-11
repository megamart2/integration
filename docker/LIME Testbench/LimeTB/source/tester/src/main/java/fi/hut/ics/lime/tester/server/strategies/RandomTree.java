/*
Copyright (c) 2008 - 2009 Helsinki University of Technology (TKK)

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
import java.util.concurrent.PriorityBlockingQueue;
import java.util.Vector;


public class RandomTree extends SymbolicExecutionTree {
    protected PriorityBlockingQueue<PriorityNode> priorityQueue;
    protected Vector<PriorityNode> nodeVector;
    private Random r;


    public RandomTree() 
    {
        PriorityNode newRoot =  new PriorityNode();

        setRoot(newRoot);

        newRoot.setParent(null);
        newRoot.setLeft(null);
        newRoot.setRight(null);
        newRoot.setFinished(false);

        newRoot.priority = 0;

        newRoot.setArithmeticConstraint("empty");
        newRoot.setReferenceConstraint("empty");

        r = new Random();

        priorityQueue = new PriorityBlockingQueue<PriorityNode>();
        priorityQueue.put(newRoot);

        nodeVector = new Vector<PriorityNode>();
        nodeVector.add(newRoot);
    }



    public void markPathOpen(PriorityNode node)
    {
        node.priority = (short)r.nextInt(1000);
        priorityQueue.put(node);
        
        nodeVector.add(node);
    }



    public void markPathOpen(PriorityNode node, int value)
    {
        node.priority = (short)value;
        priorityQueue.put(node);

        nodeVector.add(node);
    }



    public PriorityNode getNextNode()
    {
        if (root.isFinished())
            return null;

        PriorityNode node = null;
        try { node = priorityQueue.take(); }
        catch (InterruptedException e) {}

        if (node != null)
            nodeVector.remove(node);

        return node;
    }


    
    public synchronized PriorityNode getRandomNode()
    {
        if (root.isFinished())
            return null;

        int numberOfNodes = nodeVector.size();
        //TODO: fix this. blocking till new inputs!!
        if (numberOfNodes == 0) {
            //System.out.println("getRandomNode 0");
            return null;
        }
        int randomValue = r.nextInt(numberOfNodes);

        PriorityNode node = nodeVector.remove(randomValue);

        priorityQueue.remove(node);

        return node;
    }
}
