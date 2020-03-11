package fi.hut.ics.lime.ljut.junitgen.tokenizer;

/**
 * Thrown by {@link ParameterStringTokenizer} for any tokenizing exceptions.
 * 
 * @author osaariki
 */
public class TokenizingException extends Exception {

	private static final long serialVersionUID = 1L;

	/**
	 * Initializes a new instance with the specified message.
	 * 
	 * @param message the message.
	 */
	public TokenizingException(String message) {
		super(message);
	}
}
