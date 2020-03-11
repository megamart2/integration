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
import soot.jimple.*;
import soot.util.*;

import java.util.List;
import java.util.LinkedList;
import java.util.Map;
import java.util.Iterator;
import java.util.HashMap;

/**
 * CoreBodyTransformer replaces the classes defined in CoreReplacer
 * with alternative implementations.
 * 
 * @author ktkahkon
 */
public class CoreBodyTransformer extends BodyTransformer
{
    protected Chain<Local>          locals;
    protected PatchingChain<Unit>   units;
    protected SootMethod            method;
    protected SootClass             sootClass;
    protected Chain<SootField>      fields;


    private HashMap<String,SootClass> classesToBeReplaced;

    public void setClassesToBeReplaced(HashMap<String, SootClass> classesToBeReplaced)
    {
        this.classesToBeReplaced = classesToBeReplaced;
    }



    @Override
    protected void internalTransform (Body body, String phaseName, Map options)
    {        
        method       = body.getMethod();
        locals       = body.getLocals();
        units        = body.getUnits();
        sootClass    = method.getDeclaringClass();
        fields       = sootClass.getFields();

        instrumentLocals();
        instrumentFields();

        Iterator iStatement = units.snapshotIterator();

        while (iStatement.hasNext()) {
            Stmt statement = (Stmt)iStatement.next();

            instrumentStatement(statement);
        }
        
    }



    private void instrumentLocals()
    {
        Iterator i = locals.iterator();

        while (i.hasNext()) {
            Local l = (Local)i.next();

            if (classesToBeReplaced.containsKey(l.getType().toString()))
                l.setType(RefType.v(classesToBeReplaced.get(l.getType().toString())));
        }
    }



    private void instrumentFields()
    {
        Iterator i = fields.iterator();

        while (i.hasNext()) {
            SootField f = (SootField)i.next();

            if (classesToBeReplaced.containsKey(f.getType().toString()))
                f.setType(RefType.v(classesToBeReplaced.get(f.getType().toString())));
        }

    }

    

    private void instrumentStatement(Stmt statement)
    {
        List<ValueBox> foo = statement.getUseAndDefBoxes();

        Iterator i = foo.iterator();

        while (i.hasNext()) {
            ValueBox valueBox = (ValueBox) i.next();
            Value value = valueBox.getValue();

            if (value instanceof soot.jimple.Ref) {
                if (value.getType() instanceof soot.RefType) {
                    RefType rt = (RefType) value.getType();

                    if (classesToBeReplaced.containsKey(rt.getClassName()))
                        rt.setSootClass(classesToBeReplaced.get(rt.getClassName()));
                        //rt.setClassName(classesToBeReplaced.get(rt.getClassName()));
                }
                else if (value.getType() instanceof ArrayType) {
                    ArrayType at = (ArrayType) value.getType();

                    if (at.baseType instanceof RefType) {
                        RefType rt = (RefType) at.baseType;

                        if (classesToBeReplaced.containsKey(rt.getClassName()))
                            rt.setSootClass(classesToBeReplaced.get(rt.getClassName()));
                           // rt.setClassName(classesToBeReplaced.get(rt.getClassName()));
                    }
                }

            } else if (value instanceof soot.jimple.InvokeExpr) {
                InvokeExpr invoke = (InvokeExpr) value;

                instrumentInvokeExpression(invoke);

            } else if (value instanceof soot.jimple.NewExpr) {
                NewExpr n = (NewExpr)value;

                if (classesToBeReplaced.containsKey(n.getBaseType().getClassName()))
                    n.setBaseType(RefType.v(classesToBeReplaced.get(n.getBaseType().getClassName())));
            }
            else if (value instanceof CastExpr) {
                CastExpr ce = (CastExpr)value;

                if (classesToBeReplaced.containsKey(ce.getCastType().toString()))
                   ce.setCastType(RefType.v(classesToBeReplaced.get(ce.getCastType().toString())));
            }
            else if (value instanceof InstanceOfExpr) {
               InstanceOfExpr ioe = (InstanceOfExpr)value;

               if (classesToBeReplaced.containsKey(ioe.getCheckType().toString()))
                   ioe.setCheckType(RefType.v(classesToBeReplaced.get(ioe.getCheckType().toString())));
               
            }
        }
    }



    private void instrumentInvokeExpression (InvokeExpr invoke)
    {
        boolean isModified  = false;

        SootClass sc = null;
        if (classesToBeReplaced.containsKey(invoke.getMethodRef().declaringClass().toString())) {
            sc = classesToBeReplaced.get(invoke.getMethodRef().declaringClass().toString());
            //sc = new SootClass(classesToBeReplaced.get(invoke.getMethodRef().declaringClass().toString()));
            isModified = true;
        }
        else
            sc = invoke.getMethodRef().declaringClass();

        Type returnType = null;
        if (classesToBeReplaced.containsKey(invoke.getMethodRef().returnType().toString())) {
            returnType = RefType.v(classesToBeReplaced.get(invoke.getMethodRef().returnType().toString()));
            isModified = true;
        }
        else
            returnType = invoke.getMethodRef().returnType();

        LinkedList l = new LinkedList<Type>();
        for (Object paramType : invoke.getMethodRef().parameterTypes()) {
            Type t = (Type)paramType;
            if (classesToBeReplaced.containsKey(t.toString())) {
                l.add(RefType.v(classesToBeReplaced.get(t.toString())));
                isModified = true;
            }
            else
                l.add(t);
        }
        
        if (isModified) {
            SootMethodRef smr = Scene.v().makeMethodRef(sc,invoke.getMethodRef().name(),l,returnType,invoke.getMethodRef().isStatic());

            invoke.setMethodRef(smr);    
        }        
    }
}



