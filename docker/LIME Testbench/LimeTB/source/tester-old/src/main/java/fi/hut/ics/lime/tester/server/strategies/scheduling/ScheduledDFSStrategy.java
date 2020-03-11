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
import java.util.Stack;

/**
 * A search strategy for the {@link SimpleScheduledTree} that searches in DFS order.
 * 
 * @author osaariki
 */
public class ScheduledDFSStrategy extends BasicScheduledSearchStrategy
{

    /**
     * Creates a new instance of {@link ScheduledDFSStrategy} with the specified search tree.
     * 
     * @param o
     *            an instance of {@link SimpleScheduledTree}.
     */
    public ScheduledDFSStrategy(Object o)
    {
        super(o);
    }

    @Override
    ExecutionNodeHead selectNextNode()
    {
        if (tree.getRoot().isFinished())
            return null;

        return search(tree.getRoot());
    }

    @Override
    synchronized void handleNewOpenBranch(ExecutionNodeHead node)
    {
        this.notifyAll();
    }

    @Override
    synchronized ExecutionNodeHead getNewNode(ExecutionNodeHead node)
    {
        return new ExecutionNodeHead(node);
    }
    
    private synchronized ExecutionNodeHead search(ExecutionNodeHead node)
    {
    	
    	Stack<ExecutionNodeHead> dfs_stack = new Stack<ExecutionNodeHead>();
    	
    	dfs_stack.push(node);
    	
    	do {
    		ExecutionNodeHead current_node = dfs_stack.pop();
    		
    		ExecutionNodeTail tail = current_node.getTail();
    		if(tail == null) {
    			if(!current_node.isFinished()) {
    				return current_node;
    			}
    			else {
    				return null;
    			}
    		}
    		else {
    			Collection<ExecutionNodeHead> children = tail.getChildren();
    			if(children.size() == 0) {
    				if(!current_node.isFinished()) {
    					return current_node;
    				}
    				else {
    					return null;
    				}
    			}
    			
    			for(ExecutionNodeHead child : children) {
    				if(!child.isFinished()) {
    					dfs_stack.push(child);
    				}
    			}
    		}
    		
    		
    	}while(!dfs_stack.isEmpty());
    	
    	return null;
    	
    	
    	//Recursive version
    	
    	/*
        ExecutionNodeTail tail = node.getTail();

        if (tail == null) {
            if (!node.isFinished())
                return node;
            else
                return null;
        } else {
            Collection<ExecutionNodeHead> children = tail.getChildren();

            if (children.size() == 0) {
                if (!node.isFinished())
                    return node;
                else
                    return null;
            }

            for (ExecutionNodeHead child : children) {
                if (!child.isFinished()) {
                    ExecutionNodeHead result = search(child);
                    if (result != null)
                        return result;
                }
            }

            return null;
        }
        */
    }
	

	
}
