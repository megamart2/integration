package fi.hut.ics.lime.common.logic.ast.visitors;

/**
 * Thrown by a visitor if a formula refers to an unknown proposition. 
 * @author jalampin
 */
@SuppressWarnings("serial")
public class UnknownPropositionException extends Exception {

	/** */
	public UnknownPropositionException() {
	}

	/** */
	public UnknownPropositionException(String arg0) {
		super(arg0);
	}

	/** */
	public UnknownPropositionException(Throwable arg0) {
		super(arg0);
	}

	/** */
	public UnknownPropositionException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}
}
