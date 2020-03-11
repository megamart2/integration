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
 * A stub code generator that can be used to close a system from the top (i.e.,
 * the stub code simulated the environment that uses a given interface implementation.
 * TopGenerator takes an interface and its implementation as input and produces
 * a class that calls the interface methods nondetermistically.
 *
 * @author ktkahkon
 */
public class TopGenerator
{
    public static void main( String[] args ) throws Exception
    {
        //TODO: check that all args are valid
        // first argument: Interface
        // second argument: Implementing class
        // third argument: Name of the resulting class
        // fourth argument: number of iterations
        String iterations = "true";
        String stubPackage = "";

        if (args.length >= 5)
            iterations = "testDepth < " + args[4];

        if (!args[3].equals("none"))
            stubPackage = "package " + args[3] + ";";

        LinkedList<String> methodList = new LinkedList<String>();

        //Get all public methods of the given class
        for (Method m : Class.forName(args[0]).getMethods()) {
            String s;

            if (Modifier.isPublic(m.getModifiers())) {
                s = m.getName();

                for (Class c : m.getParameterTypes())
                    s = s + " " + c.getName();

                methodList.add(s);
            }      
        }

        //Generate a stub code file
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(args[2] + ".java"));
            out.write(stubPackage + "\n");
            out.write("import java.util.Random;\n");
            out.write("import fi.hut.ics.lime.aspectmonitor.ExceptionOverride;\n");
            out.write("import fi.hut.ics.lime.partial.InconclusiveException;\n\n");
            out.write("public class " + args[2] + " {\n");
            out.write("    public static void main( String[] args ) {\n");
            out.write("        Random r = new Random();\n");
            out.write("        int testDepth = 0;\n");
            out.write("        " + args[1] + " obj = new " + args[1] + "();\n\n");
            out.write(generateVariables(methodList));
            out.write("        ExceptionOverride.setCallException(obj, InconclusiveException.class);\n\n");
          //  out.write("        try {\n");
            out.write("        while (" + iterations + ") {\n");
            out.write("           testDepth++;\n");
            out.write("           int i = r.nextInt(" + methodList.size() + ");\n");
            out.write("           switch (i) {\n");
            out.write(generateCallCases(methodList));
            out.write("           }\n");
            out.write("        }\n");
        //    out.write("        }\n        catch (RuntimeException e) { \n");
         //   out.write("            if (e instanceof InconclusiveException) {\n");
        //    out.write("                System.out.println(\"Test run was inconclusive.\");\n");
        //    out.write("                System.exit(0);\n");
        //    out.write("            }\n");
        //    out.write("            throw e;\n");
        //    out.write("        }\n");
            out.write("    }\n");
            out.write("}");
            out.close();
        } catch (IOException e) {
            //TODO
        }

        System.out.println( "DONE." );
    }



    /**
     * Generates a string where the variables needed by the stub code declared.
     * 
     * @param methodList
     * @return
     */
    private static String generateVariables(LinkedList<String> methodList)
    {
        String result = "";

        for (int i = 0; i < methodList.size(); i++) {
            StringTokenizer tokenizer = new StringTokenizer(methodList.get(i));

            String name      = tokenizer.nextToken();
            String argument  = "";
            int j            = 1;

            while (tokenizer.hasMoreTokens()) {
                argument = tokenizer.nextToken();

                String s = argument + " " + argument.replace(".","") + j;
                if (!result.contains(s))
                    result += "        " + s +";\n";

                j++;
            }
        }

        return result + "\n";
    }



    /**
     * Generates the calls to the interface methods.
     * 
     * @param methodList
     * @return
     */
    private static String generateCallCases(LinkedList<String> methodList)
    {
        String result = "";

        for (int i = 0; i < methodList.size(); i++) {
            StringTokenizer tokenizer   = new StringTokenizer(methodList.get(i));
            String name                 = tokenizer.nextToken();
            String arguments            = "";
            String random               = "";
            int j                       = 1;

            while (tokenizer.hasMoreTokens()) {
                String token = tokenizer.nextToken();

                if (arguments.equals(""))
                    arguments = token.replace(".","") + j;
                else
                    arguments += ", " + token.replace(".","") + j;

                random += token.replace(".","") + j + " = ";

                // TODO: float and double cause problems!
                if (token.equals("int"))
                    random += "r.nextInt(); ";
                else if (token.equals("boolean"))
                    random += "r.nextBoolean(); ";
                else if (token.equals("short"))
                    random += "r.nextShort(); ";
                else if (token.equals("byte"))
                    random += "r.nextByte(); ";
                else if (token.equals("long"))
                    random += "r.nextLong(); ";
                else if (token.equals("float"))
                    random += "r.nextFloat(); ";
                else if (token.equals("double"))
                    random += "r.nextDouble(); ";
                else if (token.equals("java.lang.String"))
                     random += "fi.hut.ics.lime.partial.RandomString.getString(r);";
                else
                    random += "new " + token + "(); ";
            }

            result += "                case " + i + ": ";
            result += random;
            result += "obj." + name + "(" + arguments + ");";
            result += " break;\n";
        }

        return result;
    }
}
