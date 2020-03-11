/**
 * This class represents a single Java language method.
 *
 * @author lharpf
 */

package fi.hut.ics.lime.aspectmonitor.sourcecode;

import java.util.ArrayList;
import java.util.List;

import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.CtParameter;
import spoon.reflect.declaration.CtType;
import spoon.reflect.declaration.ModifierKind;
import spoon.reflect.reference.CtTypeReference;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Visibility;

public class JavaMethod implements Method {

	private CtMethod<?> ctMethod;
	
	public JavaMethod(CtMethod<?> ctMethod) {
		this.ctMethod = ctMethod;
	}
	
	/**
	 * @return the simple (unqualified) name of this JavaMethod (whatever
	 * that means)
	 */
	public String getSimpleName() {
		return this.ctMethod.getSimpleName();
	}
	
	/**
	 * @return the list of parameters associated with this JavaMethod
	 * as a list of Parameter objects 
	 */
	public List<Parameter> getParameters() {
		
		ArrayList<CtParameter<?>> ctParameters = new ArrayList<CtParameter<?>>();
		ctParameters.addAll(this.ctMethod.getParameters());
		
		ArrayList<Parameter> parameters = new ArrayList<Parameter>();
		
		for (CtParameter<?> parameter : ctParameters) {
			parameters.add(new JavaParameter(parameter));
		}
		
		return parameters;
	
	}
	
	public boolean hasParameters() {
		return !getParameters().isEmpty();
	}
	
	/**
	 * @return the declaring type of this method, i.e. the JavaSource this method
	 * is contained in
	 */
	public Source getDeclaringType() {
		CtType<?> declaringCt = ctMethod.getDeclaringType();
		return new JavaSource(declaringCt);
	}
	
	/**
	 * @return the return value of this method as a String
	 */
	public String getReturnType() {
		// old implementation, doesn't work correctly for arrays
		//CtTypeReference<?> ctTypeReference = this.ctMethod.getType();
		//return ctTypeReference.getActualClass().getName();
		
		// we can just return the name of the type directly, with the added
		// benefit of working for arrays as well as being cleaner (like with
		// parameters where a similar fix was made, might lead to problems
		// with certain values so needs testing)
		return this.ctMethod.getType().toString();
	}

	/**
	 * @return a Visibility enum representing the visibility of this method
	 */
	public Visibility getVisibility() {
		
		ModifierKind modifier = this.ctMethod.getVisibility();
		
		if (modifier == null) {
			return Visibility.DEFAULT;
		}
		
		switch (modifier) {
		
			case PUBLIC:
				return Visibility.PUBLIC;
				
			case PROTECTED:
				return Visibility.PROTECTED;
				
			case PRIVATE:
				return Visibility.PRIVATE;
					
			default:
				assert false : "Unknown Java visibility.";
				throw new RuntimeException();
		}
		
	}
	
	private String getFormalsString(boolean withTypes) {
		String str = null;
		
		for (Parameter param : getParameters()) {
			if (str == null)
				str = "";
			else
				str += ", ";
			if (withTypes)
				str += param.getTypeAsString() + " ";
			str += param.getSimpleName();
		}
		
		return str;
		
	}
	
	public String getFormals() {
		return getFormalsString(true);
	}
	
	public String getFormalNames() {
		return getFormalsString(false);
	}
	
	/**
	 * @return the CtMethod that is represented by this JavaMethod
	 */
	public CtMethod<?> getCtMethod() {
		return this.ctMethod;
	}
	/**
	 * Two methods are equal if they have the same source and name.
	 */
	@Override
	public boolean equals(Object o) {
		if(!(o instanceof JavaMethod)) {
			return false;
		}
		JavaMethod m = (JavaMethod) o;
		boolean sameSource = getDeclaringType().getQualifiedName().equals(m.getDeclaringType().getQualifiedName());
		boolean sameName = getSimpleName().equals(m.getSimpleName());
		return sameName && sameSource;
	}
	
	@Override
	public int hashCode() {
		return getSimpleName().hashCode();
	}
}

