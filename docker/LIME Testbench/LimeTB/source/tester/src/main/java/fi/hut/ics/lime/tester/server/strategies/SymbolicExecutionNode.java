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

package fi.hut.ics.lime.tester.server.strategies;


public class SymbolicExecutionNode {
    private SymbolicExecutionNode left;
    private SymbolicExecutionNode right;
    private SymbolicExecutionNode parent;

    private String branchString;
    private String primitiveInputs;
    private String referenceInputs;

    private String arithmeticConstraint;
    private String referenceConstraint;

    private boolean finished;
    private boolean isExtraBranch;
    private boolean isLazyInitializationNode;

    
    public SymbolicExecutionNode()
    {
        finished          = false;
        branchString      = "";
        primitiveInputs   = "";
        referenceInputs   = "";
        isExtraBranch       = false;
        isLazyInitializationNode = false;
        arithmeticConstraint = "";
        referenceConstraint = "";
    }



    public SymbolicExecutionNode (SymbolicExecutionNode parent)
    {
        finished            = false;
        this.parent         = parent;
        branchString        = "";
        primitiveInputs     = parent.primitiveInputs;
        referenceInputs     = parent.referenceInputs;
        isExtraBranch       = false;
        isLazyInitializationNode = false;
        arithmeticConstraint = "";
        referenceConstraint = "";
    }


    public void addArithmeticConstraint (String constraint)
    {
        if (arithmeticConstraint == null || arithmeticConstraint.equals("") || arithmeticConstraint.equals("empty"))
            arithmeticConstraint = constraint;
        else
            arithmeticConstraint = arithmeticConstraint + "D" + constraint;

        if (referenceConstraint == null)
            referenceConstraint = "";
    }



    public void addReferenceConstraint (String constraint)
    {
        if (referenceConstraint == null || referenceConstraint.equals("") || referenceConstraint.equals("empty"))
            referenceConstraint = constraint;
        else
            referenceConstraint = referenceConstraint + "D" + constraint;

        if (arithmeticConstraint == null)
            arithmeticConstraint = "";
    }

    
    
    public SymbolicExecutionNode getLeft() {
        return left;
    }

    public void setLeft(SymbolicExecutionNode left) {
        this.left = left;
    }

    public SymbolicExecutionNode getRight() {
        return right;
    }

    public void setRight(SymbolicExecutionNode right) {
        this.right = right;
    }

    public SymbolicExecutionNode getParent() {
        return parent;
    }

    public void setParent(SymbolicExecutionNode parent) {
        this.parent = parent;
    }

    public String getBranchString() {
        return branchString;
    }

    public void setBranchString(String branchString) {
        this.branchString = branchString;
    }

    public String getPrimitiveInputs() {
        return primitiveInputs;
    }

    public void setPrimitiveInputs(String primitiveInputs) {
        this.primitiveInputs = primitiveInputs;
    }

    public String getReferenceInputs() {
        return referenceInputs;
    }

    public void setReferenceInputs(String referenceInputs) {
        this.referenceInputs = referenceInputs;
    }

    public String getArithmeticConstraint() {
        return arithmeticConstraint;
    }

    public void setArithmeticConstraint(String arithmeticConstraint) {
        this.arithmeticConstraint = arithmeticConstraint;
    }

    public String getReferenceConstraint() {
        return referenceConstraint;
    }

    public void setReferenceConstraint(String referenceConstraint) {
        this.referenceConstraint = referenceConstraint;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }


    public boolean isExtraBranch()
    {
        return isExtraBranch;
    }

    public void setExtraBranch (boolean extraBranch)
    {
        this.isExtraBranch = extraBranch;
    }


    public boolean isLazyInitializationNode()
    {
        return isLazyInitializationNode;
    }


    public void setLazyInitializationNode (boolean value)
    {
        isLazyInitializationNode = value;
    }


}
