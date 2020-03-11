/**
 * This class represents a single Java language source file.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.aspectmonitor.sourcecode;

import java.util.HashSet;
import java.util.Set;

import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.CtPackage;
import spoon.reflect.declaration.CtType;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Variable;

public class JavaSource implements Source {
	
	private CtType<?> ctType;
	
	public JavaSource(CtType<?> ctType) {
		this.ctType = ctType;
	}
	
	/**
	 * @return the simple (unqualified) name of this JavaSource (whatever
	 * that means)
	 */
	public String getSimpleName() {
		return ctType.getSimpleName();
	}
	
	/**
	 * @return the fully qualified name of this JavaSource (whatever that means)
	 */
	public String getQualifiedName() {
		return ctType.getQualifiedName();
	}
	
	/**
	 * @return all the accessible methods for this JavaSource (the recursion 
	 * stops when the super-type is not in the model).
	 */
	public Set<Method> getAllMethods() {
		
		Set<CtMethod<?>> ctMethods = ctType.getAllMethods();
		HashSet<Method> methods = new HashSet<Method>();
		
		for(CtMethod<?> ctMethod : ctMethods) {
			methods.add(new JavaMethod(ctMethod));
		}
		
		return methods;
	}

	/**
	 * @return the CtPackage associated with the CtType that is represented
	 * by this JavaSource
	 */
	public CtPackage getPackage() {
		return this.ctType.getPackage(); 
	}
	
	/**
	 * @return the CtType that is represented by this JavaSource
	 */
	public CtType<?> getCtType() {
		return this.ctType;
	}
	
	/**
	 * Adds the method toAdd to the list of Methods associated with this Source.
	 * 
	 * @param toAdd the Method to add
	 */
	public void addMethod(Method toAdd) {
		// TODO
		assert false : "No implementation defined.";
	}
	
	/**
	 * @return all the top-level (non-automatic, i.e. not within a method)
	 * Variables contained in this Source 
	 */
	public Set<Variable> getAllVariables() {
		// TODO
		assert false : "No implementation defined.";
		return new java.util.HashSet<Variable>();
	}
	
	/**
	 * Adds the variable toAdd to the list of Variables associated with this
	 * Source.
	 * 
	 * @param toAdd the Variable to add
	 */
	public void addVariable(Variable toAdd) {
		// TODO
		assert false : "No implementation defined.";
	}
	
}
