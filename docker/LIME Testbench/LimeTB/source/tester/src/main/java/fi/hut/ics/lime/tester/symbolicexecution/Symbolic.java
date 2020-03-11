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

package fi.hut.ics.lime.tester.symbolicexecution;

import java.util.IdentityHashMap;
import java.util.LinkedList;
import java.util.TreeMap;

public class Symbolic {
    protected static int maxGotos;
    protected static String branchesTaken;
    protected static long symbolicNumber;
    protected static int currentInput;
    protected static int maxInput;
    protected static String branchString;
    protected static boolean hasExecutedSymbolic;
    protected static int objectNumber;

    protected static LinkedList<String> parameterQueue;
    protected static LinkedList<String> inputValues;

    protected static LinkedList<String> objectList;
    protected static IdentityHashMap<Object,String> mapR;
    protected static TreeMap<String,Object> objectMap;
    protected static IdentityHashMap<Object,String> mapInitialized;

    protected static ObjectConstraintOption collectedObjectConstraints;

    protected static String solverTheory;

    protected static boolean isExecuting;
    
    public enum ObjectConstraintOption {DO_NOT_COLLECT, COLLECT};
}
