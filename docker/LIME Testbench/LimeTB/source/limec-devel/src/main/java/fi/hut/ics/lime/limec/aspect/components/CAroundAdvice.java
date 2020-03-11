package fi.hut.ics.lime.limec.aspect.components;

import fi.hut.ics.lime.common.aspect.components.AbstractAdvice;
import fi.hut.ics.lime.common.aspect.components.AdviceTime;
import fi.hut.ics.lime.common.aspect.components.CodeFragment;
import fi.hut.ics.lime.common.aspect.components.Pointcut;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;

public class CAroundAdvice extends AbstractAdvice {

	private String returnType;
	private CodeFragment preProceedCode;
	private CodeFragment postProceedCode;
	private CProceed proceed;
	private String instance;

	public CAroundAdvice() {
		this.setAdviceTime(AdviceTime.AROUND);
		this.preProceedCode = new CodeFragment();
		this.postProceedCode = new CodeFragment();
		this.proceed = new CProceed();
		this.returnType = null;
		this.instance = null;
	}
	
	/**
	 * Get the return type of this advice.
	 * 
	 * @return the return type as a String
	 */
	public String getReturnType() {
		return this.returnType;
	}
	
	/**
	 * Set the return type of this advice.
	 * 
	 * @param returnType the new return type
	 */
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	/**
	 * Get the AspeCt-oriented C code that is run after the proceed() call.
	 * 
	 * @return the code that is run after the proceed() call
	 */
	public CodeFragment getPostProceedCode() {
		return this.postProceedCode;
	}
	
	/**
	 * Get the AspeCt-oriented C code code that is run before the proceed() call.
	 * 
	 * @return the code that is run before the proceed() call
	 */
	public CodeFragment getPreProceedCode() {
		return this.preProceedCode;
	}
	
	/**
	 * Get the proceed() statement in this advice.
	 * 
	 * @return the proceed() statement
	 */
	public CProceed getProceed() {
		return this.proceed;	
	}

	/**
	 * Set the code run after the proceed() call.
	 * 
	 * @param postProceedCode the code run after the proceed() call.
	 */
	public void setPostProceedCode(CodeFragment postProceedCode) {
		this.postProceedCode = postProceedCode;
	}

	/**
	 * Set the code run before the proceed() call.
	 * 
	 * @param preProceedCode the code run before the proceed() call.
	 */
	public void setPreProceedCode(CodeFragment preProceedCode) {
		this.preProceedCode = preProceedCode;
	}

	/**
	 * Set the statement that calls proceed().
	 * 
	 * @param proceed a Proceed object describing the proceed() call statement.
	 */
	public void setProceed(CProceed proceed) {
		// WHAT THE HECK NOW?!
	}
	
	/**
	 * Set instance string for this around advice.
	 */
	public void setInstance(String instance) {
		this.instance = instance;
	}
	
	/**
	 * Return instance string for this around advice.
	 */
	public String getInstance() {
		return this.instance;
	}
	
	/**
	 * Return the code for this advice as AspeCt-oriented C code.
	 */
	@Override
	public String toString() {
	
		// Pretty close to what we do in the JavaAroundAdvice class on the
		// Java side, with a few differences:
		// - In AspeCt-oriented C, proceeds never contain arguments - they
		//   are just proceed() instead of proceed(something)
		// - No "target" in AspeCt-oriented C
		
		Pointcut pointcut = getPointcut();
		Pointcut pointcut2;
		String string;
		
		// Construct the aroundadvice ACC statement
		if(pointcut == null)
			throw new AssertionError("Tried to generate code for an advice without a pointcut.");
		string = returnType +" around(";
		
		Method method = getMethod();
		for(int i = 0; i < method.getParameters().size(); i++) {
			
			Parameter parameter = method.getParameters().get(i);
			string += parameter.getTypeAsString() +" "+ parameter.getSimpleName();
			
			if (parameter.isArray()) {
				// This parameter is an array, so we need to add the brackets
				string += "[]";
			}
		
			if (i < (method.getParameters().size() - 1)) {
				// Not the last parameter, add a comma
				string += ", ";
			}
			
		}

		pointcut2 = new Pointcut();
		
		// Construct the args(nameOfParam1, nameOfParam2) string into the advice
		String pointCutString = "args(";
		for (int i = 0; i < method.getParameters().size(); i++) {
			Parameter parameter = method.getParameters().get(i);
			pointCutString += parameter.getSimpleName();
			
			if (i < (method.getParameters().size() - 1)) {
				// Not the last parameter, add a comma
				pointCutString += ", ";
			}
		}
		pointCutString += ")";
		pointcut2.setPointcutString(pointCutString);
		
		pointcut = pointcut.and(pointcut2);
		
		string += ") : "+pointcut.getPointcutString() +" {\n";
		string += preProceedCode.toString();
		string += proceed.toString();
		string += postProceedCode.toString();
		string += "}\n";
		return string;
	}
	
}
