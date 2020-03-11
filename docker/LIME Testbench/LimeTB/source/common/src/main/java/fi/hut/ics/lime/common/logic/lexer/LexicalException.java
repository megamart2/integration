package fi.hut.ics.lime.common.logic.lexer;

import fi.hut.ics.lime.common.logic.TemporalLogicException;

/**
 * Thrown by PLTL lexer when an unknown token is input.
 * @author jalampin
 */
@SuppressWarnings("serial")
public class LexicalException extends TemporalLogicException {

	public LexicalException() {
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
