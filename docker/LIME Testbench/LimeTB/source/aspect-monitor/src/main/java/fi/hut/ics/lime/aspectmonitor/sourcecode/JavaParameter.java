/**
 * This class represents a single Java language method parameter.
 *
 * @author lharpf
 */
package fi.hut.ics.lime.aspectmonitor.sourcecode;

import spoon.reflect.declaration.CtParameter;
import fi.hut.ics.lime.common.sourcecode.Parameter;

public class JavaParameter implements Parameter {

	private CtParameter<?> ctParameter;
	
	public JavaParameter(CtParameter<?> ctParameter) {
		this.ctParameter = ctParameter;
	}
	
	/**
	 * @return the simple (unqualified) name of this JavaParameter (whatever
	 * that means)
	 */
	public String getSimpleName() {
		return this.ctParameter.getSimpleName();
	}
	
	/**
	 * @return true if this parameter is an array, false otherwise
	 */
	public boolean isArray() {
		// TODO
		assert false : "No implementation defined.";
		return false;
	}
	
	/** @return the type of this parameter (String, boolean..) as a String */
	public String getTypeAsString() {
		// old implementation, doesn't work with arrays (int[] for instance, just returns int)
		// why this was done this way?
		//return this.ctParameter.getReference().getType().getQualifiedName();
		
		// this version actually preserves the [] if they are there, but might cause some
		// other unforeseen problems somewhere else, hopefully not though (note that even here
		// both getSimpleName and getQualifiedName fail to preserve the [] if they are part of
		// the parameter type a possible bug in spoon perhaps?)
		return this.ctParameter.getType().toString();
	}
	
}
