package fi.hut.ics.lime.aspectmonitor;

/**
 * Thrown by default on return specification violation.
 * @author sliedes
 */
public class ReturnSpecificationException extends SpecException {
	private static final long serialVersionUID = -3166249399797959395L;

	public ReturnSpecificationException() {
		super();
	}

	/**
	 * Construct a new exception with the given message and cause.
	 * @param message a human-readable message
	 * @param cause the cause (throwable) of this exception
	 */
	public ReturnSpecificationException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * Construct a new exception with the given message.
	 * @param message a human-readable message
	 */
	public ReturnSpecificationException(String message) {
		super(message);
	}

	/**
	 * Construct a new exception with the given cause.
	 * @param cause the cause (throwable) of this exception.
	 */
	public ReturnSpecificationException(Throwable cause) {
		super(cause);
	}
}
