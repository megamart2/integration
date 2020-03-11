package fi.hut.ics.lime.common.automaton;

/**
 * Thrown by AutomatonAdapterFactory on regexp syntax or semantic error.
 * @author jalampin
 */
public class RegularExpressionException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RegularExpressionException() {
		super();
	}

	/** */
	public RegularExpressionException(String message) {
		super(message);
	}

	/** */
	public RegularExpressionException(Throwable cause) {
		super(cause);
	}

	/** */
	public RegularExpressionException(String message, Throwable cause) {
		super(message, cause);
	}

}
