package fi.hut.ics.lime.common.logic;

/**
 * Superclass for syntactic, lexical and semantic exceptions for PLTL.
 * @author jalampin
 */
@SuppressWarnings("serial")
public class TemporalLogicException extends Exception {

	public TemporalLogicException() {
		super();
	}

	/** */
	public TemporalLogicException(String arg0) {
		super(arg0);
	}

	/** */
	public TemporalLogicException(Throwable arg0) {
		super(arg0);
	}

	/** */
	public TemporalLogicException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

}
