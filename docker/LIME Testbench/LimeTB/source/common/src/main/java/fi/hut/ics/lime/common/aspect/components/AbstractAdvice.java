package fi.hut.ics.lime.common.aspect.components;

import fi.hut.ics.lime.common.sourcecode.Method;

/**
 * Contains the aspect code for a single advice. 
 * @author jalampin
 */
public abstract class AbstractAdvice implements Advice {
	private Method method;
	private AdviceTime adviceTime;
	private Pointcut pointcut;
	
	/**
	 * Get the time this advice is executed.
	 * It can be either before, after or around the join point.
	 * @author jalampin
	 */
	public AdviceTime getAdviceTime() {
		return this.adviceTime;
	}

	/**
	 * Get the pointcut of this advice.
	 * @author jalampin
	 */
	public Pointcut getPointcut() {
		return this.pointcut;
	}

	/**
	 * Set the time this advice is executed.
	 * It can be either before, after or around the join point.
	 * @author jalampin
	 */
	public void setAdviceTime(AdviceTime adviceTime) {
		this.adviceTime = adviceTime;
	}

	/**
	 * Set the pointcut of this advice.
	 * @author jalampin
	 */
	public void setPointcut(Pointcut pointcut) {
		this.pointcut = pointcut;
	}

	/**
	 * Get the Method this advice is associated with.
	 * @return the method this advice is associated with
	 * @author jalampin
	 */
	public Method getMethod() {
		return this.method;
	}

	/**
	 * Set the method this advice is associated with.
	 * @param method the method this advice is associated with
	 * @author jalampin
	 */
	public void setMethod(Method method) {
		this.method = method;
	}
}
