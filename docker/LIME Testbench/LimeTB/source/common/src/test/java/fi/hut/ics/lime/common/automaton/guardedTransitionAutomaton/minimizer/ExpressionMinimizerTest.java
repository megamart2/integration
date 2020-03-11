package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.minimizer;

import junit.framework.TestCase;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;

public class ExpressionMinimizerTest extends TestCase {

	public void testLiterals() {
		BooleanExpression expression = new Literal(true);
		BooleanExpression minimized = ExpressionMinimizer
				.minimizeExpression(expression);
		if (minimized instanceof Literal && minimized.getTruthValue()) {
			// All is well.
		} else {
			fail("TRUE did not minimize to TRUE");
		}

		expression = new Literal(false);
		minimized = ExpressionMinimizer.minimizeExpression(expression);
		if (minimized instanceof Literal && !minimized.getTruthValue()) {
			// All is well.
		} else {
			fail("FALSE did not minimize to FALSE");
		}
	}

	public void testTautology() {
		// True tautology
		BooleanExpression expression = new PropositionalConnective(
				PropositionalConnectiveType.OR);
		BooleanExpression proposition1 = new PropositionNode("p1");
		BooleanExpression notProposition1 = new PropositionalConnective(
				PropositionalConnectiveType.NOT);
		notProposition1.setNth(1, proposition1);
		expression.setNth(1, proposition1);
		expression.setNth(2, notProposition1);
		BooleanExpression minimized = ExpressionMinimizer
				.minimizeExpression(expression);
		if (minimized instanceof Literal && minimized.getTruthValue()) {
			// All is well.
		} else {
			fail("A tautology did not minimize to TRUE");
		}

		// False tautology
		expression = new PropositionalConnective(
				PropositionalConnectiveType.AND);
		expression.setNth(1, proposition1);
		expression.setNth(2, notProposition1);
		minimized = ExpressionMinimizer.minimizeExpression(expression);
		if (minimized instanceof Literal && !minimized.getTruthValue()) {
			// All is well.
		} else {
			fail("A false tautology did not minimize to FALSE");
		}
	}
}
