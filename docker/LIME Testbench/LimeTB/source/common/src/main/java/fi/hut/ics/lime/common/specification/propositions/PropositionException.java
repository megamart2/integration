package fi.hut.ics.lime.common.specification.propositions;

/**
 * Thrown by proposition code on a parse error.
 * @author jalampin
 */
public class PropositionException extends Exception {

	private static final long serialVersionUID = 1L;

	public PropositionException() {
		super();
	}

	/** */
	public PropositionException(String message) {
		super(message);
	}

	/** */
	public PropositionException(Throwable cause) {
		super(cause);
	}

	/** */
	public PropositionException(String message, Throwable cause) {
		super(message, cause);
	}
}
