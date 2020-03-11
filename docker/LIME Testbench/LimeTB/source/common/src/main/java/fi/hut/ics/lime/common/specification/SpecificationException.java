package fi.hut.ics.lime.common.specification;

/**
 * Thrown by SpecificationFactory on syntax or logic error.
 * @author jalampin
 */
public class SpecificationException extends Exception {
	private static final long serialVersionUID = 1L;

	public SpecificationException() {
		super();
	}

	/** */
	public SpecificationException(String message) {
		super(message);
	}

	/** */
	public SpecificationException(Throwable cause) {
		super(cause);
	}

	/** */
	public SpecificationException(String message, Throwable cause) {
		super(message, cause);
	}

}
