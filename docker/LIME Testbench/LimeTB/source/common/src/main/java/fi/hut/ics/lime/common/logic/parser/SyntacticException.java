package fi.hut.ics.lime.common.logic.parser;

import fi.hut.ics.lime.common.logic.TemporalLogicException;

/**
 * Thrown by PLTLParser on a syntax error.
 * @author jalampin
 */
@SuppressWarnings("serial")
public class SyntacticException extends TemporalLogicException {

	public SyntacticException() {
	}

	/** */
	public SyntacticException(String message) {
		super(message);
	}

	/** */
	public SyntacticException(Throwable cause) {
		super(cause);
	}

	/** */
	public SyntacticException(String message, Throwable cause) {
		super(message, cause);
	}
}
