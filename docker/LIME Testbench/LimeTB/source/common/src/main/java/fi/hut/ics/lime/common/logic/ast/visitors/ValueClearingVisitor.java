package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * Sets all truth values of visited nodes to null.
 * @author jalampin
 */
public class ValueClearingVisitor implements TreeVisitor {
	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
		formula.setValue(null);
	}

	public void visitLiteral(Literal literal) {
		literal.setValue(null);
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		formula.setValue(null);
	}

	public void visitProposition(PropositionNode proposition) {
		proposition.setValue(null);
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
		connective.setValue(null);
	}
}
