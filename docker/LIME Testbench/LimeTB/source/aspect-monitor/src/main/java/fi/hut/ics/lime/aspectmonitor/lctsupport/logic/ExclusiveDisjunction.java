package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements the exclusive disjunction connective (aka XOR).
 * 
 * @author osaariki
 */
public class ExclusiveDisjunction extends BinaryConnective {

	/**
	 * @param left
	 *            the left hand side formula.
	 * @param right
	 *            the right hand side formula.
	 */
	public ExclusiveDisjunction(Formula left, Formula right) {
		super(left, right);
	}

	@Override
	protected boolean getTruthValue(boolean left, boolean right) {
		return left ^ right;
	}
}
