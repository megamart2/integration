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

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class ObjectStatement {

    //POSSIBLE TODO: argument String name -> Class objClass
    public static Object getObject (String name)
    {
        Object result = null;

        if (Symbolic.collectedObjectConstraints == Symbolic.ObjectConstraintOption.DO_NOT_COLLECT) {
            try {
                Class<?> myClass    = Class.forName(name);
                Object o            = myClass.newInstance();
                result              = o;
            }
            catch (Throwable e) {
                System.err.println("ERROR: getObject failed to create an object:");
                System.err.println(e);
                System.exit(-1);
            }

            Symbolic.mapR.put(result, Integer.toString(Symbolic.objectNumber));
        }
        else if (Symbolic.collectedObjectConstraints == Symbolic.ObjectConstraintOption.COLLECT)  {
            if (Symbolic.objectList.size() > 0) {
                String s = Symbolic.objectList.removeFirst();

                if (s.equals("0")) {
                    result = null;

                    Execution.communication.sendMessage("Concrete object: 0");
                }
                else {
                    if (Symbolic.objectMap.containsKey(s)) {
                        result = Symbolic.objectMap.get(s);

                        Execution.communication.sendMessage("Concrete object: " + s);
                    }
                    else {
                        try {
                            Class<?> myClass  = Class.forName(name);
                            Object o          = myClass.newInstance();
                            result            = o;
                        }
                        catch (Throwable e) {
                            System.err.println("ERROR (getObject 1):");
                            System.err.println(e);
                            System.exit(-1);
                        }

                        Symbolic.mapR.put(result, Integer.toString(Symbolic.objectNumber));
                        Symbolic.objectMap.put(s,result);
                        Execution.communication.sendMessage("Concrete object: " + s);
                    }
                }
            }
            else {
                try {
                    Class<?> myClass    = Class.forName(name);
                    Object o            = myClass.newInstance();
                    result              = o;
                }
                catch (Throwable e) {
                    System.err.println("ERROR (getObject 2):");
                    System.err.println(e);
                    System.exit(-1);
                }

                Symbolic.mapR.put(result, Integer.toString(Symbolic.objectNumber));
                Execution.communication.sendMessage("Concrete object: " + Symbolic.objectNumber);
            }
        }

        Symbolic.objectNumber++;

        return result;
    }


    //TODO: optimize checks (such as isSymbolic) to minimize runtime when
    //calling initializeObject on non-symbolic object.
    public static void initializeObject (Object o)
    {
        boolean isInitialized = false;
        boolean isSymbolic    = false;
        boolean hasInitMethod = false;

        String symbolicID     = "-1";

        try {
            Class<?> myClass = o.getClass();
            // TODO: make a more sensible check for symbolicInitialization method
            myClass.getDeclaredMethod("symbolicInitialization");

            hasInitMethod = true;
        } catch (NoSuchMethodException e) {
            hasInitMethod = false;
        }

        try {
            Class<?> myClass    = o.getClass();
            Field fieldList[]   = myClass.getDeclaredFields();

            if (Symbolic.mapR.containsKey(o)) {
                isSymbolic = true;

                if (Symbolic.mapInitialized.containsKey(o))
                    isInitialized = true;
                else
                    Symbolic.mapInitialized.put(o, null);
            }

            symbolicID = Symbolic.mapR.get(o);

            if (isSymbolic && isInitialized) {
                Execution.communication.sendMessage("Already initialized: " + "O" + symbolicID);
            }
            else if (isSymbolic && !isInitialized && hasInitMethod) {
                Execution.communication.sendMessage("Lazy initialization: " + "== O" + symbolicID + " " + symbolicID);

                Method initMethod  = myClass.getDeclaredMethod("symbolicInitialization");

                initMethod.invoke(o);
            }
            else if (isSymbolic && !isInitialized && !hasInitMethod) {
                Execution.communication.sendMessage("Lazy initialization: " + "== O" + symbolicID + " " + symbolicID);

                for (int i = 0; i < fieldList.length; i++) {
                    Field f     = fieldList[i];
                    String type = f.getType().getName();

                    // Static fields are not initialized
                    if (!Modifier.isStatic(f.getModifiers()) && SymbolicUtil.canBeSymbolic(type)) {
                        Execution.communication.sendMessage("Object field: "+ symbolicID + " " + f.getName());
            
                        boolean accessible = f.isAccessible();
                        if (!accessible)
                            f.setAccessible(true);

                        if (type.equals("int"))
                            f.setInt(o, InputStatement.getConcreteInteger());
                        else if (type.equals("boolean"))
                            f.setBoolean(o, InputStatement.getConcreteBoolean());
                        else if (type.equals("byte"))
                            f.setByte(o, InputStatement.getConcreteByte());
                        else if (type.equals("char"))
                            f.setChar(o, InputStatement.getConcreteChar());
                        else if (type.equals("short"))
                            f.setShort(o, InputStatement.getConcreteShort());
                        else if (type.equals("long"))
                            f.setLong(o, InputStatement.getConcreteLong());

                        if (f.isAccessible() && !accessible)
                            f.setAccessible(false);

                        SymbolicValueMapper.addFieldMapping(o, f.getName(), InputStatement.getSymbolicInput(type));
                        //symbolicNames.addLast("s_" + f.getName());
                        //symbolicTypes.addLast(type);
                    }
                    else if (!f.getType().isPrimitive()) {
                        Execution.communication.sendMessage("Object field: "+ symbolicID + " " + f.getName());

                        boolean accessible = f.isAccessible();
                        if (!accessible)
                            f.setAccessible(true);

                        f.set(o, getObject(type));

                        if (f.isAccessible() && !accessible)
                            f.setAccessible(false);
                    }
                }

//                while (symbolicNames.size() > 0) {
//                    int i = 0;
//
//                    for (i = 0; i < fieldList.length; i++) {
//                        Field f = fieldList[i];
//
//                        if (f.getName().equals(symbolicNames.getFirst())) {
//                            f.set(o, InputStatement.getSymbolicInput(symbolicTypes.getFirst()));
//                            i = fieldList.length;
//                        }
//                    }
//
//                    if (i != fieldList.length + 1) {
//                        System.out.println("Could not find field " + symbolicNames.getFirst());
//                        System.exit(-1);
//                    }
//                    symbolicNames.removeFirst();
//                    symbolicTypes.removeFirst();
//                }
            }
        } catch (Throwable e) {
              if(e instanceof SecurityException)
                  System.out.println("SecurityException");
              
                System.out.println("WARNING:");
                System.err.println(e);
              //  System.exit(-1);
        }
    }



    public static void objectCondition (String comparator, Object obj1, Object obj2, int id)
    {
        boolean isObject1Symbolic = false;
        boolean isObject2Symbolic = false;

        String obj1Number = "-1";
        String obj2Number = "-1";

        String branchTaken = "dont care";

        //TODO: is it possible to have other comparators?
        if (comparator.equals("=="))
            if (obj1 == obj2)
                branchTaken = "true";
            else
                branchTaken = "false";
        else if (comparator.equals("!="))
            if (obj1 != obj2)
                branchTaken = "true";
            else
                branchTaken = "false";

         Execution.communication.sendMessage("Branch ID: " + id + " " + branchTaken);

         if (branchTaken.equals("true"))
            Symbolic.branchString = Symbolic.branchString + "t";
         else
            Symbolic.branchString = Symbolic.branchString + "f";
        

        if (obj1 == null && obj2 == null)
            return;

        if (!(comparator.equals("==") || comparator.equals("!=")))
            return; 


        obj1Number = Symbolic.mapR.get(obj1);
        obj2Number = Symbolic.mapR.get(obj2);

        if (obj1Number != null)
            isObject1Symbolic = true;

        if (obj2Number != null)
            isObject2Symbolic = true;

        if (!isObject1Symbolic && !isObject2Symbolic)
            return;

        if (isObject1Symbolic) {
            if (isObject2Symbolic) {
                SymbolicUtil.sendBufferedPath();

                Execution.communication.sendMessage("New reference condition: " + comparator + " O" + obj1Number + " O" +
                                           obj2Number + " " + branchTaken + " " + Symbolic.branchString);
                Symbolic.branchString = "";
            }
            else if (obj2 == null) {
                SymbolicUtil.sendBufferedPath();

                Execution.communication.sendMessage("New reference condition: " + comparator + " O" + obj1Number + " 0 " + branchTaken + " " + Symbolic.branchString);
                Symbolic.branchString = "";
            }
        }
        else {
            if (obj1 == null) {
                SymbolicUtil.sendBufferedPath();

                Execution.communication.sendMessage("New reference condition: " + comparator + " O" + obj2Number + " 0 " + branchTaken + " " + Symbolic.branchString);
                Symbolic.branchString = "";
            }
        }


    }

}
