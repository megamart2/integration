package fi.hut.ics.lime.ljut.drivergen;

/**
 * An exception thrown by {@link DriverProperties}.
 * 
 * @author osaariki
 */
public class PropertyParsingException extends Exception {

	private static final long serialVersionUID = 1L;

	/**
	 * Initializes a new instance with the given message.
	 * 
	 * @param message
	 *            the message.
	 */
	public PropertyParsingException(String message) {
		super(message);
	}
}
