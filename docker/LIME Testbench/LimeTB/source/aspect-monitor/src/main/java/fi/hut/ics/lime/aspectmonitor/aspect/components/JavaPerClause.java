package fi.hut.ics.lime.aspectmonitor.aspect.components;

import fi.hut.ics.lime.common.aspect.components.Pointcut;

/**
 * A simple class for representing per clauses of the aspects.
 * Per clauses are the way aspects are instantiated.
 * @author jalampin
 *
 */
public class JavaPerClause {
	private JavaPerType perType;
	private Pointcut pointcut;
	
	/**
	 * Creates a per clause for a singleton aspect.
	 *
	 */
	public JavaPerClause() {
		perType = JavaPerType.ISSINGLETON;
		pointcut = new Pointcut();
	}
	/**
	 * Getter for the per clause type.
	 * @return the per clause type.
	 */
	public JavaPerType getPerType() {
		return perType;
	}
	
	/**
	 * Setter for the per clause type.
	 * @param perType type of the per clause.
	 */
	public void setPerType(JavaPerType perType) {
		this.perType = perType;
	}
	
	/**
	 * Getter for the pointcut of the per clause
	 * @return pointcut by which the aspect is instantiated.
	 */
	public Pointcut getPointcut() {
		return pointcut;
	}
	
	/**
	 * Setter for the pointcut of the per clause
	 * @param pointcut the pointcut by which the aspect is instantiated.
	 */
	public void setPointcut(Pointcut pointcut) {
		this.pointcut = pointcut;
	}
	
	/**
	 * String representation of the per clause.
	 */
	@Override
	public String toString() {
		return perType.toString().toLowerCase()+"(\n"+pointcut.toString()+")";
	}
}
