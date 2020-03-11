package fi.hut.ics.lime.common.aspect.generator;

/**
 * Thrown by code generators if a # expression refers to a variable
 * not defined in the host language code. 
 * @author jalampin
 */
public class UndefinedValueException extends Exception {

	private static final long serialVersionUID = 1L;

	public UndefinedValueException() {
		super();
	}

	/** */
	public UndefinedValueException(String message) {
		super(message);
	}

	/** */
	public UndefinedValueException(Throwable cause) {
		super(cause);
	}

	/** */
	public UndefinedValueException(String message, Throwable cause) {
		super(message, cause);
	}

}
