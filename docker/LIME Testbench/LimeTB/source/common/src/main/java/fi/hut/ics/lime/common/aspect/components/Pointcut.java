	package fi.hut.ics.lime.common.aspect.components;

import fi.hut.ics.lime.common.aspect.Indent;

/**
 * Pointcut designator for aspects.
 * @author jalampin
 *
 */
public class Pointcut {
	private String pointcutString;
	
	/**
	 * Creates an empty pointcut designator.
	 *
	 */
	public Pointcut() {
		this.pointcutString = "";
	}
	
	/**
	 * Creates a pointcut designator with the specified value.
	 * @param pointcutString the pointcut designator as a string
	 */
	public Pointcut(String pointcutString) {
		this.pointcutString = pointcutString;
	}
	
	/**
	 * Boolean combination or between two pointcut designators
	 * @param pointcut pointcut designator to for boolean or with.
	 * @return new pointcut designator which is a disjunction of
	 * the target pointcut and parameter pointcut.
	 */
	public Pointcut or(Pointcut pointcut) {
		Pointcut p = new Pointcut();
		p.setPointcutString("("+this.pointcutString+" ||\n    "+
				new Indent(pointcut.getPointcutString())+")");
		return p;
	}
	
	/**
	 * Creates a boolean and between the target pointcut and the
	 * parameter.
	 * @param pointcut Pointcut to be and'ed with.
	 * @return new pointcut that corresponds to a boolean and 
	 * between target pointcut and the parameter pointcut.
	 */
	public Pointcut and(Pointcut pointcut) {
		Pointcut p = new Pointcut();
		p.setPointcutString("("+this.pointcutString+" &&\n    "+
				new Indent(pointcut.getPointcutString())+")");
		return p;
	}
	
	/**
	 * Complementation operation for the pointcut.
	 * @return new complemented pointcut
	 */
	public Pointcut complement() {
		Pointcut p = new Pointcut();
		p.setPointcutString("!("+new Indent(pointcutString)+")");
		return p;
	}
	
	/**
	 * Get the pointcut as an AspectJ code string.
	 * @return the pointcut as an AspectJ code string. 
	 */
	public String getPointcutString() {
		return this.pointcutString;
	}
	
	/**
	 * Set the pointcut as an AspectJ code string.
	 * @param pointcut the pointcut as an aspectJ code string.
	 */
	public void setPointcutString(String pointcut) {
		this.pointcutString = pointcut;
	}
	
	/**
	 * Get the pointcut as an AspectJ code string.
	 * @return the pointcut as an AspectJ code string. 
	 */
	@Override
	public String toString() {
		return this.pointcutString;
	}
	
}
