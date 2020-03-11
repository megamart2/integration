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


public class CallStatement {
    
    /**
     * This method is used to transfer symbolic values of arguments when
     * methods are called. This method puts symbolic values to a queue
     * so that they can be assigned to the local variables of the method
     * body that is being called.
     *
     * @param identifier  identifier of the method that is being called
     * @param argument symbolic value to be stored
     */
    public static void putArgument(String identifier, String argument)
    {
        if (Symbolic.parameterQueue.size() > 0 && !Symbolic.parameterQueue.getFirst().startsWith(identifier))
            Symbolic.parameterQueue.clear();

        String temp = identifier + " " + argument;

        Symbolic.parameterQueue.addLast(temp);
    }



    /**
     * This method is used to obtain the symbolic values of arguments
     * when methods are called.
     *
     * @param identifier  identifier of the method that is being called
     * @param concrete    concrete value of the argument in case it does not
     *                    have a symbolic value stored to the queue
     * @return            symbolic or concrete value of the argument
     */
    public static String getArgument(String identifier, String concrete)
    {
        String result = null;

        if (identifier == null || Symbolic.parameterQueue == null) // test fix. check properly later.
            return concrete;

        if (Symbolic.parameterQueue.size() > 0 && Symbolic.parameterQueue.getLast().startsWith(identifier))
            result = Symbolic.parameterQueue.removeLast().substring(identifier.length() + 1);
        else if (Symbolic.parameterQueue.size() > 0) {
            Symbolic.parameterQueue.clear();
            result = concrete;
        }
        else {
            result = concrete;
        }

        return result;
    }
    
    public static void informMethod(String signature) {
    	Execution.communication.sendMessage("Method call: "+signature);
    }
  
}
