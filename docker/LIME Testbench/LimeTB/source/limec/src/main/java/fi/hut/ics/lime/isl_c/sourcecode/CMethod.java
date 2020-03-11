/**
 * Represents a C function.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.sourcecode;

import java.util.ArrayList;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Visibility;

public class CMethod extends ISLContainer implements Method {
	
	private final String name;
	private final String returnValue;
	private final ArrayList<Parameter> parameters;
	private final CSource sourceFile;
	
	// C-specific function modifiers
	private final Visibility visibility;	// static or nonstatic
	private final boolean isInline;

	public CMethod(Source sourceFile, String name, String returnValue, 
			ArrayList<Parameter> parameters, Visibility visibility, boolean isInline) {
		
		assert (sourceFile != null && name != null && returnValue != null
				&& visibility != null) :
			"Attempted to create a new CMethod without sufficent information.";
		
		if (sourceFile instanceof CSource) {
			this.sourceFile = (CSource)sourceFile;
		} else {
			this.sourceFile = null;	// makes the compiler happy
			assert false : "Attempted to create a new CMethod with a non-C " +
						   "source file.";
		}
		this.name = name;
		this.returnValue = returnValue;
		this.parameters = parameters;
		
		this.visibility = visibility;
		this.isInline = isInline;
		
	}
	
	/**	
	 * @return the name of this function 
	 */
	public String getSimpleName() {
		return this.name;
	}
	
	/** 
	 * @return a list of the parameters associated with this function. 
	 */
	public ArrayList<Parameter> getParameters() {
		return this.parameters;
	}
	
	/**
	 * @return the declaring type of this function, i.e. the C source file 
	 * this function has been declared in
	 */
	public Source getDeclaringType() {
		return this.sourceFile;
	}
	
	/** 
	 * @return the return type of this function. For functions with void
	 * as return type, returns "void", not null or "". 
	 */
	public String getReturnType() {
		return this.returnValue;
	}
	
	/**
	 * @return the Visibility enum indicating the visibility of this
	 * function (static or nonstatic in C)
	 */
	public Visibility getVisibility() {
		return this.visibility;
	}
	
	// I guess these are useful for C too, if not, feel free to remove them from the
	// interface.
	public String getFormals() {
		throw new AssertionError("not yet implemented");
	}
	
	public String getFormalNames() {
		throw new AssertionError("not yet implemented");		
	}
	
	public boolean hasParameters() {
		return !getParameters().isEmpty();
	}
	
	// C-specific methods
	
	/** 
	 * @return a boolean indicating whether this is an inline function or
	 * not. 
	 */
	public boolean isInline() {
		return this.isInline;
	}
	
	/**
	 * Two methods are equal if they are contained in the same source 
	 * file and have the same name.
	 */
	@Override
	public boolean equals(Object o) {
		if(!(o instanceof Method)) {
			return false;
		}
		Method m = (Method) o;
		boolean sameSource = getDeclaringType().getQualifiedName().equals(m.getDeclaringType().getQualifiedName());
		boolean sameName = getSimpleName().equals(m.getSimpleName());
		return sameName && sameSource;
	}
	
	@Override
	public int hashCode() {
		return getSimpleName().hashCode();
	}
	
}

