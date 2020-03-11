package fi.hut.ics.lime.common.logic.ast.node;

/**
 * Thrown by LogicOperator if the user tries to set a second child for a unary operator. 
 * @author jalampin
 */
@SuppressWarnings("serial")
public class NodeOperationException extends RuntimeException {

	public NodeOperationException() {
		super();
	}

	/** */
	public NodeOperationException(String message) {
		super(message);
	}

	/** */
	public NodeOperationException(Throwable cause) {
		super(cause);
	}

	/** */
	public NodeOperationException(String message, Throwable cause) {
		super(message, cause);
	}

}
