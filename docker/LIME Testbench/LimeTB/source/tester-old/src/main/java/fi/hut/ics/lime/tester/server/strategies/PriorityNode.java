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


/**
 * Represents a node in a symbolic execution tree. PriorityNode contains
 * all the typical information stored by LCT in a symbolic execution tree
 * and in addition priority information that is used to select the next node
 * to expand when a new test run is started.
 *
 * @author ktkahkon
 */
public class PriorityNode extends SymbolicExecutionNode implements Comparable<PriorityNode>
{
    public short priority;


    public PriorityNode()
    {
        super();
    }


    public PriorityNode (PriorityNode parent)
    {
        super(parent);
    }

    

    public int compareTo(PriorityNode p) {
        if (this.priority > p.priority)
            return 1;
        else if (this.priority == p.priority)
            return 0;
        else
            return -1;
    }
}
