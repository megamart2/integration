package fi.hut.ics.lime.common.automaton;

/**
 * Thrown on always_nfa automata errors (mostly? semantic errors).
 * @author sliedes
 */
public class AutomatonException extends Exception {
	private static final long serialVersionUID = -826003815255165603L;

	public AutomatonException() {
		super();
	}
	
	/**
	 * Construct a new exception with the given message.
	 * @param s Human-readable message
	 */
	public AutomatonException(String s) {
		super(s);
	}
}
