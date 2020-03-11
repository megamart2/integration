package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

/**
 * Represents a proposition in a propositional formula.
 * 
 * @author osaariki
 */
public class Proposition implements Formula {

	private boolean value;

	/**
	 * Constructs a new proposition with the truth value initially set to TRUE.
	 */
	public Proposition() {
		this.value = true;
	}

	/**
	 * @param value the new truth value for this proposition.
	 */
	public void setValue(boolean value) {
		this.value = value;
	}

	public boolean isTrue() {
		return value;
	}
}
