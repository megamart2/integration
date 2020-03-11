/**
 * Represents a single host language source file; a Java source
 * file when ISL is used together with Java, a C source file when the
 * host language is C.
 * 
 * The interface is implemented in the language-specific packages.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.common.sourcecode;

import java.util.Set;

public interface Source {

	/**
	 * @return the simple (unqualified) name of this Source (whatever
	 * that means)
	 */
	public abstract String getSimpleName();

	/**
	 * @return the fully qualified name of this Source (whatever that means)
	 */
	public abstract String getQualifiedName();
	
	/**
	 * @return all the accessible methods for this source (the recursion stops 
	 * when the super-type is not in the model).
	 */
	public abstract Set<Method> getAllMethods();

	/**
	 * Adds the method toAdd to the list of Methods associated with this Source.
	 * 
	 * @param toAdd the Method to add
	 */
	public abstract void addMethod(Method toAdd);

	/**
	 * @return all the top-level (non-automatic, i.e. not within a method)
	 * Variables contained in this Source 
	 */
	public abstract Set<Variable> getAllVariables();
	
	/**
	 * Adds the variable toAdd to the list of Variables associated with this
	 * Source.
	 * 
	 * @param toAdd the Variable to add
	 */
	public abstract void addVariable(Variable toAdd);
	
}
