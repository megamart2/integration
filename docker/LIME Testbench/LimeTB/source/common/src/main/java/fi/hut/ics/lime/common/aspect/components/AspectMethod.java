package fi.hut.ics.lime.common.aspect.components;

import java.util.LinkedList;
import java.util.List;

import fi.hut.ics.lime.common.aspect.components.CodeFragment;
import fi.hut.ics.lime.common.sourcecode.Visibility;

/**
 * Simple class for representing methods in aspects.
 * @author jalampin
 *
 */
public class AspectMethod {
	protected final String name;
	protected Visibility visibility;
	protected String returnType;
	protected List<String> argList;
	protected CodeFragment body;
	
	/**
	 * Creates a new method of the given name. The method
	 * is of void type by default.
	 * @param name name of the method.
	 * @param visibility the visibility of the method, e. g. PUBLIC,
	 * 		  PROTECTED, DEFAULT or PRIVATE in Java, STATIC or NONSTATIC in C
	 */
	public AspectMethod(String name, Visibility visibility) {
		this.name = name;
		this.visibility = visibility;
		this.returnType = "void";
		this.argList = new LinkedList<String>();
		this.body = new CodeFragment();
	}
	
	/**
	 * Getter for the method body.
	 * @return body of the method
	 */
	public CodeFragment getBody() {
		return this.body;
	}

	/**
	 * Getter for the method name.
	 * @return name of the method.
	 */
	public String getName() {
		return this.name;
	}


	/**
	 * Getter for the return type of the method
	 * @return return type of the method as a String.
	 */
	public String getReturnType() {
		return this.returnType;
	}


	/**
	 * Getter for the visibility of the method.
	 * @return visibility of the method.
	 */
	public Visibility getVisibility() {
		return this.visibility;
	}

	/**
	 * Adds a new parameter to the method, e.g.,
	 * m.addArgument("int i");
	 * @param arg argument type and name to be added.
	 * @return true;
	 */
	public boolean addArgument(String arg) {
		return this.argList.add(arg);
	}
	
	/**
	 * @return the arguments associated with this method as a
	 * List of Strings 
	 */
	public List<String> getArguments() {
		return this.argList;
	}
	
	/**
	 * Setter for the return type of the method.
	 * @param returnType return type of the method as a String.
	 */
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	/**
	 * Setter for the visibility of the method.
	 * @param visibility new visibility for the method.
	 */
	public void setVisibility(Visibility visibility) {
		this.visibility = visibility;
	}
	
	/**
	 * Adds code to the beginning of the method.
	 * @param code the code to be added.
	 */
	public void addBegin(String code) {
		this.body.addBegin(code);
	}

	/**
	 * Adds code to the end of the method.
	 * @param code the code to be added.
	 */
	public void addEnd(String code) {
		this.body.addEnd(code);
	}

}
