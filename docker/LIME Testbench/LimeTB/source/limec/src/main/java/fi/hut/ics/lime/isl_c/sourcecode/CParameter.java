/**
 * This class represents a formal parameter associated with a function 
 * definition/declaration in the C language. 
 * 
 * The XMLReader class reads Doxygen-generated XML that describes C
 * source files. Zero or more instances of this class are linked to
 * an instance of CMethod, which represents a C function. 
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.sourcecode;

import fi.hut.ics.lime.common.sourcecode.Parameter;

public class CParameter implements Parameter {
	
	private final String name;
	private final String type;
	private final boolean isArray;
	
	
	public CParameter(String name, String type, boolean isArray) {
		
		assert (name != null && type != null) : "Attempted to create " +
				"a new parameter with a null name or type.";
		
		this.name = name;
		this.type = type;
		this.isArray = isArray;
		
	}
	
	/** 
	 * Gets the simple (without parameters or return value) name of this 
	 * parameter. 
	 */
	public String getSimpleName() {
		return this.name;
	}
	
	/** 
	 * @return true if this parameter is an array (e. g. char myParam[]),
	 * false otherwise. 
	 */
	public boolean isArray() {
		return this.isArray;
	}
	
	/** 
	 * @return the type of this parameter (int, char..). 
	 */
	public String getTypeAsString() {
		return this.type;
	}
	
}
