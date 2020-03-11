/**
 * Represents a single Java language method or a single C function. 
 * The interface is implemented in the language-specific packages.
 *
 * @author lharpf
 */
package fi.hut.ics.lime.common.sourcecode;

import java.util.List;

public interface Method {

	/**
	 * @return the simple (unqualified) name of this Method (whatever
	 * that means)
	 */
	public abstract String getSimpleName();

	/**
	 * @return the list of parameters associated with this method (Java) or
	 * function (C) as Parameters 
	 */
	public abstract List<Parameter> getParameters();
	
	/**
	 * @return the declaring type of this method, i.e. the source this method
	 * is contained in
	 */
	public abstract Source getDeclaringType();

	/**
	 * @return the return value of this method as a String
	 */
	public abstract String getReturnType();

	/**
	 * Get the formals of the method with their types, as a string
	 * (comma separated, suitable for declaration etc.).
	 */
	public String getFormals();

	/**
	 * Get the formals of the method without their types, as a string
	 * (comma separated, suitable for e.g. calling the method).
	 */
	public String getFormalNames();
	
	public boolean hasParameters();
	
	/**
	 * @return the Visibility enum indicating the visibility of this
	 * method (e.g. public, protected, private, default in Java, static or
	 * non-static in C)
	 */
	public abstract Visibility getVisibility();
	
	
}
