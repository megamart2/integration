/**
 * Represents a single method (Java) or function (C) parameter.
 * The interface is implemented in the language-specific packages.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.common.sourcecode;

public interface Parameter {

	/**
	 * @return the simple (unqualified) name of this Parameter (whatever
	 * that means)
	 */
	public abstract String getSimpleName();
	
	/**
	 * @return true if this parameter is an array, false otherwise
	 */
	public abstract boolean isArray();

	/** @return the type of this parameter (String, boolean..) as a String */
	public String getTypeAsString();
	
}
