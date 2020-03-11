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


public class InputStatement {

    public static String getSymbolicInput (String type)
    {
        String result  = null;
        String message = null;

        String typeID = SymbolicUtil.getTypeID(type);

        if (typeID.equals("unsupported")) {
            System.err.println("ERROR: unsupported symbolic type encountered (" + type + ")");
            System.exit(-1);
        }
        result = typeID + Symbolic.symbolicNumber;

        if (SymbolicUtil.canBeSymbolic(type))
            message = "New input: " + result + " " + typeID + "input_" + Symbolic.currentInput;
        else {
            System.err.println("ERROR: Unsupported variable type (" + type + ") encountered.");
            System.exit(-1);
        }

        Execution.communication.sendMessage(message);

        Symbolic.currentInput++;
        Symbolic.symbolicNumber++;

        return result;
    }



    public static String getSymbolicInput (int min, int max, String type)
    {
        String result  = null;
        String message = null;

        String typeID = SymbolicUtil.getTypeID(type);

        if (typeID.equals("unsupported")) {
            System.err.println("ERROR: unsupported symbolic type encountered (" + type + ")");
            System.exit(-1);
        }
        result = typeID + Symbolic.symbolicNumber;

        if (SymbolicUtil.canBeSymbolic(type))
            message = "New input: " + result + " " + typeID + "input_" + Symbolic.currentInput;
        else {
            System.err.println("ERROR: Unsupported variable type (" + type + ") encountered.");
            System.exit(-1);
        }

        Execution.communication.sendMessage(message);
        Execution.communication.sendMessage("Add limit: " + result + " " + min + " " + max);

        Symbolic.currentInput++;
        Symbolic.symbolicNumber++;

        return result;
    }

    
    public static int getConcreteInteger()
    {
        int result = 0;//= Execution.random.nextInt();

        if (Symbolic.currentInput > Symbolic.maxInput)
            result = Execution.random.nextInt();
        else {
            try { result = Integer.valueOf(Symbolic.inputValues.removeFirst()).intValue();}
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);
        
        return result;
    }



    public static boolean getConcreteBoolean()
    {
        boolean result = false;

        if (Symbolic.currentInput > Symbolic.maxInput)
            result = Execution.random.nextBoolean();
        else {
            try { result = Boolean.valueOf(Symbolic.inputValues.removeFirst()).booleanValue();}
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }



    public static byte getConcreteByte()
    {
        byte result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput)
           result = (byte)(Execution.random.nextInt(256) - 128);
        else {
            try { result = Integer.valueOf(Symbolic.inputValues.removeFirst()).byteValue(); }
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }



    public static char getConcreteChar()
    {
        char result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput)
            result = (char)Execution.random.nextInt(65536);
        else {
            try { result = (char)Integer.valueOf(Symbolic.inputValues.removeFirst()).intValue(); }
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }



    public static short getConcreteShort()
    {
        short result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput)
            result = (short)(Execution.random.nextInt(65536) - 32768);
        else {
            try { result = Integer.valueOf(Symbolic.inputValues.removeFirst()).shortValue(); }
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }



    public static long getConcreteLong()
    {
        long result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput)
            result = Execution.random.nextLong();
        else {
            try { result = Long.valueOf(Symbolic.inputValues.removeFirst()).longValue(); }
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }



    public static int getConcreteInteger(int min, int max)
    {
        int result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput) {
            int delta = max - min;

            if (delta < 0) {
                System.out.println("In LCT.getInteger(int min, int max) max was less than min. Please recheck your code.");
                System.exit(1);
            }

            int randomValue = Execution.random.nextInt(delta + 1);

            result = min + randomValue;
        }
        else {
            try { result = Integer.valueOf(Symbolic.inputValues.removeFirst()).intValue();}
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }


    public static int getConcreteShort(int min, int max)
    {
        int result = 0;

        if (Symbolic.currentInput > Symbolic.maxInput) {
            int delta = max - min;

            if (delta < 0) {
                System.out.println("In LCT.getShort(int min, int max) max was less than min. Please recheck your code.");
                System.exit(1);
            }

            int randomValue = Execution.random.nextInt(delta + 1);

            result = min + randomValue;
        }
        else {
            try { result = Integer.valueOf(Symbolic.inputValues.removeFirst()).shortValue();}
            catch (NumberFormatException e) {
                Execution.communication.sendMessage("INVALID INPUT VALUE RECEIVED");
                System.exit(-1);
            }
        }

        Execution.communication.sendMessage("Concrete input: " + result);

        return result;
    }

}
