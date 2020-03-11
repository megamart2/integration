package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;

import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.visitors.PrettyPrinter;

/**
 * This class represents a transition with a guard. The guard is
 * a logical expression that should evaluate to true for the 
 * transition to take place.
 * @author jalampin
 *
 */
public class GuardedTransition {
	private BooleanExpression guard;
	private State target;
	
	/**
	 * Create an empty transition with no guard or target state.
	 */
	public GuardedTransition() {
		this.guard = new Literal(true);
		this.target = null;
	}
	
	/**
	 * Returns the guard, i.e. what is required to be true for this
	 * transition to take place.
	 * @return the root node of the guard.
	 */
	public BooleanExpression getGuard() {
		return guard;
	}
	/**
	 * A getter for the target state of this transition.
	 * @return The target state of this transition.
	 */
	public State getTarget() {
		return target;
	}
	/**
	 * Sets a guard for this transition.
	 * @param guard Logic formula required to be true for this
	 * transition to take place.
	 */
	public void setGuard(BooleanExpression guard) {
		this.guard = guard;
	}
	/**
	 * Setter for the target state of this transition.
	 * @param target
	 */
	public void setTarget(State target) {
		this.target = target;
	}
	
	/**
	 * Return a human-readable representation of the transition.
	 */
	@Override
	public String toString() {
		String g;
		try {
			PrettyPrinter prettyPrinter = new PrettyPrinter(guard);
			g = prettyPrinter.getPrettyPrint();
		} catch(NullPointerException e) {
			g = "no guard";
		}
		return "transition "+g+": "+target.toString();
	}
}
