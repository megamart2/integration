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

package fi.hut.ics.lime.tester.solver;

import java.util.StringTokenizer;
import java.util.LinkedList;
import java.util.TreeMap;


public class Boolector implements ConstraintSolver {
    private native String boolectorSolveBV (String constraint);

    static {
        System.loadLibrary("boolector");
    }



    public String solveArithmeticConstraint (String constraint)
    {
        String solution;
        String converted  = "";
        String inputTypes = "";
        String[] rValues;

        BtorConverter converter = new BtorConverter();

        if (constraint.equals("") || constraint.equals("empty"))
            solution    = "empty";
        else {
            rValues     = converter.convertConstraint(constraint);
            converted   = rValues[0];
            inputTypes  = rValues[1];
            solution    = boolectorSolveBV(converted);
        }

        solution = parseSolution(solution, inputTypes);

        return solution;
    }



    public String solvePointerConstraint (String pointerConstraint)
    {
        String solution = "";

        if (pointerConstraint.equals("") || pointerConstraint.equals("empty"))
            return "empty";


        BtorConverter converter = new BtorConverter();

        String converted    = converter.convertReferenceConstraint(pointerConstraint);

        if (!converted.equals("sat"))
            solution  = boolectorSolveBV(converted);

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


    // TODO: uses integers -> may not work with longs
    private String parseSolution (String string, String inputTypes)
    {
        if (string.equals("unsat") || string.equals("empty"))
            return string;

        String result = "";
        StringTokenizer tokenizer = null;

        tokenizer = new StringTokenizer(string);

        int i = 0;
        while (tokenizer.hasMoreTokens()) {
            String value = tokenizer.nextToken();

            if (inputTypes.charAt(i) == 'u') {
                result += Integer.parseInt(value, 2) + " ";
            }
            else if (inputTypes.charAt(i) == 'i') {
                int intValue = 0;

                if (value.charAt(0) != '1') {
                    for (int j = value.length() - 1; j >= 0; j--) {
                        if (value.charAt(j) != '0') {
                            intValue += Math.pow(2, value.length() - 1 - j);
                        }
                    }
                } else {
                    for (int j = value.length() - 1; j >= 0; j--) {
                        if (value.charAt(j) != '1') {
                            intValue += Math.pow(2, value.length() - 1 - j);
                        }
                    }
                    intValue *= -1;
                    intValue += -1;
                }

                result += intValue + " ";
            }
            else if (inputTypes.charAt(i) == 'b') {
                if (value.equals("0"))
                    result += "false" + " ";
                else
                    result += "true" + " ";
            }
            else
                result += value + " ";

            i++;
        }

        return result;
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


    /**
     * NOTE: can lead to unexpected results if the input string is
     * not of the expected form (ID value ID value ...)
     *
     * @param string
     * @return
     */
    private String parsePointerSolution (String string)
    {
     //   System.out.println(string);
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
                System.err.println("ERROR: Boolector.parsePointerSolution functioned incorretly or received a non-valid input");
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
