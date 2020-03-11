package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements the conjunction connective (aka AND).
 * 
 * @author osaariki
 */
public class Conjunction extends BinaryConnective {

	/**
	 * @param left
	 *            the left hand side formula.
	 * @param right
	 *            the right hand side formula.
	 */
	public Conjunction(Formula left, Formula right) {
		super(left, right);
	}

	@Override
	protected boolean getTruthValue(boolean left, boolean right) {
		return left && right;
	}
}
