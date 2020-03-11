package fi.hut.ics.lime.common.specification;

import java.util.EnumSet;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;

import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomaton;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.SourceLocation;

/**
 * The abstract implementation of interface Specification. 
 * A specification type contains both the textual and the compiled form
 * of the specification.
 * @author jalampin
 */
public abstract class AbstractSpecification implements Specification {
	private String name;
	private String declared;

	/** Pretty-printed user-given specification for tooltip use in Eclipse */
	private String parsed;
	
	/** Pretty-printed parsed and simplified specification for tooltip use in Eclipse */
	private String internal;
	
	private Source sourceType;
	private Set<Method> enforcedMethods = new HashSet<Method>();
	private BooleanExpression node;
	private SpecType specType;
	
	private String defaultException = null;
	private Map<Method, String> exceptions = new Hashtable<Method, String>();
	private GuardedTransitionAutomaton automaton = null;
	private SourceLocation sourceLocation = null;
	private EnumSet<SpecModifier> modifiers = EnumSet.noneOf(SpecModifier.class);
	
	public Source getSourceType() {
		return sourceType;
	}
	public Set<Method> getEnforcedMethods() {
		return enforcedMethods;
	}
	public String getName() {
		return name;
	}
	
	/**
	 * Get the root AST node of this specification.
	 * @return the root AST node
	 */
	public BooleanExpression getNode() {
		return node;
	}
	
	public String getDeclared() {
		return declared;
	}
	public SpecType getSpecType() {
		return specType;
	}
	public void setSourceType(Source sourceType) {
		this.sourceType = sourceType;
	}
	
	/**
	 * Set the set of enforced methods.
	 * @param enforcedMethods the set of enforced compile-time methods
	 * @author jalampin
	 */
	public void setEnforcedMethods(Set<Method> enforcedMethods) {
		this.enforcedMethods = enforcedMethods;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Set the root AST node for this specification.
	 * @param node the root AST node for this specification
	 * @author jalampin
	 */
	public void setNode(BooleanExpression node) {
		this.node = node;
	}
	
	public void setDeclared(String declared) {
		this.declared = declared;
	}
	public void setSpecType(SpecType specType) {
		this.specType = specType;
	}
	
	public void addEnforcedMethod(Method method) {
		this.enforcedMethods.add(method);
	}
	
	public String getParsed() {
		return parsed;
	}
	public void setParsed(String parsed) {
		this.parsed = parsed;
	}
	
	public String getInternal() {
		return internal;
	}
	public void setInternal(String internal) {
		this.internal = internal;
	}
	
	public String getException(Method method) {
		if(exceptions.get(method) == null)
			return getDefaultException();
		return exceptions.get(method);
	}
	
	public void setException(Method method, String exception) {
		this.exceptions.put(method, exception);
	}
	
	/**
	 * Get the qualified name of the exception that will be thrown on violation 
	 * of this specification unless overridden in the TriggeredSpecification.
	 */
	public String getDefaultException() {
		if (defaultException == null)
			if (getSpecType() == SpecType.CALL)
				return "CallSpecificationException";
			else {
				if (getSpecType() != SpecType.RETURN)
					throw new AssertionError("spec not 'call', not 'return'");
				return "ReturnSpecificationException";
			}
		else
			return defaultException;
	}

	/**
	 * Set the qualified name of the exception that will be thrown on violation 
	 * of this specification unless overrididen in the TriggeredSpecification.
	 * @param exc
	 */
	public void setDefaultException(String exc) {
		defaultException = exc;
	}
	
	/**
	 * Get a human-readable string representation of this specification.
	 * @return a human-readable string representation
	 */
	@Override
	public String toString() {
		return specType.name().toLowerCase()+" spec "+name;
	}

	public GuardedTransitionAutomaton getAutomaton() {
		return automaton;
	}
	
	public void setAutomaton(GuardedTransitionAutomaton automaton) {
		this.automaton = automaton;
	}
	
	public void setSourceLocation(SourceLocation location) {
		sourceLocation = location;
	}
	
	public SourceLocation getSourceLocation() {
		return sourceLocation;
	}
	
	public EnumSet<SpecModifier> getModifiers() {
		return modifiers;
	}
	
	public void setModifiers(EnumSet<SpecModifier> modifiers) {
		this.modifiers = modifiers;
	}
}
