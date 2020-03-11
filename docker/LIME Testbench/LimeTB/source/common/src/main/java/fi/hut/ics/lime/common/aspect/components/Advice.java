package fi.hut.ics.lime.common.aspect.components;


/**
 * A common interface for different advices.
 * @author jalampin
 */
public interface Advice {

	/**
	 * Get advice time (before, after, around).
	 * Possibly only around implemented for now.
	 */
	public abstract AdviceTime getAdviceTime();

	/**
	 * Get the pointcut (when the advice is run).
	 */
	public abstract Pointcut getPointcut();

	
	/**
	 * Set the advice time (before, after, around).
	 * Possibly only around implemented for now.
	 */
	public abstract void setAdviceTime(AdviceTime adviceTime);

	/**
	 * Set the pointcut (when the advice is run).
	 */
	public abstract void setPointcut(Pointcut pointcut);

	/**
	 * Convert the advice to aspect code.
	 */
	public abstract String toString();

}