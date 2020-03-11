package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * A support class that has empty implementations for visitor methods
 * @author jalampin
 *
 */
public class TreeVisitorSupport implements TreeVisitor {

	public void visitFutureTimeTemporalFormula(
			FutureTimeTemporalOperator formula) {
	}

	public void visitLiteral(Literal literal) {
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
	}

	public void visitProposition(PropositionNode proposition) {
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
	}

}
