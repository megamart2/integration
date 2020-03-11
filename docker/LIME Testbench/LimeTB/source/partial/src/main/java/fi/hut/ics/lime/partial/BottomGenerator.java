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

package fi.hut.ics.lime.partial;

import java.lang.reflect.*;
import java.io.*;
import java.util.LinkedList;
import java.lang.reflect.Modifier;
import java.util.StringTokenizer;

/**
 * A stub code generator that creates a new class based on a given interface
 * declaration. The generated class implements the interface methods by
 * returning random values.
 *
 * TODO: - Add support for java.lang.Strings and possibly other basic classes.
 *       - Add checks that the arguments given to the program are valid.
 *
 * @author ktkahkon
 */
public class BottomGenerator
{
    public static void main (String[] args) throws Exception
    {
        String stubPackage = "";

        if (args.length >= 3)
            if (!args[2].equals("none"))
                stubPackage = "package " + args[2] + ";";

        LinkedList<String> methodList = new LinkedList<String>();

        // Get all public methods of the given class
        for (Method m : Class.forName(args[0]).getMethods()) {
            String s = "";

            if (Modifier.isPublic(m.getModifiers())) {
                s = m.getReturnType().getName();
                s = s + " " + m.getName();
  
                for (Class c : m.getParameterTypes())
                    s = s + " " + c.getName();

                methodList.add(s);
            }
        }

        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(args[1] + ".java"));
            out.write(stubPackage + "\n");
            out.write("import java.util.Random;\n");
            out.write("import fi.hut.ics.lime.aspectmonitor.ExceptionOverride;\n");
            out.write("import fi.hut.ics.lime.partial.InconclusiveException;\n\n");
            out.write("public class " + args[1] + " implements " + args[0] + " {\n");
            out.write("    private Random r;\n\n");
            out.write("    " + args[1] + "() {\n");
            out.write("        r = new Random();\n");
            out.write("    }\n\n");
            out.write(generateMethods(methodList));
            out.write("}");
            out.close();
        } catch (IOException e) {
            //TODO: error handling/reporting
        }

        System.out.println( "DONE." );
    }



    /**
     * Formats the methodList to a form suitable for writing into a file.
     *
     * @param methodList    a list that contains the methods in the interface
     *                      in a format (return type, method name, argument types)
     * @return              a string formated to be written to a file
     */
    private static String generateMethods(LinkedList<String> methodList)
    {
        String result = "";

        for (int i = 0; i < methodList.size(); i++) {
            StringTokenizer tokenizer   = new StringTokenizer(methodList.get(i));
            String returnValue          = tokenizer.nextToken();
            String name                 = tokenizer.nextToken();
            String arguments            = "";
            int j                       = 1;

            while (tokenizer.hasMoreTokens()) {
                String token = tokenizer.nextToken();

                if (arguments.equals(""))
                    arguments = token + " arg" + j;
                else
                    arguments += ", " + token + " arg" + j;
            }

            result += "     public " + returnValue + " " + name + "(" + arguments + ") {\n";
            result += "        ExceptionOverride.setReturnException(this, InconclusiveException.class);\n";

            if (returnValue.equals("int"))
                result += "        return r.nextInt();\n";
            else if (returnValue.equals("boolean"))
                result += "        return r.nextBoolean();\n";
            else if (returnValue.equals("short"))
                result += "        return r.nextShort();\n";
            else if (returnValue.equals("byte"))
                result += "        return r.nextByte();\n";
            else if (returnValue.equals("long"))
                result += "        return r.nextLong();\n";
            else if (returnValue.equals("float"))
                result += "        return r.nextFloat();\n";
            else if (returnValue.equals("double"))
                result += "        return r.nextDouble();\n";
            else if (returnValue.equals("void"))
                result += "\n";
            else if (returnValue.equals("java.lang.String"))
                result += "        return fi.hut.ics.lime.partial.RandomString.getString(r);\n";
            else
                result += "        return new " + returnValue + "();\n";

            result += "    }\n\n";
        }

        return result;
    }
    
}
