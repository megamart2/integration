package fi.hut.ics.lime.ljut;

/**
 * An exception thrown from the parsers in {@link MethodSignature} and {@link ConstructorSignature}.
 * 
 * @author osaariki
 */
public class SignatureParsingException extends Exception {

	private static final long serialVersionUID = 1L;

	/**
	 * Initializes a new instance with the given message.
	 * 
	 * @param message the message.
	 */
	public SignatureParsingException(String message) {
		super(message);
	}
}