package fi.hut.ics.lime.aspectmonitor.aspect.components;

import fi.hut.ics.lime.common.aspect.Indent;

/**
 * Contains the generated AspectJ code for an aspect constructor. 
 * @author jalampin
 */
public class JavaConstructor {
	private String name, code;
	public JavaConstructor() {
		code = "";
		name = "";
	}
	
	/**
	 * Get the body of the aspect constructor.
	 * @return the body of the aspect constructor as a string
	 */ 
	public String getCode() {
		return code;
	}

	/**
	 * Get the name of the aspect (and hence the constructor). 
	 * @return the name of the aspect
	 */
	public String getName() {
		return name;
	}

	/**
	 * Set the body of the aspect constructor.
	 * @param code the body of the aspect constructor as a string of AspectJ code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * Set the name of the aspect (and hence the constructor).
	 * @param name the new name of the aspect
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Append code to the constructor body. 
	 * @param code Java code to execute
	 */
	public void addCode(String code) {
		this.code += code;
	}
	
	/**
	 * Get a AspectJ code block for the constructor definition.
	 */
	@Override
	public String toString() {
		return "public "+name+"() {\n    "+new Indent(code)+"\n}\n";
	}
}
