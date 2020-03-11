package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;
import java.util.LinkedList;
import java.util.Iterator;

/**
 * This class represents a guarded transition automaton that is constructed 
 * from States, which in turn have transitions (possibly with logical guards)
 * between each other.
 * 
 * @author jalampin
 */

public class GuardedTransitionAutomaton implements Iterable<State> {
	private LinkedList<State> states;
	private State initialState = null;
	
	/**
	 *  Creates an empty automaton (with no states).
	 */
	public GuardedTransitionAutomaton() {
		states = new LinkedList<State>();
	}
	
	/**
	 * Getter for the (unique) initial state of the automaton.
	 * @return initial state of the automaton, or null if none is set.
	 */
	public State getInitialState() {
		return initialState;
	}

	/**
	 * Sets the initial state of the automaton.
	 * @param initialState state to be declared as initial.
	 * @throws GuardedTransitionAutomatonException if the given state does not belong into the automaton.
	 */
	public void setInitialState(State initialState) throws GuardedTransitionAutomatonException {
		if(!states.contains(initialState))
			throw new GuardedTransitionAutomatonException("Given initial state does not belong into the automaton.");
		this.initialState = initialState;
	}


	/**
	 * A GuardedTransitionAutomaton is iterable over its States.
	 */
	public Iterator<State> iterator() {
		return states.iterator();
	}

	/**
	 * Getter for the number of state in the automaton.
	 * @return the number of states in the automaton.
	 */
	public int getNumberOfStates() {
		return states.size();
	}
	
	/**
	 * Returns the accepting states of the automata.
	 * @return the accepting states of the automata as a linked list.
	 */
	public LinkedList<State> acceptingStates() {
		LinkedList<State> accepting = new LinkedList<State>();
		for(State state : this) {
			if(state.isAccepting()) {
				accepting.add(state);
			}		
		}
		return accepting;
	}
	
	/**
	 * Adds a State to the automata.
	 * @param state The state to be added.
	 */
	public void addState(State state) {
		states.add(state);
	}
	
	/**
	 * Return a human-readable representation of the automaton.
	 */
	@Override
	public String toString() {
		String string = "AutomatonDefinition:\n";
		for(State state : this) {
			if(state == null)
				continue;
			string += (state == initialState ? "Initial " : "");
			string += (state.isAccepting() ? "Accepting ": "");
			string += "State "+state.toString()+": \n";
			for(GuardedTransition guardedTransition : state) {
				string += guardedTransition.toString()+"\n";
			}
		}
		return string;
	}
}
