package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Base class for all binary logical connectives.
 * 
 * @author osaariki
 */
public abstract class BinaryConnective implements Formula {

	private Formula left, right;

	/**
	 * @param left
	 *            the left hand side formula.
	 * @param right
	 *            the right hand side formula.
	 */
	public BinaryConnective(Formula left, Formula right) {
		this.left = left;
		this.right = right;
	}

	/**
	 * Returns the truth value of this connective given the truth values of the left and right formulas.
	 * 
	 * @param left truth value of the left hand side formula.
	 * @param right truth value of the right hand side formula.
	 * @return the truth value of this connective.
	 */
	protected abstract boolean getTruthValue(boolean left, boolean right);

	public boolean isTrue() {
		return getTruthValue(left.isTrue(), right.isTrue());
	}
}
