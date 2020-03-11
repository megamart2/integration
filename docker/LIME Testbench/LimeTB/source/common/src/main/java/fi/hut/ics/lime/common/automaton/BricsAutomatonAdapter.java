package fi.hut.ics.lime.common.automaton;

import java.util.Hashtable;
import java.util.Map;

import dk.brics.automaton.Automaton;
import dk.brics.automaton.State;

import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

/**
 * A container class for a regexp/automaton definition and the automaton derived from it
 * using AutomatonAdapterFactory.
 * 
 * @author jalampin
 */
abstract public class BricsAutomatonAdapter {
	/**
	 * Human-readable regexp or automaton as given by the user but pretty-printed, for
	 * Eclipse tooltip. */
	private String parsedDefinition;
	
	/**
	 * Human-readable "simplified definition", for Eclipse tooltip. Currently the same as
	 * parsedDefinition. 
	 */
	private String internalDefinition;

	/**
	 * The atomic call and value propositions used by this automaton. 
	 */
	protected PropositionNode[] propositions;
	
	private Automaton complementAutomaton;
	private Map<State, Integer> stateMap;

	BricsAutomatonAdapter() {
		stateMap = new Hashtable<State, Integer>();
	}	

	/**
	 * Get the pretty-printed regexp or automaton as given by the user, for Eclipse tooltip.
	 * @return the definition, as a string
	 * @author jalampin
	 */
	public String getParsedDefinition() {
		return parsedDefinition;
	}

	/**
	 * Set the pretty-printed definition as given by the user, for Eclipse tooltip.
	 * @param parsedDefinition the definition string to set
	 * @author jalampin
	 */
	void setParsedDefinition(String parsedDefinition) {
		this.parsedDefinition = parsedDefinition;
	}

	/**
	 * Get all the propositions (AST roots) in this automaton.
	 * @return an array of PropositionNodes
	 * @author jalampin
	 */
	public PropositionNode[] getPropositions() {
		if (propositions == null)
			generatePropositions();
		return propositions;
	}

	/**
	 * Get the pretty-printed definition after simplification, for Eclipse tooltip.
	 * Currently this is the same as parsed definition.
	 * @author jalampin
	 */
	public String getInternalDefinition() {
		return internalDefinition;
	}

	/**
	 * Set the pretty-printed definition after simplification, for Eclipse tooltip.
	 * Currently this is the same as parsed regexp.
	 * @param internalDefinition the regexp string
	 * @author jalampin
	 */
	public void setInternalDefinition(String internalDefinition) {
		this.internalDefinition = internalDefinition;
	}

	/**
	 * Get the complement automaton for this definition.
	 * @return the complement automaton
	 * @author jalampin
	 */
	public Automaton getComplementAutomaton() {
		return complementAutomaton;
	}

	/**
	 * Set the complement automaton for this automaton.
	 * @param complementAutomaton the complement automaton
	 * @author jalampin
	 */
	public void setComplementAutomaton(Automaton complementAutomaton) {
		this.complementAutomaton = complementAutomaton;
	}

	/**
	 * Get the map of automaton states to integers.
	 * @return a map of States to Integers
	 * @author jalampin
	 */
	public Map<State, Integer> getStateMap() {
		return stateMap;
	}

	/**
	 * Set the map of automaton states to integers.
	 * @param stateMap a map of States to Integers
	 * @author jalampin
	 */
	public void setStateMap(Map<State, Integer> stateMap) {
		this.stateMap = stateMap;
	}

	/**
	 * Generate all boolean propositions needed by this automaton.
	 */
	abstract protected void generatePropositions();
	
}

