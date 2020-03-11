package fi.hut.ics.lime.common.specification;

import java.util.EnumSet;
import java.util.Map;
import java.util.Set;

import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomaton;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;

/**
 * A interface for a specification.
 * A specification type contains both the textual and the compiled form
 * of the specification.
 * @author jalampin
 */
public interface Specification {
	/**
	 * @return the type the specification is associated with
	 */
	public abstract Source getSourceType();
	/**
	 * @return the methods that trigger the specification
	 */
	public abstract Set<Method> getEnforcedMethods();
	/**
	 * @return the name of the specification
	 */
	public abstract String getName();
	/**
	 * @return the textual form as read from the user input
	 */
	public abstract String getDeclared();
	/**
	 * @return an AST representation of the specification
	 */
	public abstract String getParsed();
	/**
	 * @return the specification in Positive Normal Form
	 * Same as getParsed() for regular expressions.
	 */
	public abstract String getInternal();
	/**
	 * @return RETURN or CALL 
	 */
	public abstract SpecType getSpecType();
	/**
	 * @param method a method to examine
	 * @return the qualified name of the exception the method throws when spec 
	 * broken
	 */
	public abstract String getException(Method method);
	/**
	 * Get the automaton for this specification.
	 * @return the automaton for this specification
	 */
	public abstract GuardedTransitionAutomaton getAutomaton();
	
	/**
	 * Get the mapping from Proposition nodes to their corresponding
	 * numbers (e.g., call proposition test() corresponds to integer 1
	 * and there for will appear as p1 in the code).
	 * @return
	 */
	public abstract Map<PropositionNode, Integer> getPropositionValues();
	
	/**
	 * @param sourceType the Source type the specification is associated with
	 */
	public abstract void setSourceType(Source sourceType);
	/**
	 * @param name the name of the specification
	 */
	public abstract void setName(String name);
	/**
	 * @param declared the textual form as read from the user input
	 */
	public abstract void setDeclared(String declared);
	/**
	 * @param parsed an AST representation of the spec
	 */
	public abstract void setParsed(String parsed);
	/**
	 * @param specType CALL or RETURN 
	 */
	public abstract void setSpecType(SpecType specType);
	/**
	 * @param method a method that we want to trigger the specification
	 */
	public abstract void addEnforcedMethod(Method method);
	/**
	 * @param internal the specification in Positive Normal Form
	 * Same as getParsed() for regular expressions.
	 */
	public abstract void setInternal(String internal);
	/**
	 * @param method a method to examine
	 * @param e the qualified name of the exception the method should throw 
	 * when specification broken
	 */
	public abstract void setException(Method method, String e);
	/**
	 * Set the automaton for this specification
	 * @param automaton the new automaton for this specification
	 */
	public abstract void setAutomaton(GuardedTransitionAutomaton automaton);
	/**
	 * @return the enabled modifiers on this specification.
	 */
	public abstract EnumSet<SpecModifier> getModifiers();
	/**
	 * @param modifiers the modifiers to use on this specification.
	 */
	public abstract void setModifiers(EnumSet<SpecModifier> modifiers);
}