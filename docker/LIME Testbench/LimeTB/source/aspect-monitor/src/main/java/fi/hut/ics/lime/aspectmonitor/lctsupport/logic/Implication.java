package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements the implication connective.
 * 
 * @author osaariki
 */
public class Implication extends BinaryConnective {

	/**
	 * @param left
	 *            the left hand side formula.
	 * @param right
	 *            the right hand side formula.
	 */
	public Implication(Formula left, Formula right) {
		super(left, right);
	}

	@Override
	protected boolean getTruthValue(boolean left, boolean right) {
		return !left || right;
	}
}
