package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.TemporalLogicException;

/**
 * Thrown by visitors if a semantic error is encountered.
 * This includes for example the cases where a PLTL mixes
 * past and future operators or a regexp contains temporal operators.
 * @author jalampin
 */
@SuppressWarnings("serial")
public class SemanticException extends TemporalLogicException {

	public SemanticException() {
		super();
	}

	/** */
	public SemanticException(String message) {
		super(message);
	}

	/** */
	public SemanticException(Throwable cause) {
		super(cause);
	}

	/** */
	public SemanticException(String message, Throwable cause) {
		super(message, cause);
	}

}
