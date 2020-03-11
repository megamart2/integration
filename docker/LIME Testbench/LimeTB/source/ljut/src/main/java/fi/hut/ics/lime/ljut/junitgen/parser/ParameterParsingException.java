package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Thrown by {@link ParameterParser} for various parsing exceptions.
 * 
 * @author osaariki
 */
public class ParameterParsingException extends Exception {

	private static final long serialVersionUID = 1L;

	/**
	 * Initializes a new instance with the given message.
	 * 
	 * @param message the message.
	 */
	public ParameterParsingException(String message) {
		super(message);
	}
}
