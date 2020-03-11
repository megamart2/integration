/*
Copyright (c) 2010 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester.server.strategies.scheduling;

/**
 * The head of a node in an execution tree that handles schedules and inputs. Children and node type specific
 * information are in the tail of this node.
 * 
 * @author osaariki
 */
public class ExecutionNodeHead
{
    private ExecutionNodeHead parent;
    private ExecutionNodeTail tail;

    private String            branchString;
    private String            primitiveInputs;
    private String            referenceInputs;

    private String            arithmeticConstraint;
    private String            referenceConstraint;

    private boolean           isExtraBranch;
    private boolean           finished;
    private String			  finish_reason;
    
    private boolean           isLazyInitializationNode;

    private String			  method_signature;
    
    /**
     * Creates a new instance of {@link ExecutionNodeHead} with no parent.
     */
    public ExecutionNodeHead()
    {
        this.parent = null;
        isExtraBranch = false;
        finished = false;
        finish_reason = "";
        branchString = "";
        primitiveInputs = "";
        referenceInputs = "";
        arithmeticConstraint = "";
        referenceConstraint = "";
        isLazyInitializationNode = false;
        this.method_signature = "";
    }

    /**
     * Creates a new instance of {@link ExecutionNodeHead} with the specified parent.
     * 
     * @param parent
     *            the parent.
     */
    public ExecutionNodeHead(ExecutionNodeHead parent)
    {
        this.parent = parent;
        isExtraBranch = false;
        finished = false;
        finish_reason = "";
        branchString = parent.getBranchString();
        primitiveInputs = parent.getPrimitiveInputs();
        referenceInputs = parent.getReferenceInputs();
        arithmeticConstraint = "";
        referenceConstraint = "";
        isLazyInitializationNode = false;
        this.method_signature = "";
    }

    /**
     * @return this node's parent.
     */
    public ExecutionNodeHead getParent()
    {
        return parent;
    }

    /**
     * @param parent
     *            the parent for this node.
     */
    public void setParent(ExecutionNodeHead parent)
    {
        this.parent = parent;
    }

    /**
     * @return this node's tail.
     */
    public ExecutionNodeTail getTail()
    {
        return tail;
    }

    /**
     * @param tail
     *            the tail for this node.
     */
    public void setTail(ExecutionNodeTail tail)
    {
        this.tail = tail;
    }

    /**
     * @param constraint
     *            the constraint to add.
     */
    public void addArithmeticConstraint(String constraint)
    {
        if (arithmeticConstraint == null || arithmeticConstraint.equals("") || arithmeticConstraint.equals("empty"))
            arithmeticConstraint = constraint;
        else
            arithmeticConstraint = arithmeticConstraint + "D" + constraint;

        if (referenceConstraint == null)
            referenceConstraint = "";
    }

    /**
     * @param constraint
     *            the constraint to ad.
     */
    public void addReferenceConstraint(String constraint)
    {
        if (referenceConstraint == null || referenceConstraint.equals("") || referenceConstraint.equals("empty"))
            referenceConstraint = constraint;
        else
            referenceConstraint = referenceConstraint + "D" + constraint;

        if (arithmeticConstraint == null)
            arithmeticConstraint = "";
    }

    /**
     * @return the branch string.
     */
    public String getBranchString()
    {
        return branchString;
    }

    /**
     * @param branchString
     *            the branch string.
     */
    public void setBranchString(String branchString)
    {
        this.branchString = branchString;
    }

    /**
     * @return the primitive inputs.
     */
    public String getPrimitiveInputs()
    {
        return primitiveInputs;
    }

    /**
     * @param primitiveInputs
     *            the primitive inputs.
     */
    public void setPrimitiveInputs(String primitiveInputs)
    {
        this.primitiveInputs = primitiveInputs;
    }

    /**
     * @return the reference inputs.
     */
    public String getReferenceInputs()
    {
        return referenceInputs;
    }

    /**
     * @param referenceInputs
     *            the reference inputs.
     */
    public void setReferenceInputs(String referenceInputs)
    {
        this.referenceInputs = referenceInputs;
    }

    /**
     * @return the arithmetic constraint string
     */
    public String getArithmeticConstraint()
    {
        return arithmeticConstraint;
    }

    /**
     * @param arithmeticConstraint
     *            the arithmetic constraint string.
     */
    public void setArithmeticConstraint(String arithmeticConstraint)
    {
        this.arithmeticConstraint = arithmeticConstraint;
    }

    /**
     * @return the reference constraint string.
     */
    public String getReferenceConstraint()
    {
        return referenceConstraint;
    }

    /**
     * @param referenceConstraint
     *            the reference constraint string.
     */
    public void setReferenceConstraint(String referenceConstraint)
    {
        this.referenceConstraint = referenceConstraint;
    }

    /**
     * @return <code>true</code> if this node is an extra branch, <code>false</code> otherwise.
     */
    public boolean isExtraBranch()
    {
        return isExtraBranch;
    }

    /**
     * @param extraBranch
     *            whether this node is an extra branch or not.
     */
    public void setExtraBranch(boolean extraBranch)
    {
        this.isExtraBranch = extraBranch;
    }

    /**
     * @return <code>true</code> if this node is marked as finished, <code>false</code> otherwise.
     */
    public boolean isFinished()
    {
        return finished;
    }

    /**
     * @param finished
     *            whether this node is finished or not.
     */
    public void setFinished(boolean finished)
    {
        this.finished = finished;
    }

    /**
     * @return <code>true</code> if this node is for handling lazy initialization, <code>false</code> otherwise.
     */
    public boolean isLazyInitializationNode()
    {
        return isLazyInitializationNode;
    }

    /**
     * @param value
     *            whether this node is to be used for lazy initialization or not.
     */
    public void setLazyInitializationNode(boolean value)
    {
        isLazyInitializationNode = value;
    }
    
    public void setMethodSignature(String signature) {
		this.method_signature = signature;
	}

	public String getMethodSignature() {
		return this.method_signature;
	}

	public void setFinishReason(String finish_reason) {
		this.finish_reason = finish_reason;
	}

	public String getFinishReason() {
		return finish_reason;
	}
}
