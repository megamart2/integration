package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Implements the negation connective.
 * 
 * @author osaariki
 */
public class Negation implements Formula {

	private Formula child;

	/**
	 * @param child the subformula for this negation.
	 */
	public Negation(Formula child) {
		this.child = child;
	}

	public boolean isTrue() {
		return !child.isTrue();
	}
}
