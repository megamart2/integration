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

package fi.hut.ics.lime.tester.instrumentation;

import soot.*;
import soot.jimple.*;

import java.util.LinkedList;

public class ObjectInstrumentation extends BasicInstrumentation
{

    /**
     * Extends the functionality of instrumentIfStatement in
     * BasicInstrumentation by adding symbolic condition statements when
     * the original statement is of the type obj_1 == obj_2.
     *
     * @param statement an if-statement to be instrumented
     */
    @Override
    protected void instrumentIfStatement (Stmt statement)
    {
        LinkedList<Value> values  = new LinkedList<Value>();
        IfStmt i                  = (IfStmt)statement;
        BinopExpr b               = (BinopExpr) i.getCondition();
        Value op1                 = b.getOp1();
        Value op2                 = b.getOp2();
        
        if (canBeObject(op1) && canBeObject(op2))
        {
            values.add(StringConstant.v(b.getSymbol().trim()));

            values.add(op1);
            values.add(op2);

            if (isCoverageCountingActive)
                values.add(IntConstant.v(Instrumentation.conditionID));
            else
                values.add(IntConstant.v(-1));

            InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(objectCondition.makeRef(), values);
            Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

            units.insertBefore(newStatement, statement);

            if (isCoverageCountingActive)
                Instrumentation.conditionID++;
        }
        else
            super.instrumentIfStatement(statement);
    }



    /**
     * Extends the functionality of basic assignment instrumentation
     * by initializing (possible) symbolic objects when one of their
     * fields are accessed.
     *
     * Object initialization must be done before the basic assignment
     * instrumentation is added because otherwise the symbolic fields might
     * not contain correct values.
     *
     * @param statement an assign statement to be instrumented
     */
    @Override
    protected void instrumentAssignStatement (Stmt statement)
    {
        AssignStmt a = (AssignStmt)statement;
        Value v1     = a.getLeftOp();
        Value v2     = a.getRightOp();

        if (v1 instanceof InstanceFieldRef){
            InstanceFieldRef r = (InstanceFieldRef)v1;
            Value base         = r.getBase();

            InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(initializeObject.makeRef(), base);
            Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

            units.insertBefore(newStatement, statement);
        }

        if (v2 instanceof InstanceFieldRef) {
            InstanceFieldRef r = (InstanceFieldRef)v2;
            Value base         = r.getBase();

            InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(initializeObject.makeRef(), base);
            Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

            units.insertBefore(newStatement, statement);
        }
        
        super.instrumentAssignStatement(statement);
    }



    protected boolean canBeObject (Value v)
    {
        return canBeObject(v.getType());
    }



    protected boolean canBeObject (Type t)
    {
        if (t instanceof RefType)
            return true;

        if (t instanceof NullType)
            return true;

        return false;
    }
}
