package fi.hut.ics.lime.common.automaton.ast;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;

/**
 * An AST node for an if branch of an always_nfa definition.
 * @author sliedes
 */
public class AutomatonIfBranch {
	private String targetStateName;
	private BooleanExpression cond;

	/**
	 * Construct a new if branch AST node.
	 * @param condition the condition (boolean expression) for this if branch
	 * @param targetStateName the target state
	 */
	public AutomatonIfBranch(BooleanExpression condition, String targetStateName) {
		this.cond = condition;
		this.targetStateName = targetStateName;
	}	
	
	/**
	 * Get the name of the target state of this if branch.
	 * @return the name of the target state
	 */
	public String getTargetStateName() {
		return targetStateName;
	}
	
	/**
	 * Get the condition (boolean expression) for this if branch.
	 * @return the condition for this if branch
	 */
	public BooleanExpression getCondition() {
		return cond;
	}
}
