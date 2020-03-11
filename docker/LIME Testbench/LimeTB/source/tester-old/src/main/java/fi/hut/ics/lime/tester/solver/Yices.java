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

package fi.hut.ics.lime.tester.solver;

import java.util.StringTokenizer;
import java.util.LinkedList;
import java.util.TreeMap;

public class Yices implements ConstraintSolver {
    private native String yicesSolveLinear (String constraint);

    static {
        System.loadLibrary("yices");
    }
    

    
    public String solveArithmeticConstraint (String constraint)
    {
        String solution;

        if (constraint.equals("") || constraint.equals("empty"))
            solution = "empty";
        else 
            solution = yicesSolveLinear(constraint);

        solution = parseSolution(solution);

        return solution;
    }



    public String solvePointerConstraint (String pointerConstraint)
    {
        String solution = "";

        if (pointerConstraint.equals("") || pointerConstraint.equals("empty"))
            return "empty";

        solution = yicesSolveLinear(pointerConstraint);

        if (solution.equals("unsat"))
            return "unsat";

        String[] constraints = pointerConstraint.split("D");

        TreeMap<String, LinkedList<String>> equivalences = new TreeMap<String, LinkedList<String>>();

        for (String constraint : constraints) {
            String[] temp = constraint.split(" ");

            if (temp[0].equals("==")) {
                if (equivalences.containsKey(temp[1])) {
                    if (!(equivalences.get(temp[1]).contains(temp[2]))) 
                        equivalences.get(temp[1]).add(temp[2]);
                } 
                else {
                    LinkedList<String> neighbors = new LinkedList<String>();

                    neighbors.add(temp[2]);
                    equivalences.put(temp[1], neighbors);
                }

                if (equivalences.containsKey(temp[2])) {
                    if (!(equivalences.get(temp[2]).contains(temp[1])))
                        equivalences.get(temp[2]).add(temp[1]);
                }
                else {
                    LinkedList<String> neighbors = new LinkedList<String>();

                    neighbors.add(temp[1]);
                    equivalences.put(temp[2], neighbors);
                }
            }
        }

        solution = "";

        while (equivalences.size() > 0) {
            String node                  = equivalences.firstKey();
            LinkedList<String> neighbors = equivalences.remove(node);

            if (!node.startsWith("O")) {
                solution = addValueforNeighbors(equivalences, neighbors, solution, node);
            }
            else {
                solution = addValueforNeighbors(equivalences, neighbors, solution, node.substring(1));
            }
        }

        solution = parsePointerSolution(solution);

        return solution;
  
    }



    private String addValueforNeighbors (TreeMap<String, LinkedList<String>> equivalences,
                                      LinkedList<String> neighbors ,
                                      String solution,
                                      String value)
    {
        for (String s : neighbors) {
            LinkedList<String> nextNeighbors = equivalences.get(s);

            if (equivalences.remove(s) != null) {
                if (s.startsWith("O"))
                    solution = solution + s + " " + value + " ";
                
                solution = addValueforNeighbors(equivalences, nextNeighbors, solution, value);
            }
        }

        return solution;
    }


    // do a better version!
    private String parseSolution (String string)
    {
        if (string.equals("unsat") || string.equals("empty"))
            return string;

        StringTokenizer tokenizer               = null;
        TreeMap<Integer,String> inputValues     = null;
        String result                           = "";
        int i                                   = 1;

        tokenizer   = new StringTokenizer(string);
        inputValues = new TreeMap<Integer,String>();

        while (tokenizer.hasMoreTokens()) {
            String input = tokenizer.nextToken();
            String value = tokenizer.nextToken();

            if (input.contains("input")) {
                input = input.substring(input.indexOf("input_") + 6);
                inputValues.put(Integer.valueOf(input), value);
            }
        }

        while (!inputValues.isEmpty()) {
            int input       = inputValues.firstKey();
            String value    = inputValues.remove(input);

            if (input < i) {
                System.err.println("ERROR: Yices.parseSolution functioned incorretly or received a non-valid input");
                System.exit(-1);
            }

            while (input > i) {
                //result += random.nextInt() + " ";  // NOTE: input can be short, bool, etc.
                result += 0 + " ";
                i++;
            }

            result += value + " ";
            i++;
        }

        return result;
    }



    /**
     * NOTE: can lead to unexpected results if the input string is
     * not of the expected form (ID value ID value ...)
     * 
     * @param string
     * @return
     */
    private String parsePointerSolution (String string)
    {
        if (string.equals("unsat") || string.equals("empty"))
            return string;

        StringTokenizer tokenizer             = null;
        TreeMap<Integer,Integer> objectValues = null;
        String result                         = "";
        int i                                 = 1;

        tokenizer    = new StringTokenizer(string);
        objectValues = new TreeMap<Integer,Integer>();

        while (tokenizer.hasMoreTokens()) {
            String input = tokenizer.nextToken();
            String value = tokenizer.nextToken();

            objectValues.put(Integer.valueOf(input.substring(1)), Integer.valueOf(value));
        }

        while (!objectValues.isEmpty()) {
            int input = objectValues.firstKey();
            int value = objectValues.remove(input);

            if (input < i) {
                System.err.println("ERROR: Yices.parsePointerSolution functioned incorretly or received a non-valid input");
                System.exit(-1);
            }

            while (input > i) {
                result += i + " ";
                i++;
            }

            result += value + " ";
            i++;
        }

        return result;
    }
}
