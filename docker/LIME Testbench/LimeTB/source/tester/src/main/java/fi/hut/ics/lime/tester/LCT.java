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

package fi.hut.ics.lime.tester;

import fi.hut.ics.lime.tester.symbolicexecution.ObjectStatement;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;


/**
 * This class contains static methods that the user can use to read input
 * values from LCT.
 *
 * Instrumentation will replace these method calls completely.
 */
public class LCT
{
    private static Random r = new Random();
    private static LinkedList<String> inputValues = new LinkedList<String>();


    public static void addInputValue (String value)
    {
        inputValues.add(value);
    }


    public static void addInputValues (List<String> values)
    {
        inputValues.addAll(values);
    }


    public static int getInteger()
    {
        if (inputValues.isEmpty()) {
            return r.nextInt();
        } else {
            try {
                return Integer.parseInt(inputValues.remove(0));
            } catch (NumberFormatException e) {
                throw new RuntimeException("Input value could not be parsed as an int by the LCT.", e);
            }
        }
    }


    public static boolean getBoolean()
    {
        if (inputValues.isEmpty()) {
            return r.nextBoolean();
        } else {
            String input = inputValues.remove(0);
            if (input.equals("true")) {
                return true;
            } else if (input.equals("false")) {
                return false;
            } else {
                throw new RuntimeException("Input value could not be parsed as a boolean by the LCT.");
            }
        }
    }



    public static byte getByte()
    {
        if (inputValues.isEmpty()) {
            return (byte) (r.nextInt(256) - 128);
        } else {
            try {
                return Byte.parseByte(inputValues.remove(0));
            } catch (NumberFormatException e) {
                throw new RuntimeException("Input value could not be parsed as a byte by the LCT.", e);
            }
        }
    }



    public static char getChar()
    {

        if (inputValues.isEmpty()) {
            return (char) r.nextInt(65536);
        } else {
            char[] input = inputValues.remove(0).toCharArray();

            if (input.length == 1)
                return input[0];
            else 
                throw new RuntimeException("Input value could not be parsed as a char by the LCT.");
        }
    }

    public static short getShort()
    {
        if (inputValues.isEmpty()) {
            return (short) (r.nextInt(65536) - 32768);
        } else {
            try {
                return Short.parseShort(inputValues.remove(0));
            } catch (NumberFormatException e) {
                throw new RuntimeException(
                    "Input value could not be parsed as a short by the LCT.",
                    e);
            }
        }
    }



    public static long getLong()
    {
        if (inputValues.isEmpty()) {
            return r.nextLong();
        } else {
            try {
                return Long.parseLong(inputValues.remove(0));
            } catch (NumberFormatException e) {
                throw new RuntimeException(
                    "Input value could not be parsed as a long by the LCT.",
                    e);
            }
        }
    }



    public static int getInteger(int min, int max)
    {
        int delta = max - min;

        if (delta < 0) {
            System.out.println("In LCT.getInteger(int min, int max) max was less than min. Please recheck your code.");
            System.exit(1);
        }

        if (inputValues.isEmpty()) {
            int randomValue = r.nextInt(delta + 1);
            return min + randomValue;
        } else {
            try {
                int input = Integer.parseInt(inputValues.remove(0));
                if (!(min <= input && input <= max)) {
                    throw new RuntimeException("Parsed input was not in bounds of call to LCT.getInteger(int min, int max).");
                }
                return input;
            } catch (NumberFormatException e) {
                throw new RuntimeException(
                    "Input value could not be parsed as an int by the LCT.",
                    e);
            }
        }
    }



    public static short getShort(int min, int max)
    {
        int delta = max - min;

        if (delta < 0) {
            System.out.println("In LCT.getShort(int min, int max) max was less than min. Please recheck your code.");
            System.exit(1);
        }

        if (inputValues.isEmpty()) {
            int randomValue = r.nextInt(delta + 1);
            return (short) (min + randomValue);
        } else {
            try {
                short input = Short.parseShort(inputValues.remove(0));
                if (!(min <= input && input <= max)) {
                    throw new RuntimeException(
                        "Parsed input was not in bounds of call to LCT.getShort(int min, int max).");
                }
                return input;
            } catch (NumberFormatException e) {
                throw new RuntimeException(
                    "Input value could not be parsed as a short by the LCT.",
                    e);
            }
        }
    }



    public static Object getObject(String name)
    {
        if (inputValues.isEmpty()) {
            return ObjectStatement.getObject(name);
        } else {
            throw new RuntimeException("Object type input is not supported.");
        }
    }


    public static void assertion(boolean b)
    {
    }


    public static void assumption(boolean b)
    {
    }


    public static void dropTest()
    {
    }

}
