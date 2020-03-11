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

import java.util.Map;
import java.util.Iterator;

public class CoverageInformer extends BodyTransformer {
    static SootClass  LCTmethods;
    static SootMethod branchReporter;

    static {
        LCTmethods     = Scene.v().loadClassAndSupport("fi.hut.ics.lime.tester.symbolicexecution.LCTStatement");
        branchReporter = LCTmethods.getMethod("void maxBranchInformer(int)");
    }

    private PatchingChain<Unit>   units;
    private SootMethod            method;
    private boolean               isMainMethod;

    @SuppressWarnings("unchecked")
    @Override
    protected void internalTransform(Body body, String phaseName, Map options)
    {
        method       = body.getMethod();
        units        = body.getUnits();
        isMainMethod = method.getSubSignature().equals("void main(java.lang.String[])");

        boolean isCoverageAdded  = false;

        Iterator<Unit> iStatement  = units.snapshotIterator();

        while (iStatement.hasNext() && !isCoverageAdded) {
            Stmt statement = (Stmt)iStatement.next();

            if (!isCoverageAdded && isMainMethod && !(statement instanceof IdentityStmt)) {
                addCoverageInformation(statement);
                isCoverageAdded = true;
            }
        }
    }


    private void addCoverageInformation (Stmt statement)
    {
        int numberOfBranches = Instrumentation.getNumberOfBranches();

        InvokeExpr newExpression = Jimple.v().newStaticInvokeExpr(branchReporter.makeRef(), IntConstant.v(numberOfBranches));
        Stmt newStatement        = Jimple.v().newInvokeStmt(newExpression);

        units.insertAfter(newStatement, statement);
    }

}
