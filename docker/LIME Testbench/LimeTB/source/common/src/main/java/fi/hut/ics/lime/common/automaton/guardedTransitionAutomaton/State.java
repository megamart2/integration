package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;
import java.util.LinkedList;
import java.util.Iterator;

/**
 * A DFA state.
 * @author jalampin
 */
public class State implements Iterable<GuardedTransition> {
	private boolean isAccepting = false;
	private LinkedList<GuardedTransition> guardedTransitions;
	private int number;
	
	/**
	 * Creates an empty state (with no transitions).
	 */
	public State() {
		guardedTransitions = new LinkedList<GuardedTransition>();
	}
	
	/**
	 * Getter for the state number, which can be used to identify the state.
	 * @return Number of the state.
	 */
	public Integer getNumber() {
		return number;
	}
	
	/**
	 * Returns the number of transitions from this state.
	 * @return The number of transitions from this state.
	 */
	public int getNumberOfTransitions() {
		return guardedTransitions.size();
	}
	
	/**
	 * Sets a number for this state (by which it can identified).
	 * @param number State's number.
	 */
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	/**
	 * Is the state accepting one?
	 * @return Truth value of whether or not this state is accepting. 
	 */
	public boolean isAccepting() {
		return isAccepting;
	}
	/**
	 * Setter for this state being accepting one.
	 * @param isAccepting
	 */
	public void setAccepting(boolean isAccepting) {
		this.isAccepting = isAccepting;
	}

	/**
	 * A State is Iterable over its Transitions.
	 * @return An iterator over its Transitions.
	 */
	public Iterator<GuardedTransition> iterator() {
		return guardedTransitions.iterator();
	}
	
	/**
	 * Add a (guarded) transition from the State.
	 * @param guardedTransition The transition to be added to the state.
	 */
	public void addTransition(GuardedTransition guardedTransition) {
		guardedTransitions.add(guardedTransition);
	}
	
	/**
	 * Return a textual representation of the state (simply its number).
	 */
	@Override
	public String toString() {
		return number+"";
	}
}
