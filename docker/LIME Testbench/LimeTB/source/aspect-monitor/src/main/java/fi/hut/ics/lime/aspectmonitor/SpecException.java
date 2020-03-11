package fi.hut.ics.lime.aspectmonitor;

/**
 * The default exception thrown by specs for which no other is defined.  
 * @author jalampin
 */
abstract public class SpecException extends RuntimeException {
	private static final long serialVersionUID = 1287615292817459327L;

	public SpecException() {
		super();
	}

	/** */
	public SpecException(String message, Throwable cause) {
		super(message, cause);
	}

	/** */
	public SpecException(String message) {
		super(message);
	}

	/** */
	public SpecException(Throwable cause) {
		super(cause);
	}

}
