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

package fi.hut.ics.lime.tester.instrumentation;

import soot.*;
import soot.jimple.JimpleBody;

import java.util.Map;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.HashMap;
import java.util.Properties;
import soot.jimple.InvokeExpr;
import soot.jimple.InvokeStmt;
import soot.jimple.StringConstant;


public class InstrumentationHandler extends SceneTransformer {
    private static InstrumentationHandler instance = null;
    private HashMap<String,SootClass> classesToBeReplaced;
    protected Instrumentation instrumenter;
    protected boolean hasCoreReplacement;

    
    public static InstrumentationHandler v(Instrumentation instrumenter, boolean replacement)
    {
        if (instance == null) {
            instance = new InstrumentationHandler();
            instance.instrumenter = instrumenter;
            instance.hasCoreReplacement = replacement;
        }

        return instance;
    }


    protected void internalTransform (String phaseName, Map options)
    {
        Properties properties     = Instrumentation.loadProperties("testerproperties/usersettings.properties","testerproperties/defaultsettings.properties");

        System.out.println("Starting Instrumentation...");

        String clinitClasses="";

        determineSupportedCoreClasses();

        CoreBodyTransformer coreBodyTransformer = new CoreBodyTransformer();
        CoverageInformer informer               = new CoverageInformer();

        coreBodyTransformer.setClassesToBeReplaced(classesToBeReplaced);

        Iterator classes = Scene.v().getApplicationClasses().iterator();

        JimpleBody mainBody = null;

        while (classes.hasNext()) {
            SootClass theClass = (SootClass) classes.next();
            Iterator methods = theClass.getMethods().iterator();

            while (methods.hasNext()) {
                SootMethod method = (SootMethod)methods.next();
                if (method.getName().equals("<clinit>")) {
                    clinitClasses+=method.getDeclaringClass().getName()+"\n";
                }

                if (Integer.parseInt(properties.getProperty("instrumentationVerbosity"))>0) {
                    System.out.println("-----------------------------------------------------------");
                    System.out.println("Instrumenting method: " + method.getSignature());
                }

                if (hasCoreReplacement)
                    instrumentMethodSignature(method);

                try {
                    if (!method.isAbstract()) {
                        JimpleBody body             = (JimpleBody) method.retrieveActiveBody();
                        BodyTransformer transformer = (BodyTransformer) (coreBodyTransformer);

                        if (hasCoreReplacement)
                            transformer.transform(body, phaseName, options);

                        transformer = (BodyTransformer)(instrumenter);

                        transformer.transform(body, phaseName, options);

                        if (method.getSubSignature().equals("void main(java.lang.String[])"))
                            mainBody = body;
                    }

                } catch (RuntimeException ex) {
                    System.err.println("Exception occurred while processing " + method);
                    throw ex;
                }

                if (Integer.parseInt(properties.getProperty("instrumentationVerbosity"))>0) {
                    System.out.println("-----------------------------------------------------------");
                }
            }
        }

        if (mainBody != null) {
            try {
                BodyTransformer transformer = (BodyTransformer)(informer);
                transformer.transform(mainBody, phaseName, options);

            } catch (RuntimeException ex) {
                    System.err.println("Exception occurred while modifying main method");
                    throw ex;
            }
        }

        for (InvokeStmt s : Instrumentation.initStatements) {
            InvokeExpr e = s.getInvokeExpr();
            e.setArg(6, StringConstant.v(clinitClasses));
        }
    }



    private void instrumentMethodSignature (SootMethod method)
    {
        // Modifying parameter types
        List<Type> params = method.getParameterTypes();
        LinkedList<Type> newParameters = new LinkedList<Type>();

        Iterator i = params.iterator();

        while (i.hasNext()) {
            Type t = (Type)i.next();

            if (classesToBeReplaced.containsKey(t.toString()))
                newParameters.add(RefType.v(classesToBeReplaced.get(t.toString())));
            else
                newParameters.add(t);
        }

        method.setParameterTypes(newParameters);


        // Modifying return type
        if (classesToBeReplaced.containsKey(method.getReturnType().toString()))
            method.setReturnType(RefType.v(classesToBeReplaced.get(method.getReturnType().toString())));
    }


    /**
     * This method can be used to select which classes get replaced with alternative implementations.
     *
     * NOTE: If new core classes are added here, remember to add Scene.v().addBasicClass calls to
     * tester.Replacer as well. (Otherwise the instrumentation might fail at a method that uses the
     * core class in question. More specifically, methods that are not used in the program under
     * test will cause problems.)
     */
    private void determineSupportedCoreClasses()
     {
         classesToBeReplaced = new HashMap<String,SootClass>();


         classesToBeReplaced.put("java.lang.Integer", Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.coreclasses.LCTInteger"));
         classesToBeReplaced.put("java.lang.Byte",  Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.coreclasses.LCTByte"));
         classesToBeReplaced.put("java.lang.Boolean",  Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.coreclasses.LCTBoolean"));
         classesToBeReplaced.put("java.lang.Short",  Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.coreclasses.LCTShort"));
         classesToBeReplaced.put("java.lang.Long",  Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.coreclasses.LCTLong"));

     }
}
