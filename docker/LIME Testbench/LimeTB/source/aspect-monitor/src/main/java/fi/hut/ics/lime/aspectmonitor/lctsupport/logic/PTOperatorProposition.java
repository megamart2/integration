package fi.hut.ics.lime.aspectmonitor.lctsupport.logic;

import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;

/**
 * Represents a proposition linked to a past time temporal operator.
 * 
 * @author osaariki
 */
public class PTOperatorProposition extends Proposition {

	private PastTimeTemporalOperator operator;
	private boolean stagedValue;
	private Formula preUpdateRule, postUpdateRule;
	private boolean initValue;
	private int distanceFromAutomaton;

	/**
	 * Constructs a new instance for the given temporal operator. The distance from the automaton is initialized to
	 * Integer.MAX_VALUE.
	 * 
	 * @param operator
	 */
	public PTOperatorProposition(PastTimeTemporalOperator operator) {
		this.operator = operator;
		distanceFromAutomaton = Integer.MAX_VALUE;
	}

	/**
	 * @return returns the past time operator this proposition was constructed for.
	 */
	public PastTimeTemporalOperator getOperator() {
		return operator;
	}

	/**
	 * Stages a truth value to be committed. A subsequent call to commitValue() will set this propositions truth value
	 * to the staged value. This mechanism is used to resolve situations where the an update formula of a past time
	 * proposition refers to another past time proposition.
	 * 
	 * @param value
	 *            the value to stage.
	 */
	public void stageValue(boolean value) {
		this.stagedValue = value;
	}

	/**
	 * Sets this propositions truth value to the previously staged value.
	 */
	public void commitValue() {
		setValue(stagedValue);
	}

	/**
	 * @return the formula used for updating this past time proposition before the transitions of the automaton are
	 *         resolved.
	 */
	public Formula getPreUpdateRule() {
		return preUpdateRule;
	}

	/**
	 * @return the formula used for updating this past time proposition after the transitions of the automaton are
	 *         resolved.
	 */
	public Formula getPostUpdateRule() {
		return postUpdateRule;
	}

	/**
	 * @param preUpdateRule
	 *            sets the pre-transition update rule.
	 */
	public void setPreUpdateRule(Formula preUpdateRule) {
		this.preUpdateRule = preUpdateRule;
	}

	/**
	 * @param postUpdateRule
	 *            sets the post-transition update rule.
	 */
	public void setPostUpdateRule(Formula postUpdateRule) {
		this.postUpdateRule = postUpdateRule;
	}

	/**
	 * @return the truth value a call to init() would set this proposition to.
	 */
	public boolean getInitValue() {
		return initValue;
	}

	/**
	 * @param initValue
	 *            the truth value this proposition will be set to with a call to init().
	 */
	public void setInitValue(boolean initValue) {
		this.initValue = initValue;
	}

	/**
	 * Initializes this propositions truth value to a previously defined value.
	 */
	public void init() {
		setValue(initValue);
	}

	/**
	 * @return the minimum distance from the automaton thus far.
	 */
	public int getDistanceFromAutomaton() {
		return distanceFromAutomaton;
	}

	/**
	 * Updates this propositions distance from the main automaton. Only lower values than the one already known are
	 * stored.
	 * 
	 * @param distanceFromAutomaton
	 *            the measured distance from the automaton.
	 */
	public void updateDistanceFromAutomaton(int distanceFromAutomaton) {
		this.distanceFromAutomaton = Math.min(this.distanceFromAutomaton, distanceFromAutomaton);
	}
}
