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

import java.util.LinkedList;
import java.util.TreeMap;

public class SymbolicUtil {
    public static String getTypeID (String type)
    {
        String result = null;

        if (type.startsWith("int"))
            result = "i32_";
        else if (type.startsWith("bool"))
            result = "b_";
        else if (type.startsWith("byte"))
            result = "i8_";
        else if (type.startsWith("char"))
            result = "ui16_";
        else if (type.startsWith("short"))
            result = "i16_";
        else if (type.startsWith("long"))
            result = "i64_";
        else
            result = "unsupported";

        return result;
    }


    public static boolean canBeSymbolic (String t)
    {
        if (t.equals("int") || t.equals("boolean") || t.equals("char") || t.equals("byte") ||
            t.equals("short") || t.equals("long") || t.equals("character") || t.equals("bool") || t.equals("integer"))
            return true;

        return false;
    }


    public static boolean containsVariables (String string)
    {
        if (string == null)
            return false;
    //    System.out.println("containtsVariables? " + string);
       // if ((string.contains("i") || string.contains("b") || string.contains("B") ||
       //     string.contains("s") || string.contains("c") || string.contains("l")) && !string.equals("true") && !string.equals("false")) // TODO: KORJAA!! Pika hackki!
         if ((string.contains("i") || string.contains("u") || string.contains("b")) && !string.equals("true") && !string.equals("false") && !string.equals("null"))
            return true;
        else
            return false;
    }


    //Made for demonstration purposes only
    public static void convertAndPrintConstraint (String pathConstraint)
    {
        String result = "";

        TreeMap<String,Integer> map = new TreeMap<String,Integer>();
        LinkedList<String> list = new LinkedList<String>();
        int runningNumber = 1;

        if (!pathConstraint.startsWith("Solve:"))
            return;
        
        pathConstraint = pathConstraint.substring(7);

        String[] temp = pathConstraint.split("DIV");
        pathConstraint = temp[0];

//        pathConstraint = pathConstraint.replace("&", "D");

        String[] temp2 = pathConstraint.split("D");

        for (int i = 0; i < temp2.length; i++) {
            String[] parts = temp2[i].split(" ");

            for (int j = 0; j < parts.length; j++)
                if (parts[j].startsWith("i") || parts[j].startsWith("u") || 
                    parts[j].startsWith("b") || parts[j].startsWith("O") ||
                    startsWithANumber(parts[j])) {
                    if (!map.containsKey(parts[j])) {
                        map.put(parts[j], runningNumber);
                        runningNumber++;
                    }
                }

            if (parts.length == 5) {



            }
            else { //length == 3
                String line = "";
                boolean hasUnsigned = false;
                boolean hasSigned   = false;

                if (parts[1].startsWith("i") || parts[2].startsWith("i"))
                    hasSigned = true;

                if (parts[1].startsWith("u") || parts[2].startsWith("u"))
                    hasUnsigned = true;

                if (hasUnsigned && hasSigned)
                    System.out.println("WARNING: comparison of signed and unsigned variables not yet fully supported.");

                if (parts[0].equals(">")) {
                    if (hasUnsigned)
                        line = "ugt";
                    else
                        line = "sgt";
                }
                else if (parts[0].equals(">=")) {
                    if (hasUnsigned)
                        line = "ugte";
                    else
                        line = "sgte";
                }
                else if (parts[0].equals("<")) {
                    if (hasUnsigned)
                        line = "ult";
                    else
                        line = "slt";
                }
                else if (parts[0].equals("<=")) {
                    if (hasUnsigned)
                        line = "ulte";
                    else
                        line = "slte";
                }
                else if (parts[0].equals("==")) {
                    line = "eq";
                }
                else if (parts[0].equals("!=")) {
                    line = "ne";
                }

                line += " 1 ";

                line += map.get(parts[1]) + " ";
                line += map.get(parts[2]);

                list.add(line);
            }

            System.out.println(temp2[i]);
        }

          //  result = result + temp2[i] + "\n";
//        StringTokenizer t = new StringTokenizer(pathConstraint);

  //      while(t.hasMoreTokens()) {

    //    }

        System.out.println("\nBoolector:\n");

        while (!map.isEmpty()) {
            String key = map.firstKey();
            Integer number = map.remove(key);

            result += number.toString();

            if (key.startsWith("i") || key.startsWith("u")) {
                if (key.contains("8"))
                    result += " var 8";
                else if (key.contains("16"))
                    result += " var 16";
                else if (key.contains("32"))
                    result += " var 32";
                else if (key.contains("64"))
                    result += " var 64";
            }
            else if (key.startsWith("b"))
                result += " var 1";
            else if (key.startsWith("O"))
                result += " var 32";
            else
                result = result + " constd 32 " + key.toString(); //only 32 bit. fix!!!!

            result += "\n";
        }

        int tempNumber = runningNumber;

        while (!list.isEmpty()) {
            result = result + runningNumber + " " + list.removeFirst() + "\n";
            runningNumber++;
        }

        int tempNumber2 = runningNumber;

        while (tempNumber < tempNumber2) {
            int foo = tempNumber + 1;

            if (foo < tempNumber2)
           //     result = result + runningNumber + " root 1 " + (runningNumber - 1);
          //  else
                result = result + runningNumber + " and 1 " + tempNumber + " " + foo + "\n";

            runningNumber++;
            tempNumber++;
        }

        System.out.println("Path constraint:\n" + result);
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

    public static void sendBufferedPath()
    {
        int length = Symbolic.branchString.length();
        // Only send if branches taken have been buffered
        if (length > 1) {
            String buffered = Symbolic.branchString.substring(0, length - 1);
            Symbolic.branchString = Symbolic.branchString.substring(length - 1, length);
            Execution.communication.sendMessage("Buffered path: " + buffered);
        }
    }

}
