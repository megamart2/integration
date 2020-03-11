package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements the disjunction connective (aka OR).
 * 
 * @author osaariki
 */
public class Disjunction extends BinaryConnective {

	/**
	 * @param left
	 *            the left hand side formula.
	 * @param right
	 *            the right hand side formula.
	 */
	public Disjunction(Formula left, Formula right) {
		super(left, right);
	}

	@Override
	protected boolean getTruthValue(boolean left, boolean right) {
		return left || right;
	}
}
