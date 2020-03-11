package fi.hut.ics.lime.common.automaton.parser;

/**
 * Thrown on syntax errors in always_nfa parsing.
 * @author sliedes
 */
public class SyntaxError extends Error {
	private static final long serialVersionUID = -1366790710618436515L;

	/**
	 * Construct a new SyntaxError with the given message.
	 * @param s human-readable message
	 */
	public SyntaxError(String s) {
		super(s);
	}
}
