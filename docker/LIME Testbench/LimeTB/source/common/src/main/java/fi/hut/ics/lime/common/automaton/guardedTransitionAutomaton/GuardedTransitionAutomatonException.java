package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;

/**
 * Thrown by GuardedTransitionAutomaton on SCheck error.
 * @author jalampin
 */
@SuppressWarnings("serial")
public class GuardedTransitionAutomatonException extends Exception {
	public GuardedTransitionAutomatonException() {
		super();
	}

	/** */
	public GuardedTransitionAutomatonException(String message) {
		super(message);
	}

	/** */
	public GuardedTransitionAutomatonException(Throwable cause) {
		super(cause);
	}

	/** */
	public GuardedTransitionAutomatonException(String message, Throwable cause) {
		super(message, cause);
	}

}
