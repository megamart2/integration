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
import soot.tagkit.Tag;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.StringTokenizer;
import java.util.List;
import java.util.Iterator;

/**
 * Basic instrumentation class that enables symbolic execution.
 * The instumentation is meant for sequential programs only and
 * does not add support for symbolic object references.
 *
 * @author ktkahkon
 */
public class BasicInstrumentation extends Instrumentation
{

    @Override
    protected Stmt getInitializationStmt()
    {
        LinkedList<Value> values = new LinkedList<Value>();

        values.add(StringConstant.v(address));
        values.add(IntConstant.v(port));
        values.add(IntConstant.v(executionVerbosity));
        values.add(StringConstant.v(solver));
        values.add(StringConstant.v(heuristicClass));
        values.add(StringConstant.v(heuristicMethod));
        values.add(StringConstant.v(""));
        values.add(IntConstant.v(readsCommute ? 1 : 0));

        InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(initialize.makeRef(), values);
        InvokeStmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

        initStatements.add(newStatement);
        return newStatement;
    }
    
    @Override
    protected void instrumentGotoStatement (Stmt statement)
    {
        InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(executeGoto.makeRef());
        Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

        units.insertBefore(newStatement, statement);
    }

    @Override
    protected void scheduleAssignStatement(Stmt statement)
    {
        AssignStmt a = (AssignStmt) statement;
        Value v1 = a.getLeftOp();
        Value v2 = a.getRightOp();

        if (v1 instanceof FieldRef) {
            // case: field = local or constant
            if (!(v2 instanceof Local || v2 instanceof Constant)) {
                printIncompleteInstrumentationWarning(statement);
            }

            FieldRef r=(FieldRef)v1;
            if (!r.getField().isFinal()) {
                Value base = getRefBase(r);

                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                StringConstant fieldName = StringConstant.v(r.getField().getName());
                InvokeStmt pre = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(preWrite.makeRef(),
                                Arrays.asList(sourceLocation, base, fieldName)));

                insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);
            }

        } else if (v1 instanceof Local) {

            Value realV2;
            if (v2 instanceof CastExpr) {
                CastExpr ce = (CastExpr) v2;
                realV2 = ce.getOp();
            } else {
                realV2 = v2;
            }

            if (realV2 instanceof FieldRef) {
                // case: local = field
                FieldRef r=(FieldRef)realV2;
                if (!r.getField().isFinal()) {
                    Value base = getRefBase(r);

                    StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                    StringConstant fieldName = StringConstant.v(r.getField().getName());
                    InvokeStmt pre = Jimple.v().newInvokeStmt(
                            Jimple.v().newStaticInvokeExpr(preRead.makeRef(),
                                    Arrays.asList(sourceLocation, base, fieldName)));

                    insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);
                }

            } else if (realV2 instanceof ArrayRef) {
                // case: local = array[i]
                ArrayRef r = (ArrayRef) realV2;

                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value base = r.getBase();
                Value fieldNumber = r.getIndex();
                InvokeStmt pre = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(preReadIndex.makeRef(),
                                Arrays.asList(sourceLocation, base, fieldNumber)));

                insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);

            } else if (realV2 instanceof LengthExpr) {
                // case: local = lengthof array
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value base = ((LengthExpr) realV2).getOp();
                StringConstant fieldName = StringConstant.v("length");
                InvokeStmt pre = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(preRead.makeRef(),
                                Arrays.asList(sourceLocation, base, fieldName)));

                insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);

            }

        } else if (v1 instanceof ArrayRef) {
            // case: array[i] = local or constant
            if (!(v2 instanceof Local || v2 instanceof Constant)) {
                printIncompleteInstrumentationWarning(statement);
            }

            ArrayRef r = (ArrayRef) v1;

            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            Value base = r.getBase();
            Value fieldNumber = r.getIndex();
            InvokeStmt pre = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(preWriteIndex.makeRef(),
                            Arrays.asList(sourceLocation, base, fieldNumber)));

            insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);
        }
    }

    @Override
    protected void instrumentAssignStatement (Stmt statement)
    {
        if (statement.containsInvokeExpr()) {
            InvokeExpr expression = (InvokeExpr)statement.getInvokeExpr();

            if (!expression.toString().contains("tester.LCT")) 
                handleFunctionCallAssignments(statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: int getInteger()>"))
                addSymbolicInput("integer", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: boolean getBoolean()>"))
                addSymbolicInput("boolean", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: char getChar()>"))
                addSymbolicInput("character", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: byte getByte()>"))
                addSymbolicInput("byte", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: short getShort()>"))
                addSymbolicInput("short", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: long getLong()>"))
                addSymbolicInput("long", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: int getInteger(int,int)>"))
                addLimitedSymbolicInput("integer", statement);
            else if (expression.getMethod().getSignature().equals("<fi.hut.ics.lime.tester.LCT: short getShort(int,int)>"))
                addLimitedSymbolicInput("short", statement);
            else
                handleFunctionCallAssignments(statement);
        }
        else {
            AssignStmt a = (AssignStmt)statement;
            Value v1     = a.getLeftOp();
            Value v2     = a.getRightOp();

            // case: symbolic local = symbolic local
            if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof Local && canBeSymbolic(v2)) {
                Local l1 = (Local)v1;
                Local l2 = (Local)v2;
                Local s1 = getSymbolicLocal(l1);
                Local s2 = getSymbolicLocal(l2);

                Stmt newStatement = Jimple.v().newAssignStmt(s1, s2);
                units.insertBefore (newStatement, statement);
            }
            // case: a = b [op] c
            // Soot should first assign fields to local variables, so handling only locals is enough.
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof BinopExpr) {
                Local l                     = (Local) v1;
                BinopExpr b                 = (BinopExpr) v2;
                LinkedList<Value> values    = new LinkedList<Value>();
                Value op1                   = b.getOp1();
                Value op2                   = b.getOp2();
                Local s0                    = getSymbolicLocal(l);
                String operator             = b.getSymbol().trim();
                Local valueTemp             = getSymbolicLocal("s_value_temp");
                Local valueTemp2            = getSymbolicLocal("s_value_temp_2");
                Local valueTemp3            = getSymbolicLocal("s_value_temp_3");

                values.add(StringConstant.v(operator));

                if (op1 instanceof Local && canBeSymbolic(op1))
                    values.add(getSymbolicLocal((Local)op1));
                else if (op1 instanceof Constant)
                    values.add(StringConstant.v(op1.toString()));

                if (op2 instanceof Local && canBeSymbolic(op2))
                    values.add(getSymbolicLocal((Local)op2));
                else if (op2 instanceof Constant)
                    values.add(StringConstant.v(op2.toString()));

                // NOTE: the second temp value could be eliminated if only bitvectors were used to solve constraints
                // NOTE2: temp3 value could be eliminated if a check whether the symbolic value if null is made
                //        (and if it is null, the value is replaced with the concrete value)
                values.add(valueTemp2);
                values.add(valueTemp3);
                values.add(valueTemp);

                if (values.size() != 6) {
                    // set to concrete if assignment does not use symbolic variables
                    if (!canBeSymbolic(op1) || !canBeSymbolic(op2)) {
                        InvokeExpr ie = concreteToString(v1);
                        Stmt s  = Jimple.v().newAssignStmt(s0, ie);
                        units.insertAfter(s, statement);
                        return;
                    }
                    else {
                        System.err.println("INSTRUMENTER ERROR: problem with binop assignment. Op1 or op2 is not local or constant.");
                        return;
                    }
                }

                values.add(StringConstant.v(v1.getType().toString()));

                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(assignment.makeRef(), values);
                Stmt newStatement        = Jimple.v().newAssignStmt(s0, newExpression);
                units.insertAfter(newStatement, statement);

                newExpression = concreteToString(v1);
                newStatement  = Jimple.v().newAssignStmt(valueTemp, newExpression);
                units.insertAfter(newStatement, statement);

                newExpression = concreteToString(op2);
                newStatement  = Jimple.v().newAssignStmt(valueTemp3, newExpression);
                units.insertBefore(newStatement, statement);

                newExpression = concreteToString(op1);
                newStatement  = Jimple.v().newAssignStmt(valueTemp2, newExpression);
                units.insertBefore(newStatement, statement);

                if (operator.equals("/") && op2 instanceof Local && canBeSymbolic(op2)) {
                    newExpression = Jimple.v().newStaticInvokeExpr(divisionCheck.makeRef(), getSymbolicLocal((Local)op2), valueTemp3);
                    newStatement  = Jimple.v().newInvokeStmt(newExpression);
                    units.insertBefore(newStatement, statement);
                }
            }
            // case: symbolic local = -symbolic local
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof NegExpr) {
                NegExpr ne = (NegExpr)v2;
                Value op = ne.getOp();

                if (canBeSymbolic(op) && op instanceof Local) {
                    Local l                     = (Local) v1;
                    Local l2                    = (Local) op;
                    LinkedList<Value> values    = new LinkedList<Value>();
                    String operator             = "-";
                    Local valueTemp             = getSymbolicLocal("s_value_temp");

                    values.add(StringConstant.v(operator));
                    values.add(StringConstant.v("0"));
                    values.add(getSymbolicLocal(l2));

                    values.add(StringConstant.v("0"));
                    values.add(StringConstant.v("0"));
                    values.add(valueTemp);

                    values.add(StringConstant.v(v1.getType().toString()));

                    InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(assignment.makeRef(), values);
                    Stmt newStatement        = Jimple.v().newAssignStmt(getSymbolicLocal(l), newExpression);
                    units.insertAfter(newStatement, statement);

                    newExpression = concreteToString(v1);
                    newStatement  = Jimple.v().newAssignStmt(valueTemp, newExpression);
                    units.insertAfter(newStatement, statement);

                }
            }
            // case: symbolic local = constant
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof Constant) {
                Local s           = getSymbolicLocal((Local)v1);
                Stmt newStatement = Jimple.v().newAssignStmt(s, StringConstant.v(v2.toString()));

                units.insertBefore(newStatement, statement);
            }
            // case: symbolic field = symbolic local
            else if (v1 instanceof InstanceFieldRef && canBeSymbolic(v1) && v2 instanceof Local && canBeSymbolic(v2)) {
                InstanceFieldRef r      = (InstanceFieldRef)v1;
                Value base              = r.getBase();
                Local s                 = getSymbolicLocal((Local)v2);

                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(base);
                values.add(StringConstant.v(r.getField().getName()));
                values.add(s);
                
                Expr newExpression = Jimple.v().newStaticInvokeExpr(putField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: symbolic local = symbolic field
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof InstanceFieldRef && canBeSymbolic(v2)) {
                InstanceFieldRef r      = (InstanceFieldRef)v2;
                Value base              = r.getBase();
                Local s                 = getSymbolicLocal((Local)v1);

                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(base);
                values.add(StringConstant.v(r.getField().getName()));

                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(getField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newAssignStmt(s, newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: symbolic field = constant
            else if (v1 instanceof InstanceFieldRef && canBeSymbolic(v1) && v2 instanceof Constant) {
                InstanceFieldRef r      = (InstanceFieldRef)v1;
                Value base              = r.getBase();

                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(base);
                values.add(StringConstant.v(r.getField().getName()));
                values.add(StringConstant.v(v2.toString()));

                Expr newExpression = Jimple.v().newStaticInvokeExpr(putField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: symbolic static field = symbolic local
            else if (v1 instanceof StaticFieldRef && v2 instanceof Local && canBeSymbolic(v2)) {
                StaticFieldRef r        = (StaticFieldRef)v1;
                Local s                 = getSymbolicLocal((Local)v2);
                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(StringConstant.v(r.toString()));
                values.add(s);

                Expr newExpression = Jimple.v().newStaticInvokeExpr(putStaticField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: symbolic local = symbolic static field
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof StaticFieldRef) {
                StaticFieldRef r        = (StaticFieldRef)v2;
                Local s                 = getSymbolicLocal((Local)v1);

                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(StringConstant.v(r.toString()));

                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(getStaticField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newAssignStmt(s, newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: static field = constant
            else if (v1 instanceof StaticFieldRef && canBeSymbolic(v1) && v2 instanceof Constant) {
                StaticFieldRef r        = (StaticFieldRef)v1;
                
                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(StringConstant.v(r.toString()));
                values.add(StringConstant.v(v2.toString()));

                Expr newExpression = Jimple.v().newStaticInvokeExpr(putStaticField.makeRef(), values);
                Stmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: array[i] = local
            else if (v1 instanceof ArrayRef && v2 instanceof Local && canBeSymbolic(v2)) {
                ArrayRef r              = (ArrayRef)v1;
                Value base              = r.getBase();
                Local s                 = getSymbolicLocal((Local)v2);

                LinkedList<Value> values    = new LinkedList<Value>();

                values.add(base);
                values.add(r.getIndex());
                values.add(s);

                Expr newExpression = Jimple.v().newStaticInvokeExpr(putArray.makeRef(), values);
                Stmt newStatement  = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            // case: array[i] = constant
            else if (v1 instanceof ArrayRef && v2 instanceof Constant) {
                ArrayRef r              = (ArrayRef)v1;

                if (canBeSymbolic(r.getType())) {
                    Value base              = r.getBase();
                    
                    LinkedList<Value> values    = new LinkedList<Value>();

                    values.add(base);
                    values.add(r.getIndex());
                    values.add(StringConstant.v(v2.toString()));

                    Expr newExpression = Jimple.v().newStaticInvokeExpr(putArray.makeRef(), values);
                    Stmt newStatement = Jimple.v().newInvokeStmt(newExpression);

                    units.insertBefore(newStatement, statement);
                }
            }
            // case: symbolic local = array[i]
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof ArrayRef) {
                ArrayRef r              = (ArrayRef)v2;

                if (canBeSymbolic(r.getType())) {
                    Value base              = r.getBase();
                    Local s                 = getSymbolicLocal((Local)v1);

                    LinkedList<Value> values    = new LinkedList<Value>();

                    values.add(base);
                    values.add(r.getIndex());

                    InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(getArray.makeRef(), values);
                    Stmt newStatement = Jimple.v().newAssignStmt(s, newExpression);

                    units.insertBefore(newStatement, statement);
                }
            }
            // case: local = lengthof array
            else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof LengthExpr) {
                Local s = getSymbolicLocal((Local)v1);

                InvokeExpr newExpression = concreteToString(v1);
                Stmt newStatement        = Jimple.v().newAssignStmt (s, newExpression);

                units.insertAfter (newStatement, statement);
            }
             // case: local = cast
             // TODO: test this more and implement rest of the cases!
             else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof CastExpr) {
                Local l1 = (Local)v1;
                CastExpr ce = (CastExpr)v2;
                Value v = ce.getOp();

                if (v instanceof Local && canBeSymbolic(v)) {
                    Local l2 = (Local)v;
                    Local s1 = getSymbolicLocal(l1);
                    Local s2 = getSymbolicLocal(l2);

                    Stmt newStatement = Jimple.v().newAssignStmt(s1, s2);
                    units.insertBefore (newStatement, statement);
                }
                //TODO: static field refs?
                else if (v instanceof InstanceFieldRef && canBeSymbolic(v)) {
                    InstanceFieldRef r      = (InstanceFieldRef)v;
                    Value base              = r.getBase();
                    Local s                 = getSymbolicLocal((Local)v1);

                    LinkedList<Value> values    = new LinkedList<Value>();

                    values.add(base);
                    values.add(StringConstant.v(r.getField().getName()));

                    InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(getField.makeRef(), values);
                    Stmt newStatement  = Jimple.v().newAssignStmt(s, newExpression);

                    units.insertBefore(newStatement, statement);
                }
                else if (!canBeSymbolic(v)) {
                    Expr newExpression = concreteToString(v1);
                    Stmt newStatement  = Jimple.v().newAssignStmt(getSymbolicLocal(l1), newExpression);
                    units.insertAfter(newStatement, statement);
                }

             }
             // case local boolean = Y instanceof X (in jimple Y is always local)
             else if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof InstanceOfExpr) {
                Local s = getSymbolicLocal((Local)v1);

                InvokeExpr newExpression = concreteToString(v1);
                Stmt newStatement        = Jimple.v().newAssignStmt(s, newExpression);

                units.insertAfter(newStatement, statement);
             }
             // fallback for some cases. The instrumentation should not proceed to these cases
             else if (v1 instanceof Local && canBeSymbolic(v1))
             {
                printIncompleteInstrumentationWarning(statement);

                Local s = getSymbolicLocal((Local)v1);

                InvokeExpr newExpression = concreteToString(v1);
                Stmt newStatement        = Jimple.v().newAssignStmt(s, newExpression);

                units.insertAfter(newStatement, statement);
             }
        }
    }


    @Override
    protected void instrumentIfStatement (Stmt statement)
    {
        LinkedList<Value> values  = new LinkedList<Value>();
        LinkedList<Value> values2;
        IfStmt i                  = (IfStmt)statement;
        BinopExpr b               = (BinopExpr) i.getCondition();
        Value op1                 = b.getOp1();
        Value op2                 = b.getOp2();
        boolean s1Added           = false;
        boolean s2Added           = false;

        String c                  = b.toString();
        StringTokenizer tokenizer = new StringTokenizer(c);

        String first              = tokenizer.nextToken();
                                    tokenizer.nextToken();
        String third              = tokenizer.nextToken();

    //    if (canBeSymbolic(op1) && canBeSymbolic(op2)) {
            values.add(StringConstant.v(b.getSymbol().trim()));

            if (op1 instanceof Local && canBeSymbolic(op1)) {
                Local s1 = getSymbolicLocal((Local)op1);
                s1Added  = true;

                values.add(s1);
            }
            else // should be constant
                values.add(StringConstant.v(first));

            if (op2 instanceof Local && canBeSymbolic(op2)) {
                Local s2 = getSymbolicLocal((Local)op2);
                s2Added  = true;

                values.add(s2);
            }
            else
                values.add(StringConstant.v(third));


            Local valueTemp = getSymbolicLocal("s_value_temp");
            Local valueTemp2 = getSymbolicLocal("s_value_temp_2");


            values.add(valueTemp);
            values.add(valueTemp2);

            if (isCoverageCountingActive)
                values.add(IntConstant.v(Instrumentation.conditionID));
            else
                values.add(IntConstant.v(-1));

            values2 = new LinkedList<Value>(values);
            values.add(StringConstant.v("true"));
            values2.add(StringConstant.v("false"));

          //  if (s1Added || s2Added) {
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(condition.makeRef(), values);
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);

                Stmt newStatement2 = Jimple.v().newGotoStmt(statement);

                units.insertBefore(newStatement2, newStatement);

                newExpression = Jimple.v().newStaticInvokeExpr(condition.makeRef(), values2);
                Stmt newStatement3 = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement3, newStatement2);

                Stmt newIf = Jimple.v().newIfStmt(i.getCondition(), newStatement);
                units.insertBefore(newIf,newStatement3);


                newExpression = concreteToString(op1);

                if (newExpression != null)
                    newStatement  = Jimple.v().newAssignStmt(valueTemp, newExpression);
                else
                    newStatement  = Jimple.v().newAssignStmt(valueTemp, StringConstant.v("null"));

                units.insertBefore(newStatement, newIf);

                newExpression = concreteToString(op2);

                if (newExpression != null)
                    newStatement  = Jimple.v().newAssignStmt(valueTemp2, newExpression);
                else
                    newStatement  = Jimple.v().newAssignStmt(valueTemp2, StringConstant.v("null"));
                
                units.insertBefore(newStatement, newIf);

                if (isCoverageCountingActive)
                    Instrumentation.conditionID++;
        //    }
       // }
    }



    @Override
    protected void instrumentSwitchStatement (Stmt statement)
    {
        LinkedList<Value> values   = new LinkedList<Value>();
        LookupSwitchStmt l         = (LookupSwitchStmt)statement;
        Local s                    = getSymbolicLocal((Local)l.getKey());
        // TODO: FIXME real type
        List<?> list               = l.getLookupValues();
        String lookupValues        = "";

        int i = 0;
        int counter = 0;
        while (i < list.size()) {
            lookupValues = lookupValues + " " + list.get(i);
            i++;
            counter++;
        }

        values.add(s);
        values.add(l.getKey());
        values.add(StringConstant.v(lookupValues));

        if (isCoverageCountingActive)
            values.add(IntConstant.v(Instrumentation.conditionID));
        else
            values.add(IntConstant.v(-1));

        InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr (executeSwitch.makeRef(), values);
        Stmt newStatement        = Jimple.v().newInvokeStmt (newExpression);

        units.insertBefore(newStatement, statement);

        if (isCoverageCountingActive)
            Instrumentation.conditionID += counter;
    }



    @Override
    protected void instrumentTableSwitchStatement (Stmt statement)
    {
        LinkedList<Value> values   = new LinkedList<Value>();
        TableSwitchStmt t          = (TableSwitchStmt)statement;
        Local s                    = getSymbolicLocal((Local)t.getKey());
        String targets             = "";

        int i = t.getLowIndex();
        int counter = 0;
        while (i <= t.getHighIndex()) {
            targets = targets + " " + i;
            i++;
            counter++;
        }

        values.add(s);
        values.add(t.getKey());
        values.add(StringConstant.v(targets));

        if (isCoverageCountingActive)
            values.add(IntConstant.v(Instrumentation.conditionID));
        else
            values.add(IntConstant.v(-1));

        InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr (executeSwitch.makeRef(), values);
        Stmt newStatement        = Jimple.v().newInvokeStmt (newExpression);

        units.insertBefore(newStatement, statement);

        if (isCoverageCountingActive)
            Instrumentation.conditionID += counter;
    }



    @Override
    protected void instrumentInvokeStatement (Stmt statement)
    {
        InvokeExpr iexpr = (InvokeExpr) ((InvokeStmt)statement).getInvokeExpr();

        Unit firstBefore = null;       
        
        if (iexpr instanceof StaticInvokeExpr) {
            SootMethod target = ((StaticInvokeExpr)iexpr).getMethod();

            if (target.getSignature().equals("<java.lang.System: void exit(int)>")) {
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(end.makeRef(),iexpr.getArg(0));
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
                if (firstBefore == null)
                    firstBefore = newStatement;
            }
            else if (target.getSignature().equals("<fi.hut.ics.lime.tester.LCT: void dropTest()>")) {
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(dropTest.makeRef());
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);

                if (firstBefore == null)
                    firstBefore = newStatement;
            }
        }

        for (int i = 0; i < iexpr.getArgCount(); i++) {
            Value v = iexpr.getArg(i);
      
            
            if (v instanceof Local && canBeSymbolic(v)) {
                Local s                  = getSymbolicLocal((Local)v);
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(put.makeRef(),
                                                                          StringConstant.v(iexpr.getMethod().getName()),
                                                                          s);
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
                if (firstBefore == null)
                    firstBefore = newStatement;
            }
            else if (v instanceof Constant && canBeSymbolic(v)) {
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(put.makeRef(),
                                                                          StringConstant.v(iexpr.getMethod().getName()),
                                                                          StringConstant.v(v.toString()));
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);

                if (firstBefore == null)
                    firstBefore = newStatement;
            }
        }

        SootMethod target = iexpr.getMethod();
        String signature = target.getSignature();
        if (iexpr instanceof InstanceInvokeExpr) {
            InstanceInvokeExpr iiexpr = (InstanceInvokeExpr) iexpr;
            if (signature.equals("<java.lang.Object: void wait()>")) {
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value monitorObject = iiexpr.getBase();
                Unit newCall = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(doWait.makeRef(),
                                Arrays.asList(sourceLocation, monitorObject)));

                units.swapWith(statement, newCall);
            } else if (signature.equals("<java.lang.Object: void wait(long)>")) {
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value monitorObject = iiexpr.getBase();
                Value timeout = iexpr.getArg(0);
                Unit newCall = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(doWaitTimeout.makeRef(),
                                Arrays.asList(sourceLocation, monitorObject, timeout)));

                units.swapWith(statement, newCall);
            } else if (signature.equals("<java.lang.Object: void wait(long,int)>")) {
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value monitorObject = iiexpr.getBase();
                Value timeout = iexpr.getArg(0);
                Value nanos = iexpr.getArg(1);
                Unit newCall = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(doWaitTimeoutNanos.makeRef(),
                                Arrays.asList(sourceLocation, monitorObject, timeout, nanos)));

                units.swapWith(statement, newCall);
            } else if (signature.equals("<java.lang.Object: void notify()>")) {
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value monitorObject = iiexpr.getBase();
                Unit newCall = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(doNotify.makeRef(),
                                Arrays.asList(sourceLocation, monitorObject)));

                units.swapWith(statement, newCall);
            } else if (signature.equals("<java.lang.Object: void notifyAll()>")) {
                StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
                Value monitorObject = iiexpr.getBase();
                Unit newCall = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(doNotifyAll.makeRef(),
                                Arrays.asList(sourceLocation, monitorObject)));

                units.swapWith(statement, newCall);
            } else if (signature.equals("<java.lang.Thread: void start()>")) {
                Value thread = iiexpr.getBase();
                Unit informStart = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(informThreadStart.makeRef(), Arrays.asList(thread)));

                insertSchedulingStatements(statement, statement, units.getSuccOf(statement), null, informStart);
            } else if (
                    signature.equals("<java.lang.Thread: void join()>") ||
                    signature.equals("<java.lang.Thread: void join(long)>") ||
                    signature.equals("<java.lang.Thread: void join(long,int)>") ) {
                Unit startWait = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(informStartWait.makeRef()));
                Unit endWait1 = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(informEndWait.makeRef()));
                Unit endWait2 = Jimple.v().newInvokeStmt(
                        Jimple.v().newStaticInvokeExpr(informEndWait.makeRef()));

                units.insertBefore(startWait, statement);

                insertFinally(startWait, statement, units.getSuccOf(statement), endWait1, endWait2);
            }
        }

        if (signature.equals("<java.util.concurrent.locks.LockSupport: void park()>")) {
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            Value blocker = NullConstant.v();
            Unit doParkStmt = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(doPark.makeRef(), Arrays.asList(sourceLocation, blocker)));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void park(java.lang.Object)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doParkStmt = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(doPark.makeRef(), args));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void parkNanos(long)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            Value blocker = NullConstant.v();
            args.addFirst(blocker);
            args.addFirst(sourceLocation);
            Unit doParkStmt = Jimple.v().newInvokeStmt(Jimple.v().newStaticInvokeExpr(doParkNanos.makeRef(), args));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void parkUntil(long)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            Value blocker = NullConstant.v();
            args.addFirst(blocker);
            args.addFirst(sourceLocation);
            Unit doParkStmt = Jimple.v().newInvokeStmt(Jimple.v().newStaticInvokeExpr(doParkUntil.makeRef(), args));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void parkNanos(java.lang.Object,long)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doParkStmt = Jimple.v().newInvokeStmt(Jimple.v().newStaticInvokeExpr(doParkNanos.makeRef(), args));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void parkUntil(java.lang.Object,long)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doParkStmt = Jimple.v().newInvokeStmt(Jimple.v().newStaticInvokeExpr(doParkUntil.makeRef(), args));

            units.swapWith(statement, doParkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: void unpark(java.lang.Thread)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doUnparkStmt = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(doUnpark.makeRef(), args));

            units.swapWith(statement, doUnparkStmt);
        } else if (signature.equals("<java.util.concurrent.locks.LockSupport: java.lang.Object getBlocker(java.lang.Thread)>")) {
            LinkedList args = new LinkedList(iexpr.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doGetBlockerStmt = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(doGetBlocker.makeRef(), args));

            units.swapWith(statement, doGetBlockerStmt);
        }
    }

    @Override
    protected void instrumentIdentityStatement (Stmt statement)
    {
        IdentityStmt identity = (IdentityStmt)statement;
        Value v1              = identity.getLeftOp();
        Value v2              = identity.getRightOp();

        if (v1 instanceof Local && canBeSymbolic(v1) && v2 instanceof ParameterRef) {
            Local s                  = getSymbolicLocal((Local)v1);

            Iterator<Unit> it = units.iterator();

            Stmt st = null;
            while (it.hasNext()) {
                st = (Stmt)it.next();

                if (!(st instanceof IdentityStmt))
                    break;
            }

            if (!(st instanceof IdentityStmt)) {
                InvokeExpr newExpression = concreteToString(v1);
                Stmt newStatement        = Jimple.v().newAssignStmt(s, newExpression);
                units.insertBefore(newStatement, st);

                newExpression            = Jimple.v().newStaticInvokeExpr(get.makeRef(), StringConstant.v(method.getName()), s);
                Stmt newStatement2       = Jimple.v().newAssignStmt(s, newExpression);
                units.insertAfter(newStatement2, newStatement);
            }
        }
    }



    @Override
    protected void instrumentReturnStatement (Stmt statement)
    {
        if (!isMainMethod) {
            ReturnStmt r = (ReturnStmt)statement;
            Value v      = r.getOp();

            if (v instanceof Local && canBeSymbolic(v)) {
                Local s                  = getSymbolicLocal((Local)v);
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(put.makeRef(), StringConstant.v(method.getName()), s);
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
        }
    }



    @Override
    protected void instrumentReturnVoidStatement (Stmt statement)
    {
    }

    @Override
    protected void instrumentMonitorStatement(Stmt statement)
    {
        if (statement instanceof EnterMonitorStmt) {
            EnterMonitorStmt enterMonitor = (EnterMonitorStmt) statement;

            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            InvokeStmt pre = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(preEnterMonitor.makeRef(),
                            Arrays.asList(sourceLocation, enterMonitor.getOp())));

            insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, null);
        } else if (statement instanceof ExitMonitorStmt) {
            ExitMonitorStmt exitMonitor = (ExitMonitorStmt) statement;

            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            InvokeStmt pre = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(preExitMonitor.makeRef(),
                            Arrays.asList(sourceLocation, exitMonitor.getOp())));

            InvokeStmt post = Jimple.v().newInvokeStmt(
                    Jimple.v().newStaticInvokeExpr(postExitMonitor.makeRef(), Arrays.asList(exitMonitor.getOp())));

            insertSchedulingStatements(statement, statement, units.getSuccOf(statement), pre, post);
        }
    }

    @Override
    protected void instrumentMethod(Body body)
    {

            	
        if (method.isSynchronized()) {

        	
        	Stmt firstRealStmt = null;
            Iterator<Unit> statementIterator = units.snapshotIterator();
            while (statementIterator.hasNext()) {
                Stmt statement = (Stmt)statementIterator.next();
                if (!(statement instanceof IdentityStmt)) {
                    firstRealStmt = statement;
                    break;
                }
            }
        	
            assert (firstRealStmt != null); // All method bodies must have at least one return.            
            
            Stmt lastStmt = (Stmt)units.getLast();

            Value monitorObject = null;
            if (method.isStatic()) {
                monitorObject = ClassConstant.v(method.getDeclaringClass().getJavaStyleName());
            } else {
                monitorObject = body.getThisLocal();
            }

            /*
             * Add the enter monitor.
             */
            EnterMonitorStmt enterMonitor = Jimple.v().newEnterMonitorStmt(monitorObject);
            Tag tag = firstRealStmt.getTag("LineNumberTag");
            if (tag != null) {
                enterMonitor.addTag(tag);
            }
            units.insertBeforeNoRedirect(enterMonitor, firstRealStmt);

            /*
             * To add the exit monitor we have to basically implement a "finally" block in the jimple.
             * To this end exit monitor statements are added before each return statement found in the code.
             * Also we have add a trap to exit the monitor in case of exceptions.
             */

            // Add the exception handling exit monitor
            Local throwableLocal = localGenerator.generateLocal(throwable.getType());
            IdentityStmt assignThrowable = Jimple.v().newIdentityStmt(throwableLocal, Jimple.v().newCaughtExceptionRef());
            ExitMonitorStmt exitMonitor = getExitMonitor(monitorObject, lastStmt);
            ThrowStmt throwStmt = Jimple.v().newThrowStmt(throwableLocal);
            units.insertAfter(Arrays.asList((Unit) assignThrowable, exitMonitor, throwStmt), lastStmt);

            // Add the trap
            Trap trap = Jimple.v().newTrap(throwable, firstRealStmt, units.getSuccOf(lastStmt), assignThrowable);
            traps.add(trap);

            // Add exit monitors to return statements
            statementIterator = units.snapshotIterator();
            while (statementIterator.hasNext()) {
                Stmt statement = (Stmt)statementIterator.next();

                if (statement instanceof ReturnStmt || statement instanceof ReturnVoidStmt) {
                    exitMonitor = getExitMonitor(monitorObject, statement);
                    units.insertBefore(exitMonitor, statement);
                }
            }

            // Now that the synchronization has been moved inside the method body we remove the synchronized modifier
            method.setModifiers(method.getModifiers() ^ Modifier.SYNCHRONIZED);
        }
    }

    @Override
    public void instrumentMethodCall(Stmt statement, String signature) {
    	 InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(methodInvoke.makeRef(),StringConstant.v(signature));
         Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);
         
         units.insertBefore(newStatement, statement);
    }
    
    
    /*
     * Constructs a new exit monitor statement for the supplied monitor object.
     * The statement inherits a possible LineNumberTag from the supplied statement.
     * This method is used in the instrumentMethod method above.
     */
    private ExitMonitorStmt getExitMonitor(Value monitorObject, Stmt stmt) {
        ExitMonitorStmt exitMonitor = Jimple.v().newExitMonitorStmt(monitorObject);
        Tag tag = stmt.getTag("LineNumberTag");
        if (tag != null) {
            exitMonitor.addTag(tag);
        }
        return exitMonitor;
    }

    protected void handleFunctionCallAssignments (Stmt statement)
    {
        AssignStmt a = (AssignStmt)statement;
        Value v1     = a.getLeftOp();
        Value v2     = a.getRightOp();

        // Assumed here that v2 is always the invoke expression. This should not cause any problems.
        InvokeExpr invoke = (InvokeExpr)v2;

        for (int i = 0; i < invoke.getArgCount(); i++) {
            Value v = invoke.getArg(i);

            if (v instanceof Local && canBeSymbolic(v)) {
                Local s                  = getSymbolicLocal((Local)v);
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(put.makeRef(),
                                                                          StringConstant.v(invoke.getMethod().getName()),
                                                                          s);
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore(newStatement, statement);
            }
            else if (v instanceof Constant && canBeSymbolic(v)) {
                InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(put.makeRef(),
                                                                          StringConstant.v(invoke.getMethod().getName()),
                                                                          StringConstant.v(v.toString()));
                Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

                units.insertBefore (newStatement, statement);
            }
        }

        if (v1 instanceof Local && canBeSymbolic(v1)) {
            Local s                  = getSymbolicLocal((Local)v1);
            InvokeExpr newExpression = concreteToString(v1);
            Stmt newStatement        = Jimple.v().newAssignStmt(s, newExpression);

            units.insertAfter(newStatement, statement);

            newExpression      = Jimple.v().newStaticInvokeExpr (get.makeRef(), StringConstant.v(invoke.getMethod().getName()), s);
            Stmt newStatement2 = Jimple.v().newAssignStmt(s,newExpression);

            units.insertAfter (newStatement2, newStatement);
        }

        SootMethod target = invoke.getMethod();
        String signature = target.getSignature();
        if (signature.equals("<java.util.concurrent.locks.LockSupport: java.lang.Object getBlocker(java.lang.Thread)>")) {
            LinkedList args = new LinkedList(invoke.getArgs());
            StringConstant sourceLocation = StringConstant.v(getSourceLocationString(statement));
            args.addFirst(sourceLocation);
            Unit doGetBlockerStmt = Jimple.v().newAssignStmt(v1,
                    Jimple.v().newStaticInvokeExpr(doGetBlocker.makeRef(), args));

            units.swapWith(statement, doGetBlockerStmt);
        }
    }
}
