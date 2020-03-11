/*
Copyright (c) 2009 Helsinki University of Technology (TKK)

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

import java.util.LinkedList;
import java.util.TreeMap;

public class BtorConverter {
    private int counter;
    
    private TreeMap<String,BoolectorLine> declarations;
    private TreeMap<String,BoolectorLine> slices;
    private TreeMap<Integer,String> inputLines;
    private LinkedList<String> operations;
    private LinkedList<BoolectorLine> equalities;

    private final int referenceBitwidth;
    
    public BtorConverter()
    {
        counter         = 1;
        declarations    = new TreeMap<String,BoolectorLine>();
        slices          = new TreeMap<String,BoolectorLine>();
        inputLines      = new TreeMap<Integer,String>();
        operations      = new LinkedList<String>();
        equalities      = new LinkedList<BoolectorLine>();

        referenceBitwidth = 16;
    }


    public void reset()
    {
        counter         = 1;
        declarations    = new TreeMap<String,BoolectorLine>();
        slices          = new TreeMap<String,BoolectorLine>();
        inputLines      = new TreeMap<Integer,String>();
        operations      = new LinkedList<String>();
        equalities      = new LinkedList<BoolectorLine>();
    }

    //TODO: implement a faster conversion algorithm
    public String[] convertConstraint (String pathConstraint)
    {
        reset();

        String[] constraints = pathConstraint.split("D");

        for (int i = 0; i < constraints.length; i++) {
            String[] constraintParts = constraints[i].split(" ");

            // CASE: [op] [X] [Y] (e.g., "== int32_7 10")
            if (constraintParts.length == 3) {
                // in YicesSolver.c++ true and false are currently needed, but here they are converted to 1 and 0.
                truthConversion(constraintParts);

                int bitwidth1 = getBitwidth(constraintParts[1]);
                int bitwidth2 = getBitwidth(constraintParts[2]);
                int maxwidth  = Math.max(bitwidth1, bitwidth2);

                int id1 = getIdentifier(constraintParts[1], maxwidth);
                int id2 = getIdentifier(constraintParts[2], maxwidth);

                if (bitwidth1 != bitwidth2 && bitwidth1 > 0 && bitwidth2 > 0) {
                    if (bitwidth1 > bitwidth2)
                        id2 = addExtension(constraintParts[2],id2,bitwidth1, bitwidth1-bitwidth2);
                    else 
                        id1 = addExtension(constraintParts[1],id1,bitwidth2,bitwidth2-bitwidth1);   
                }

                boolean hasUnsigned = false;
                boolean hasSigned   = false;

                if (constraintParts[1].startsWith("i") || constraintParts[2].startsWith("i"))
                    hasSigned = true;

                if (constraintParts[1].startsWith("u") || constraintParts[2].startsWith("u"))
                    hasUnsigned = true;

                if (hasUnsigned && hasSigned)
                    System.out.println("WARNING: comparison of signed and unsigned variables not yet fully supported.");

                String comparator = operatorConversion(constraintParts[0], hasUnsigned);

                comparator += " 1 " + id1 + " " + id2;

                operations.add(comparator);
            }
            // CASE: [==] [X] [op] [Y] [Z] (e.g., "== int32_7 + int32_2 int32_4")
            else if (constraintParts.length == 5) {
                truthConversion(constraintParts);

                int bitwidth1 = getBitwidth(constraintParts[1]);
                int bitwidth3 = getBitwidth(constraintParts[3]);
                int bitwidth4 = getBitwidth(constraintParts[4]);

                int maxwidth = Math.max(bitwidth1, Math.max(bitwidth3, bitwidth4));

                int id1 = getIdentifier(constraintParts[1], maxwidth);
                int id3 = getIdentifier(constraintParts[3], maxwidth);
                int id4 = getIdentifier(constraintParts[4], maxwidth);

                if (maxwidth > bitwidth1 && bitwidth1 > 0)
                    id1 = addExtension(constraintParts[1],id1,maxwidth, maxwidth-bitwidth3);

                if (maxwidth > bitwidth3 && bitwidth3 > 0)
                    id3 = addExtension(constraintParts[3],id3,maxwidth, maxwidth-bitwidth3);

                if (maxwidth > bitwidth4 && bitwidth4 > 0)
                    id4 = addExtension(constraintParts[4],id4,maxwidth, maxwidth-bitwidth4);

                
                boolean hasUnsigned = false;
                boolean hasSigned   = false;

                if (constraintParts[1].startsWith("i") || constraintParts[3].startsWith("i") || constraintParts[4].startsWith("i"))
                    hasSigned = true;

                if (constraintParts[1].startsWith("u") || constraintParts[3].startsWith("u") || constraintParts[4].startsWith("u"))
                    hasUnsigned = true;

                if (hasUnsigned && hasSigned)
                    System.out.println("WARNING: comparison of signed and unsigned variables not yet fully supported.");

                String operator = operatorConversion(constraintParts[2], hasUnsigned);
                
                if (constraintParts[2].equals(">>") || constraintParts[2].equals("<<")) {
                    int logBitwidth = 0;

                    if (maxwidth == 64)
                        logBitwidth = 6;
                    else if (maxwidth == 32)
                        logBitwidth = 5;
                    else if (maxwidth == 16)
                        logBitwidth = 4;
                    else if (maxwidth == 8)
                        logBitwidth = 3;
                    else {
                        System.out.println("ERROR: Unexpected bitwidth in Boolector.convertConstraint().");
                        System.exit(0);
                    }

                    id4 = addSlice(constraintParts[4], id4, logBitwidth);
                }

                operator = operator + " " + maxwidth + " " + id3 + " " + id4;
                BoolectorLine bl = new BoolectorLine();
                bl.ID = id1;
                bl.content = operator;
                equalities.add(bl);
            }

        }

        int i = 1;
        String returnString = "";
        String inputTypes   = "";

        //TODO: change to iterator?
        while (!inputLines.isEmpty()) {
            String entry = inputLines.remove(i);

            if (entry == null) {
                System.out.println("ERROR: Failed to locate an input variable (btor conversion)");
                System.exit(0);
            }
            else {
                if (returnString.equals(""))
                    returnString += entry.substring(1).trim();
                else
                    returnString = returnString + " " + entry.substring(1).trim();

                inputTypes += entry.charAt(0);
            }
            i++;
        }


        String result = "";

        while (!declarations.isEmpty()) {
            String key          = declarations.firstKey();
            BoolectorLine entry = declarations.remove(key);
            result += entry.ID + " " + entry.content + "\n";
        }

        while (!slices.isEmpty()) {
            String key          = slices.firstKey();
            BoolectorLine entry = slices.remove(key);
            result += entry.ID + " " + entry.content + "\n";
        }

        while (!equalities.isEmpty()) {
            BoolectorLine bl = equalities.removeFirst();
            operations.add("eq 1 " + bl.ID + " " + counter);
            result = result + counter + " " + bl.content + "\n";
            counter++;
        }

        int tempNumber = counter;

        while (!operations.isEmpty()) {
            String s = operations.removeFirst();
            result = result + counter + " " + s + "\n";
            counter++;
        }

        //TODO: messy code. clean this up.
        int tempNumber2 = counter;
        int h = 0;
        while (tempNumber < tempNumber2) {
            int foo = tempNumber + 1;

            if (h == 0) {
                if (foo < tempNumber2) {
                    result = result + counter + " and 1 " + tempNumber + " " + foo + "\n";
                }
                h = 1;
            }
            else {
                if (foo < tempNumber2) {
                    int v = counter - 1;
                    result = result + counter + " and 1 " + v + " " + foo + "\n";
                }
            }

            counter++;
            tempNumber++;
        }

        counter--;

        result = result.trim(); // Removes the trailing blank line.
        result = "Return: " + returnString + "\n" + result;
        result = "Lines: " + (counter - 1) + "\n" + result;

        String[] r = {result, inputTypes};
        return r;
    }



    public String convertReferenceConstraint (String referenceConstraint)
    {
        reset();
        
        String[] constraints = referenceConstraint.split("D");

        // Determining that "== O1 1" constraint is satisfiable which is enough for
        // reference constraint solving
        if (constraints.length == 1)
            return "sat";

        for (int i = 0; i < constraints.length; i++) {
            String[] constraintParts = constraints[i].split(" ");

            int id1 = getIdentifier(constraintParts[1], referenceBitwidth);
            int id2 = getIdentifier(constraintParts[2], referenceBitwidth);

            String comparator = operatorConversion(constraintParts[0], false);

            comparator += " 1 " + id1 + " " + id2;

            operations.add(comparator);
        }

        String result = "";
        
        int i = 1;
        String returnString = "";

        //TODO: change to iterator?
        while (!inputLines.isEmpty()) {
            String entry = inputLines.remove(i);

            if (entry == null) {
                System.out.println("ERROR: Failed to locate an input variable (btor conversion)");
                System.exit(0);
            }
            else {
                if (returnString.equals(""))
                    returnString += entry.substring(1).trim();
                else
                    returnString = returnString + " " + entry.substring(1).trim();
            }
            i++;
        }

        while (!declarations.isEmpty()) {
            String key          = declarations.firstKey();
            BoolectorLine entry = declarations.remove(key);
            result += entry.ID + " " + entry.content + "\n";
        }

        int tempNumber = counter;

        while (!operations.isEmpty()) {
            String s = operations.removeFirst();
            result = result + counter + " " + s + "\n";
            counter++;
        }

        //TODO: messy code. clean this up.
        int tempNumber2 = counter;
        int h = 0;
        while (tempNumber < tempNumber2) {
            int foo = tempNumber + 1;

            if (h == 0) {
                if (foo < tempNumber2) {
                    if (foo + 1 < tempNumber2) {
                        result = result + counter + " and 1 " + tempNumber + " " + foo + "\n";
                    } else {
                        result = result + counter + " and 1 " + tempNumber + " " + foo;
                    }
                }
                h = 1;
            }
            else {
                if (foo < tempNumber2) {
                    int v = counter - 1;
                    if (foo + 1 < tempNumber2) {
                        result = result + counter + " and 1 " + v + " " + foo + "\n";
                    } else {
                        result = result + counter + " and 1 " + v + " " + foo;
                    }
                }
            }

            counter++;
            tempNumber++;
        }

        counter--;

        result = "Return: " + returnString + "\n" + result;
        result = "Lines: " + (counter - 1) + "\n" + result;

        return result;
    }




    private int getBitwidth (String s) {
        String temp = "";

        if (s.startsWith("i"))
            temp = s.substring(1, s.indexOf("_"));
        else if (s.startsWith("ui"))
            temp = s.substring(2, s.indexOf("_"));
        else if (s.startsWith("b"))
            temp = "1";
        else if (s.startsWith("O"))
            temp = Integer.valueOf(referenceBitwidth).toString();
        else
            temp = "-1";


        return Integer.parseInt(temp);
    }



    private static boolean startsWithANumber (String s)
    {
        if (s.startsWith("0") || s.startsWith("1") || s.startsWith("2") ||
            s.startsWith("3") || s.startsWith("4") || s.startsWith("5") ||
            s.startsWith("6") || s.startsWith("7") || s.startsWith("8") ||
            s.startsWith("9"))
            return true;

        return false;
    }



    private static boolean isConstant (String s)
    {
        if (startsWithANumber(s) || (s.startsWith("-") && startsWithANumber(s.substring(1))))
            return true;

        return false;
    }


    
    private void truthConversion (String[] constraintParts)
    {
        if (constraintParts.length == 3) {
            if (constraintParts[1].equals("true"))
                constraintParts[1] = "1";
            else if (constraintParts[1].equals("false"))
                constraintParts[1] = "0";

            if (constraintParts[2].equals("true"))
                constraintParts[2] = "1";
             else if (constraintParts[2].equals("false"))
                constraintParts[2] = "0";
        }
        else {
            if (constraintParts[3].equals("true"))
                constraintParts[3] = "1";
            else if (constraintParts[3].equals("false"))
                constraintParts[3] = "0";

            if (constraintParts[4].equals("true"))
                constraintParts[4] = "1";
             else if (constraintParts[4].equals("false"))
                constraintParts[4] = "0";
        }
    }


    // TODO: make a search data structure that contains the mapping between operator strings
    //       (static initialization for the map?)
    private String operatorConversion (String operator, boolean hasUnsigned)
    {
        if (operator.equals(">")) {
            if (hasUnsigned) {
                return "ugt";
            } else {
                return "sgt";
            }
        } else if (operator.equals(">=")) {
            if (hasUnsigned) {
                return "ugte";
            } else {
                return "sgte";
            }
        } else if (operator.equals("<")) {
            if (hasUnsigned) {
                return "ult";
            } else {
                return "slt";
            }
        } else if (operator.equals("<=")) {
            if (hasUnsigned) {
                return "ulte";
            } else {
                return "slte";
            }
        } else if (operator.equals("==")) {
            return "eq";
        } else if (operator.equals("!=")) {
            return "ne";
        } else if (operator.equals("+")) {
            return "add";
        } else if (operator.equals("-")) {
            return "sub";
        } else if (operator.equals("*")) {
           return "mul";
        } else if (operator.equals("/") && !hasUnsigned) {
            return "sdiv";
        } else if (operator.equals("/")) {
            return "udiv";
        } else if (operator.equals("%")) {
            return "srem";
        } else if (operator.equals("<<")) {
            return "sll";
        } else if (operator.equals(">>")) {
            return "sra";
        } else if (operator.equals("|")) {
            return "or";
        } else if (operator.equals("&")) {
            return "and";
        } else if (operator.equals("^")) {
            return "xor";
        } else {
            System.out.println("ERROR: Unsupported operator (" + operator + ")");
            System.exit(0);
        }

        //TODO: error check
        return null;
    }



    //NOTE: possile small optimization: == X op Y Z cannot contain a_input_b types
    private int getIdentifier (String variable, int constantWidth)
    {
        if (isConstant(variable))
            return addConstant(variable, constantWidth);
        else {
            if (variable.contains("input")) {
                String t        = variable.substring(variable.indexOf("input_") + 6);
                Integer key     = Integer.valueOf(t);
                String element  = variable.charAt(0) + " " + counter;

                inputLines.put(key, element);
            }
            else if (variable.contains("O")) {
                String t        = variable.substring(1);
                Integer key     = Integer.valueOf(t);
                String element  = variable.charAt(0) + " " + counter;

                inputLines.put(key, element);
            }

            return addDeclaration(variable);
        }
    }


    private int addConstant (String name, int bitwidth) {
        int result;

        String fullName     = name + "_" + bitwidth;
        BoolectorLine bl    = declarations.get(fullName);

        if (bl == null) {
            BoolectorLine t = new BoolectorLine();
            t.ID            = counter;
            t.content       = "constd " + bitwidth + " " + name;
            
            declarations.put(fullName, t);

            result = counter;
            counter++;
        }
        else
            result = bl.ID;

        return result;
    }



    private int addDeclaration (String name) {
        int result;

        BoolectorLine bl = declarations.get(name);

        if (bl == null) {
            BoolectorLine t = new BoolectorLine();
            t.ID            = counter;
            t.content       = "var " + getBitwidth(name) + " " + name;

            declarations.put(name, t);

            result = counter;
            counter++;
        }
        else
            result = bl.ID;

        return result;
    }



    private int addExtension (String name, int origID, int bitwidth, int difference) {
        int result;
        String newName = "";

        if (name.startsWith("i"))
            newName = "i" + bitwidth + name.substring(name.indexOf("_"));
        else if (name.startsWith("ui"))
            newName = "ui" + bitwidth + name.substring(name.indexOf("_"));

        BoolectorLine bl = slices.get(newName);

        if (bl == null) {
            BoolectorLine t = new BoolectorLine();
            t.ID            = counter;
            t.content       = "sext " + bitwidth + " " + origID + " " + difference;

            slices.put(newName, t);

            result = counter;
            counter++;
        }
        else
            result = bl.ID;

        return result;
    }



    private int addSlice (String name, int origID, int bitwidth) {
        int result;
        String newName = "";

        if (name.startsWith("i"))
            newName = "i" + bitwidth + name.substring(name.indexOf("_"));
        else if (name.startsWith("ui"))
            newName = "ui" + bitwidth + name.substring(name.indexOf("_"));

        BoolectorLine bl = slices.get(newName);

        if (bl == null) {
            BoolectorLine t = new BoolectorLine();
            int start       = bitwidth - 1;
            int end         = 0;
            t.ID            = counter;
            t.content       = "slice " + bitwidth + " " + origID + " " + start + " " + end;

            slices.put(newName, t);

            result = counter;
            counter++;
        }
        else 
            result = bl.ID;

        return result;
    }

}
