package fi.hut.ics.lime.aspectmonitor;

/**
 * Thrown by default on call specification violation. 
 * @author sliedes
 */
public class CallSpecificationException extends SpecException {
	private static final long serialVersionUID = 341327345651608257L;

	public CallSpecificationException() {
		super();
	}

	/**
	 * Construct a new exception with the given message and cause.
	 * @param message a human-readable message
	 * @param cause the cause (throwable) of this exception
	 */
	public CallSpecificationException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * Construct a new exception with the given message.
	 * @param message a human-readable message
	 */
	public CallSpecificationException(String message) {
		super(message);
	}

	/**
	 * Construct a new exception with the given cause.
	 * @param cause the cause (throwable) of this exception.
	 */
	public CallSpecificationException(Throwable cause) {
		super(cause);
	}
}
