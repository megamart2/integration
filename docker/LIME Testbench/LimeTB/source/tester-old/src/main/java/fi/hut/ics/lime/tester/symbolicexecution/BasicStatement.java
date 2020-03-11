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

package fi.hut.ics.lime.tester.symbolicexecution;

import java.util.StringTokenizer;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

/**
 * A class containing methods for symbolic execution of different types
 * of statements. No instance of this class is supposed to be created.
 */
public class BasicStatement
{
    public static void executeGoto()
    {
        if (Symbolic.isExecuting) {
        if (Symbolic.maxGotos == 0) {
            Execution.communication.sendMessage("Maximum depth reached");
            Execution.communication.end();

            System.exit(0);
        }
        else if (Symbolic.maxGotos > 0)
            Symbolic.maxGotos--;
        }
    }


    /**
     * Executes an assignment statement symbolically. Uses the given concrete
     * value as a result if the assignment uses an unsupported assignment type.
     * Reports the assignment to the test selector.
     *
     * @param  operator the operator used in the assignment (e.g., "+" or "-")
     * @param  value1   the first operand
     * @param  value2   the second operand
     * @param  cValue1  the concrete value of the first operand
     * @param  cValue2  the concrete value of the second operand
     * @param  concrete the result of the assignment as a concrete value
     * @param  type     the type of the variables used in the assignment
     * @return          symbolic value of the assignment
     */
    public static String executeAssignment(String operator, String value1, String value2, String cValue1, String cValue2, String concrete, String type)
    {
        String result = null;

        // primitive longs are handled differently than other types due to cmp operator in Soot
        // TODO: this approach can create unnecessary branches to the symbolic execution tree. How to fix?
        if (operator.equals("cmp")) {
            long longValue1 = Long.valueOf(cValue1).longValue();
            long longValue2 = Long.valueOf(cValue2).longValue();

            boolean isEqual     = longValue1 == longValue2;
            boolean isLessThan  = longValue1 < longValue2;

            executeCondition("==", value1, value2, cValue1, cValue2, -1, Boolean.toString(isEqual));

            if (!isEqual)
                executeCondition("<", value1, value2, cValue1, cValue2, -1, Boolean.toString(isLessThan));
        }

        if (SymbolicUtil.containsVariables(value1) || SymbolicUtil.containsVariables(value2)) {
            if (Symbolic.solverTheory.equals("linear")) {
                if ((SymbolicUtil.containsVariables(value1) && SymbolicUtil.containsVariables(value2) &&
                    (operator.equals("*") || operator.equals("/")))) {
                        value2 = cValue2;
                }

                if (!(operator.equals("+") || operator.equals("-") || operator.equals("*") || operator.equals("/")))
                    result = concrete;
                else {
                    result = SymbolicUtil.getTypeID(type) + Symbolic.symbolicNumber;
                    Symbolic.symbolicNumber++;

                    if (value1 == null || value1.equals("null"))
                        value1 = cValue1;

                    if (value2 == null || value2.equals("null"))
                        value2 = cValue2;

                    Execution.communication.sendMessage("New assignment: " + result + " " + operator + " " + value1 + " " + value2);
                }
            }
            else if (Symbolic.solverTheory.equals("bitvector")) {
                if (!(operator.equals("+") || operator.equals("-") || operator.equals("*") || operator.equals("/") || operator.equals("<<") || operator.equals(">>") || operator.equals("|") || operator.equals("%") || operator.equals("&"))) {
                    result = concrete;
                }
                else {
                    result = SymbolicUtil.getTypeID(type) + Symbolic.symbolicNumber;
                    Symbolic.symbolicNumber++;

                    if (value1 == null || value1.equals("null"))
                        value1 = cValue1;

                    if (value2 == null || value2.equals("null"))
                        value2 = cValue2;

                    Execution.communication.sendMessage("New assignment: " + result + " " + operator + " " + value1 + " " + value2);
                }
            }
            else {
                System.out.println("ERROR: unknown theory for constraint solver");
                System.exit(1);
            }
        }
        else
            result = concrete;

        return result;
    }



    /**
     * Executes a branching statement symbolically. The executed statements
     * are of the form [expression1] [comparator] [expression2]
     *
     * @param comparator
     * @param expression1  symbolic value of the first expression to be compared
     * @param expression2  symbolic value of the second expression
     * @param cValue1  concrete value of the first expression
     * @param cValue2 concrete value of the second expression
     * @param id  identification number of the branching statement (used for branch coverage computation)
     * @param branch  truth value indicating whether true of false branch was taken by the concrete execution
     */
    public static void executeCondition(String comparator, String expression1, String expression2, String cValue1, String cValue2, int id, String branch)
    {
        // Goto statements can occur with if-statements. This is a quick fix to make sure that no
        // infinite loops occur. TODO: think if this can be done in some other way.
        executeGoto();

        Execution.communication.sendMessage("Branch ID: " + id + " " + branch);

        if (!SymbolicUtil.containsVariables(expression1) && !SymbolicUtil.containsVariables(expression2))
            Symbolic.hasExecutedSymbolic = false;
        else
            Symbolic.hasExecutedSymbolic = true;

        if (branch.equals("true"))
            Symbolic.branchString = Symbolic.branchString + "t";
        else
            Symbolic.branchString = Symbolic.branchString + "f";

        if (Symbolic.hasExecutedSymbolic)  {

            // Symbolic value has not been initialized
            // TODO: check if can cause problems with booleans
            if (expression1 == null)
                expression1 = "0";

            if (expression2 == null)
                expression2 = "0";

            if (expression1.equals("null"))
                expression1 = cValue1;

            if (expression2.equals("null"))
                expression2 = cValue2;

            if (expression1.startsWith("b") || expression2.startsWith("b")) {
                if(expression1.equals("0"))
                    expression1 = "false";
                else if (expression1.equals("1"))
                    expression1 = "true";

                if(expression2.equals("0"))
                    expression2 = "false";
                else if (expression2.equals("1"))
                    expression2 = "true";

            }

            SymbolicUtil.sendBufferedPath();

            Execution.communication.sendMessage("New arithmetic condition: " + comparator + " " + expression1 + " " + expression2 + " " + branch + " " + Symbolic.branchString);            

            if (!Execution.heuristicClass.equals("none") && !Execution.heuristicMethod.equals("none")) {
                try {
                    Class<?> hv = Class.forName(Execution.heuristicClass);
                    Method m = hv.getDeclaredMethod(Execution.heuristicMethod);
                    Integer value = (Integer)m.invoke(null);
                    Execution.communication.sendMessage("Heuristic value: " + value);
                }
                catch (ClassNotFoundException e) {
                    System.out.println("ERROR: heuristicClass not found");
                    //TODO: error handling
                }
                catch (NoSuchMethodException e) {
                    System.out.println("ERROR: heuristicMethod not found");
                    //TODO: error handling
                }
                catch (IllegalAccessException e) {
                    //TODO: error handling
                }
                catch (InvocationTargetException e) {
                    //TODO: error handling
                }
            }

            Symbolic.branchString = "";
        }   
    }


    
    /**
     * Executes a switch statement. These statements are handled internally
     * as nested if statements.
     *
     * @param symbolicKey
     * @param concreteKey
     * @param values
     * @param id
     */
    public static void executeSwitch(String symbolicKey, int concreteKey, String values, int id)
    {
        StringTokenizer tokenizer = new StringTokenizer(values);
        boolean isCaseFound       = false;

        while (tokenizer.hasMoreTokens() && !isCaseFound) {
            String token = tokenizer.nextToken();

            if (concreteKey == Integer.valueOf(token).intValue()) {
                isCaseFound = true;
                //TODO: check if passing nulls as concrete values can cause problems
                executeCondition ("==", symbolicKey, token, null, null, id, "true");
            }
            else
                executeCondition ("==", symbolicKey, token, null, null, id, "false");

            if (id >= 0) // -1 denotes a branch that is not taken into account in branch coverage counting
                id++;
        }
    }
  
}
