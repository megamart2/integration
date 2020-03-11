package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements a constant in a propositional formula (TRUE or FALSE).
 * 
 * @author osaariki
 */
public class Constant implements Formula {

	private boolean truthValue;

	/**
	 * @param truthValue the truth value for this constant.
	 */
	public Constant(boolean truthValue) {
		this.truthValue = truthValue;
	}

	public boolean isTrue() {
		return truthValue;
	}
}
