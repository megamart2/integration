package fi.hut.ics.lime.aspectmonitor.aspect.components;

import fi.hut.ics.lime.common.aspect.Indent;
import fi.hut.ics.lime.common.aspect.components.AdviceTime;
import fi.hut.ics.lime.common.aspect.components.CodeFragment;
import fi.hut.ics.lime.common.aspect.components.Pointcut;
import fi.hut.ics.lime.common.specification.propositions.Proposition;

/**
 * An advice that is "around" a method.
 * This means that the method call is possibly enclosed in the
 * advice body. 
 * @author jalampin
 */
public class JavaAroundAdvice extends JavaAbstractAdvice {
	private String returnType;
	private CodeFragment preProceedCode;
	private CodeFragment postProceedUnconditionalCode;
	private CodeFragment postProceedExceptionCode;
	private CodeFragment postReturnCode;
	private boolean synchronizeWithMethod;

	/**
	 * @return whether this advice should synchronize its whole body with the same synchronization the target method
	 *         uses.
	 */
	public boolean synchronizeWithMethod() {
		return synchronizeWithMethod;
	}

	/**
	 * @param synchronizeWithMethod
	 *            whether this advice should synchronize its whole body with the same synchronization the target method
	 *            uses.
	 */
	public void setSynchronizeWithMethod(boolean synchronizeWithMethod) {
		this.synchronizeWithMethod = synchronizeWithMethod;
	}

	/**
	 * Get the code fragment that is added after the return statement.
	 * This is useful for closing blocks started in the pre proceed code.
	 * This code fragment is guaranteed to be at the same block level as
	 * the fragment returned by getPreProceedCode.
	 * @return the code that will always be added to the advices end.
	 */
	public CodeFragment getPostReturnCode() {
		return postReturnCode;
	}
	
	/**
	 * Sets the code fragment that is added after the return statement.
	 * @param postReturnCode the code fragment to use.
	 */
	public void setPostReturnCode(CodeFragment postReturnCode) {
		this.postReturnCode = postReturnCode;
	}
	
	/**
	 * Get the code that is run after proceed if an exception is caught.
	 * The exception is accessible as a Throwable named `t'.
	 */
	public CodeFragment getPostProceedExceptionCode() {
		return postProceedExceptionCode;
	}

	/**
	 * Set the code that is run after proceed if an exception is caught.
	 * The exception is accessible as a Throwable named `t'.
	 */
	public void setPostProceedExceptionCode(CodeFragment postProceedExceptionCode) {
		this.postProceedExceptionCode = postProceedExceptionCode;
	}

	/**
	 * @return the postProceedNoExceptionCode
	 */
	public CodeFragment getPostProceedNoExceptionCode() {
		return postProceedNoExceptionCode;
	}

	/**
	 * @param postProceedNoExceptionCode the postProceedNoExceptionCode to set
	 */
	public void setPostProceedNoExceptionCode(
			CodeFragment postProceedNoExceptionCode) {
		this.postProceedNoExceptionCode = postProceedNoExceptionCode;
	}

	private CodeFragment postProceedNoExceptionCode;
	private JavaProceed proceed;
	
	public JavaAroundAdvice() {
		setAdviceTime(AdviceTime.AROUND);
		preProceedCode = new CodeFragment();
		postProceedUnconditionalCode = new CodeFragment();
		postProceedExceptionCode = new CodeFragment();
		postProceedNoExceptionCode = new CodeFragment();
		postReturnCode = new CodeFragment();
		proceed = new JavaProceed();
		returnType = null;
	}

	/**
	 * Get the return type of this advice.
	 * @return the return type, the qualified name of the class as a String object
	 */
	public String getReturnType() {
		return returnType;
	}

	/**
	 * Set the return type of this advice.
	 * @param returnType the new return type, the qualified name of the class
	 * as a String
	 */
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	/**
	 * Get the AspectJ code that is run after the proceed() call  
	 * @return the code that is run after the proceed() call
	 */
	public CodeFragment getPostProceedUnconditionalCode() {
		return postProceedUnconditionalCode;
	}

	/**
	 * Get the AspectJ code that is run before the proceed() call
	 * @return the code that is run before the proceed() call
	 */
	public CodeFragment getPreProceedCode() {
		return preProceedCode;
	}

	/**
	 * Get the proceed() statement in this advice.
	 * @return the proceed() statement
	 */
	public JavaProceed getProceed() {
		return proceed;
	}

	/**
	 * Set the code run after the proceed() call.
	 * @param postProceedCode the code run after the proceed() call.
	 */
	public void setPostProceedUnconditionalCode(CodeFragment postProceedCode) {
		this.postProceedUnconditionalCode = postProceedCode;
	}
	
	/**
	 * Set the code run before the proceed() call.
	 * @param preProceedCode the code run before the proceed() call.
	 */
	public void setPreProceedCode(CodeFragment preProceedCode) {
		this.preProceedCode = preProceedCode;
	}

	/**
	 * Set the statement that calls proceed().
	 * @param proceed a Proceed object describing the proceed() call statement.
	 */
	public void setProceed(JavaProceed proceed) {
		this.proceed = proceed;
	}

	/**
	 * @return whether the code in this advice will refer to the inner class Thrower or not.
	 */
	public boolean needsThrower() {
		return !postProceedExceptionCode.isEmpty();
	}

	/**
	 * Generate the "around(...)" part of the aspect.
	 */
	private String generateAroundClause() {
		String code = returnType +" around(";
		String params = getMethod().getFormals();
	
		if (params != null)
			code += params;
		
		// Done always for ExceptionOverride
		//if (referencesTarget) {
		if(params != null)
			code += ", ";
		if (target == null)
			throw new AssertionError("target == null");
		code += target +" "+Proposition.TARGET;
		//code += ") throws Throwable";
		code += ")";
		return code;
	}
	
	/**
	 * Generate the "..." part of args(...).
	 * This means comma separated formals of the method, without their type names.
	 */
	private String generateArgsParams() {
		String params = getMethod().getFormalNames();
		if (params == null)
			return "";
		else
			return params;
	}
	
	/**
	 * Generate the argument list of the proceed call.
	 * This means comma separated formals of the method, plus a possible callTarget variable
	 * if a proposition in this aspect references \#this.
	 */
	private String generateProceedParams() {
		String params = generateArgsParams();
		//if (referencesTarget)
		if (params.equals(""))
			return Proposition.TARGET;
		else
			return params + ", " + Proposition.TARGET;
		//else
		//    return params;
	}
	
	/**
	 * Return the code for this advice as AspectJ code.
	 */
	@Override
	public String toString() {
		Pointcut pointcut = getPointcut();
		
		if(pointcut == null)
			throw new AssertionError(
					"Tried to generate code for an advice without a pointcut.");
		
		if(getMethod().hasParameters())
			pointcut = pointcut.and(new Pointcut("args("+generateArgsParams()+")"));
		
		// done always because of ExceptionOverride
		//if(referencesTarget)
		pointcut = pointcut.and(new Pointcut("target("+Proposition.TARGET+")"));
		
		proceed.setParam(generateProceedParams());

		String code =
			(generateAroundClause() + "\n        : " + 
					new Indent(pointcut.getPointcutString()) +" {\n" +
			"    " + new Indent(preProceedCode.toString()) + "\n");
		
		String returnType = getMethod().getReturnType();
		String resultDecl = null;
		if (!returnType.equals("void"))
			resultDecl = returnType + " " + Proposition.RESULT;			

		// FIXME factor
		
		if (postProceedUnconditionalCode.isEmpty() &&
				postProceedExceptionCode.isEmpty()) {
			if (returnType.equals("void"))
				code += "    " + proceed.toString() + ";\n";
			else {
				if (resultDecl == null)
					throw new AssertionError("This should not happen");
				code += "    " + resultDecl + " = " + proceed.toString() + ";\n";
			}
		} else {
			String block = "";
			if (!returnType.equals("void")) {
				if (resultDecl == null)
					throw new AssertionError("This should not happen");
				block += resultDecl + ";\n";
			}
			block += "try {\n";
			if (returnType.equals("void"))
				block += "    "+proceed.toString() + ";\n";
			else
				block += ("    " + Proposition.RESULT + " = " +
						proceed.toString() + ";\n");
			if (!postProceedNoExceptionCode.isEmpty())
				block += "    " + new Indent(postProceedNoExceptionCode.toString()) + "\n";
			block += "}";
			if (!postProceedExceptionCode.isEmpty()) {
				block += " catch (Throwable t) {\n";
				block += "    while (t instanceof org.aspectj.lang.SoftException)\n";
				block += "        t = ((org.aspectj.lang.SoftException)t).getWrappedThrowable();\n";
				block += "    " + new Indent(postProceedExceptionCode.toString()) + "\n";
				block += "    Thrower.$throw(t);\n";
				// need this for Java to not compile about retval being possibly uninitialized
				block += "    throw new Error(\"Thrower did not throw?!\");";
				block += "\n}";
			}
			if (!postProceedUnconditionalCode.isEmpty()) {
				block += " finally {\n";
				block += "    " + new Indent(postProceedUnconditionalCode.toString());
				block += "\n}";
			}
			code += "    "+new Indent(block) + "\n";
		}
		
		if (!returnType.equals("void"))
			code += "    return " + Proposition.RESULT + ";\n"; 
		else
			code += "    return;\n";

		if (!postReturnCode.isEmpty())
			code += "    " + new Indent(postReturnCode.toString()) + "\n";
		
		code += "}\n";
		return code;
	}
}
