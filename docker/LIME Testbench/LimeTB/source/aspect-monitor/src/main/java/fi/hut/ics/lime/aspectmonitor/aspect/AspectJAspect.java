package fi.hut.ics.lime.aspectmonitor.aspect;

import java.util.Map.Entry;

import spoon.reflect.declaration.CtPackage;
import fi.hut.ics.lime.aspectmonitor.aspect.components.JavaConstructor;
import fi.hut.ics.lime.aspectmonitor.aspect.components.JavaPerClause;
import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.Indent;
import fi.hut.ics.lime.common.aspect.components.Advice;
import fi.hut.ics.lime.common.aspect.components.AspectMethod;

/**
 * A compound that contains AspectJ code for an aspect and the
 * internal representation for the aspect. 
 * @author jalampin
 */
public class AspectJAspect extends Aspect {
	private JavaPerClause perClause;
	private Boolean privileged;
	private CtPackage ctPackage = null;
	private JavaConstructor constructor;
	private String superType = null;
	private String precedence = null;
	
	/**
	 * Construct a new aspect.
	 * @param name the name of the new aspect
	 * @author jalampin
	 */
	AspectJAspect(String name) {
		super(name);
		privileged = false;
		perClause = new JavaPerClause();
	}
	
	/**
	 * Get the compile-time package this aspect is in.
	 * @author jalampin
	 */
	public CtPackage getCtPackage() {
		return ctPackage;
	}

	/**
	 * Set the compile-time package this aspect is in.
	 * @param ctPackage the compile-time package for this aspect
	 */
	public void setCtPackage(CtPackage ctPackage) {
		this.ctPackage = ctPackage;
	}

	/**
	 * @return the per clause that instantiates this aspect.
	 * @author jalampin
	 */
	public JavaPerClause getPerClause() {
		return perClause;
	}

	/**
	 * Get the privileged status of this aspect.
	 * A privileged aspect can access the private fields and methods of a class. 
	 * @return whether this aspect is privileged
	 * @author jalampin
	 */
	public Boolean getPrivileged() {
		return privileged;
	}

	/**
	 * Set the per clause that instantiates this aspect.
	 * @param perClause new value for the per clause
	 * @author jalampin
	 */
	public void setPerClause(JavaPerClause perClause) {
		this.perClause = perClause;
	}

	/**
	 * Set the privileged status of this aspect.
	 * A privileged aspect can access the private fields and methods of a class. 
	 * @param privileged whether this aspect is privileged
	 * @author jalampin
	 */
	public void setPrivileged(Boolean privileged) {
		this.privileged = privileged;
	}


	/**
	 * @return the constructor of this aspect
	 * @author jalampin
	 */
	public JavaConstructor getConstructor() {
		return constructor;
	}

	/**
	 * Set the constructor of this aspect.
	 * @param constructor value for the new constructor
	 * @author jalampin
	 */
	public void setConstructor(JavaConstructor constructor) {
		this.constructor = constructor;
	}
	
	/**
	 * Get the name of the supertype of this aspect.
	 * @return the name of the supertype
	 * @author jalampin
	 */
	public String getSuperType() {
		return superType;
	}

	/**
	 * Set the super class of this aspect.
	 * @param superClass the superclass
	 * @author jalampin
	 */
	public void setSuperClass(String superClass) {
		this.superType = superClass;
	}
	
	/**
	 * Get the precedence of this aspect.
	 * @return the precedence as a string
	 * @author jalampin
	 */
	public String getPrecedence() {
		return precedence;
	}

	/**
	 * Set the precedence of this aspect.
	 * @param precedence the precedence as a string
	 * @author jalampin
	 */
	public void setPrecedence(String precedence) {
		this.precedence = precedence;
	}

	/**
	 * Generate AspectJ code for this aspect.
	 * @author jalampin
	 */
	@Override
	public String toString() {
		String string = "";
		String advicesString = "";
		
		if(ctPackage != null) {
			string += "package "+ctPackage.getQualifiedName()+";\n\n";
		}
		if(comment != null) {
			string += "/**\n * "+comment.trim().replace("\n", "\n * ")+"\n */\n";
		}
		if(privileged) {
			string += "privileged ";
		}
		string += "aspect "+name+" ";
		
		if(superType != null) 
			string += "\n    extends "+superType+"\n";
		if(perClause != null)
			string += new Indent(perClause.toString(),2)+" {\n";
		
		if(precedence != null) {
			string += "    declare precedence: "+precedence+";\n";
		}
		
//		string += ("    declare soft : Throwable : " +
//				perClause.getPointcut().toString() + ";\n");
//		string += ("    declare soft : Throwable : " +
//				perClause.getPointcut().toString().replace("call(", "execution(") + ";\n");
		
		for(Entry<String, String> entry : variables.entrySet()) {
			string += "    private "+ entry.getValue() +" "+entry.getKey()+";\n";
		}
		
		if (!variables.isEmpty())
			string += "\n";

		for (String snippet : miscSnippets)
			string += snippet + "\n";

		if(constructor != null)
			string += "    "+new Indent(constructor.toString())+"\n\n";
		
		for(Advice advice : advices) {
			advicesString += (advice == null ? "" :
				"    "+new Indent(advice.toString())+"\n\n");
		}
			
		string += advicesString;
		
		for (AspectMethod method : methods) {
			string += "    "+new Indent(method.toString())+"\n";
		}
		
		string = string.trim()+"\n}\n";
		return string;
	}
}
