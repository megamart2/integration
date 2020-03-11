package fi.hut.ics.lime.common.automaton.ast;

import java.util.LinkedList;

/**
 * An AST node for an always_nfa automaton state.
 * @author sliedes
 */
public class AutomatonState {
	private String name;
	private LinkedList<AutomatonIfBranch> branches;
	
	/**
	 * Construct a new automaton state.
	 * @param name the name of this state
	 * @param branches a linked list of if branches in (= transitions from) this state
	 */
	public AutomatonState(String name, LinkedList<AutomatonIfBranch> branches) {
		this.name = name;
		this.branches = branches;
	}
	
	/**
	 * Get a linked list of if branches in (= transitions from) this state.
	 * @return a linked list of if branches
	 */
	public LinkedList<AutomatonIfBranch> getBranches() {
		return branches;
	}
	
	/**
	 * Get the name of this state.
	 * @return the name of this state
	 */
	public String getName() {
		return name;
	}
}
