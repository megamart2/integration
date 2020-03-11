package fi.hut.ics.lime.common.aspect;

import java.util.HashSet;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import fi.hut.ics.lime.common.aspect.components.Advice;
import fi.hut.ics.lime.common.aspect.components.AspectMethod;

/**
 * A compound that contains aspect code for an aspect and the
 * internal representation for the aspect. 
 * @author jalampin
 */
public class Aspect {
	protected final String name;
	protected Set<Advice> advices;
	// Variables associated with this aspect represented as a map;
	// the name of the variable is contained in the key, while the type
	// of the variable is in the value
	protected Map<String, String> variables;
	protected List<AspectMethod> methods;
	protected String comment;
	protected List<String> miscSnippets;
	
	/**
	 * Construct a new aspect.
	 * @param name the name of the new aspect
	 * @author jalampin
	 */
	public Aspect(String name) {
		this.name = name;
		this.advices = new HashSet<Advice>();
		this.variables = new HashMap<String, String>();
		this.methods = new ArrayList<AspectMethod>();
		this.comment = null;
		this.miscSnippets = new ArrayList<String>();
	}

	/**
	 * Add new advice to the aspect.
	 * @param advice the advice to add
	 * @author jalampin
	 */
	public void addAdvice(Advice advice) {
		this.advices.add(advice);
	}
	
	/**
	 * @return the set of advice in this aspect
	 * @author jalampin
	 */
	public Set<Advice> getAdvices() {
		return this.advices;
	}
	
	/**
	 * @return a map containing the variables in this aspect, with
	 * 		   variable names as keys and variable types (expressed
	 * 		   as Strings) as values 
	 * @author jalampin
	 */
	public Map<String, String> getVariables() {
		return this.variables;
	}

	/**
	 * Add a new variable to this aspect.
	 * @param type the type of the new variable, expressed as a String 
	 * 		  (e.g "int", class names as qualified names: "java.util.Set")
	 * @param name the name of the new variable
	 * @author jalampin
	 */
	public void addVariable(String type, String name) {
		this.variables.put(name, type);
	}
	
	/**
	 * @return the name of this aspect
	 * @author jalampin
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * Get the comment associated with this aspect.
	 * @return a string containing the comment
	 * @author jalampin
	 */
	public String getComment() {
		return this.comment;
	}

	/**
	 * Set the comment associated with this aspect.
	 * @param comment a string containing the comment
	 * @author jalampin
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	/**
	 * Returns the miscellaneous code snippets.
	 * @return a list of the snippets.
	 */
	public List<String> getMiscSnippets() {
		return this.miscSnippets;
	}

	/**
	 * Add a miscellaneous code snippet.
	 * @param snippet the snippet to add.
	 */
	public void addMiscSnippet(String snippet) {
		miscSnippets.add(snippet);
	}

	/**
	 * Add a method to this aspect.
	 * @param method the new method
	 * @author jalampin
	 */
	public void addMethod(AspectMethod method) {
		this.methods.add(method);
	}
	
	/**
	 * Remove a method from this aspect.
	 * @param method the method to remove.
	 * @author jalampin
	 */
	public void removeMethod(AspectMethod method) {
		this.methods.remove(method);
	}

}
