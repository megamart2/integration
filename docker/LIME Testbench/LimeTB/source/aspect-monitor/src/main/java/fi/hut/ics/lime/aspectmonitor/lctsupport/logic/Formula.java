package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Interface for all components of propositional formulas.
 * 
 * @author osaariki
 */
public interface Formula {

	/**
	 * @return the truth value of this formula. In case of connectives this should recurse down the tree to evaluate the
	 *         formula.
	 */
	boolean isTrue();
}
