package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Represents a possible transition in a finite state automaton. The transition applies only if the guard evaluates to
 * true.
 * 
 * @author osaariki
 */
public class Transition {

	private Formula guard;
	private int targetState;

	/**
	 * @param guard
	 *            the transition guard for this transition.
	 * @param targetState
	 *            the target state of this transition.
	 */
	public Transition(Formula guard, int targetState) {
		this.guard = guard;
		this.targetState = targetState;
	}

	/**
	 * @return the guard of this transition.
	 */
	public Formula getGuard() {
		return guard;
	}

	/**
	 * @return the target state of this transition.
	 */
	public int getTargetState() {
		return targetState;
	}
}
