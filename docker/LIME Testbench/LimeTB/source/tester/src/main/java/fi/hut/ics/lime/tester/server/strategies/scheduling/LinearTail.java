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
import java.util.Collections;

/**
 * A tail with a single child.
 * 
 * @author osaariki
 */
public class LinearTail extends ExecutionNodeTail
{
    private ExecutionNodeHead child;

    @Override
    public Collection<ExecutionNodeHead> getChildren()
    {
        if (child != null)
            return Collections.singleton(child);
        else
            return Collections.emptySet();
    }

    /**
     * @return the child.
     */
    public ExecutionNodeHead getChild()
    {
        return child;
    }

    /**
     * @param child
     *            the child.
     */
    public void setChild(ExecutionNodeHead child)
    {
        this.child = child;
    }
}
