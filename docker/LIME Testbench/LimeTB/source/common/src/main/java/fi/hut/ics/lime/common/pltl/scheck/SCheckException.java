package fi.hut.ics.lime.common.pltl.scheck;

/**
 * Thrown by SCheck on error.
 * @author jalampin
 */
public class SCheckException extends Exception {
	private static final long serialVersionUID = 1L;

	public SCheckException() {
		super();
	}

	/** */
	public SCheckException(String message) {
		super(message);
	}

	/** */
	public SCheckException(Throwable cause) {
		super(cause);
	}

	/** */
	public SCheckException(String message, Throwable cause) {
		super(message, cause);
	}

}
