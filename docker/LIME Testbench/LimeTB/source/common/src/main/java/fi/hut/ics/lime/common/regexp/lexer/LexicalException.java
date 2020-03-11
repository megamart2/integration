package fi.hut.ics.lime.common.regexp.lexer;

import fi.hut.ics.lime.common.automaton.RegularExpressionException;

/**
 * Thrown by RegexpLexer on a lexical error.
 * @author jalampin
 */
public class LexicalException extends RegularExpressionException {
	private static final long serialVersionUID = 1L;

	public LexicalException() {
		super();
	}

	/** */
	public LexicalException(String message) {
		super(message);
	}

	/** */
	public LexicalException(Throwable cause) {
		super(cause);
	}

	/** */
	public LexicalException(String message, Throwable cause) {
		super(message, cause);
	}
}
