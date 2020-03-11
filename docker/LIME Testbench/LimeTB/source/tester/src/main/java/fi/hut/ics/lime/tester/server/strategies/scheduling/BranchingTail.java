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

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

/**
 * A tail for a node that corresponds to a control construct branching e.g. an if clause.
 * 
 * @author osaariki
 */
public class BranchingTail extends ExecutionNodeTail
{
    private ExecutionNodeHead left;
    private ExecutionNodeHead right;

    @Override
    public Collection<ExecutionNodeHead> getChildren()
    {
        if (left != null) {
            if (right != null) {
                return Arrays.asList(left, right);
            } else {
                return Collections.singleton(left);
            }
        } else {
            if (right != null) {
                return Collections.singleton(right);
            } else {
                return Collections.emptySet();
            }
        }
    }

    /**
     * @return the left child.
     */
    public ExecutionNodeHead getLeft()
    {
        return left;
    }

    /**
     * @param left
     *            the left child.
     */
    public void setLeft(ExecutionNodeHead left)
    {
        this.left = left;
    }

    /**
     * @return the right child.
     */
    public ExecutionNodeHead getRight()
    {
        return right;
    }

    /**
     * @param right
     *            the right child.
     */
    public void setRight(ExecutionNodeHead right)
    {
        this.right = right;
    }
}
