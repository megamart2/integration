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

import soot.*;
import soot.options.Options;

import java.util.Properties;

import fi.hut.ics.lime.tester.instrumentation.*;

/**
 * Class that instruments given byte code files using soot. Reads the
 * usersettings and defaultsettings files to determine what kind of
 * instrumentation is needed.
 */
public class Instrumenter
{
    public static void main(String[] args)
    {
        if(args.length == 0)
        {
            System.out.println("Usage: java Instrumenter [soot options] [file name]");
            System.exit(0);
        }

        /* Loading settings from default and user setting files*/
        Properties defaults = new java.util.Properties();
        java.net.URL url    = ClassLoader.getSystemResource("testerproperties/defaultsettings.properties");

        try {
            defaults.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open defaultsettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        Properties properties = new java.util.Properties(defaults);
        url = ClassLoader.getSystemResource("testerproperties/usersettings.properties");

        try {
            properties.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open usersettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        Instrumentation instrumenter = null;

        if (properties.getProperty("instrumentationType").equals("basic"))
            instrumenter = new BasicInstrumentation();
        else if (properties.getProperty("instrumentationType").equals("object"))
            instrumenter = new ObjectInstrumentation();
        else {
            System.err.println("Unknown instrumentationType found in tool properties files.");
            System.exit(-1);
        }

        String[] sootArguments;
        boolean hasCoreReplacement = true;

        if (args[args.length - 1].equals("-noreplacement")) {
            sootArguments = new String[args.length - 1];

            for (int i = 0; i < args.length - 1; i++)
                sootArguments[i] = args[i];

            hasCoreReplacement = false;
        }
        else
            sootArguments = args;


        PackManager.v().getPack("wjtp").add(new Transform("wjtp.lctinstrumentation", InstrumentationHandler.v(instrumenter, hasCoreReplacement)));

        Scene.v().addBasicClass("fi.hut.ics.lime.tester.coreclasses.LCTInteger",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.coreclasses.LCTBoolean",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.coreclasses.LCTByte",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.coreclasses.LCTShort",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.coreclasses.LCTLong",SootClass.BODIES);

        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.BasicStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.CallStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.Initializer",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.InputStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.ObjectStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.LCTStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.SpecialStatement",SootClass.BODIES);
        Scene.v().addBasicClass("fi.hut.ics.lime.tester.symbolicexecution.SymbolicValueMapper",SootClass.BODIES);

        Options.v().set_keep_line_number(true);

        soot.Main.main(sootArguments);
    }
}
