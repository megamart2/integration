package fi.hut.ics.lime.common.aspect;

/**
 * Thrown by AspectFactory when aspect construction is unsuccessful.
 * @author jalampin
 */
public class AspectException extends Exception {
	private static final long serialVersionUID = 1L;

	public AspectException() {
		super();
	}

	/** */
	public AspectException(String message) {
		super(message);
	}

	/** */
	public AspectException(Throwable cause) {
		super(cause);
	}

	/** */
	public AspectException(String message, Throwable cause) {
		super(message, cause);
	}

}
