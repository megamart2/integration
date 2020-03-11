package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * This class checks whether a formula is a pure propositional formula.
 * This means it does not contain any temporal operators.
 * @author jalampin
 */
public class PropositionalSemanticAnalysisVisitor implements TreeVisitor {
	private Boolean containsTemporal;
	
	/**
	 * Construct a new visitor and check the subtree for temporal operators.
	 * @param node the AST tree
	 * @throws SemanticException if a temporal operator is found
	 */
	public PropositionalSemanticAnalysisVisitor(BooleanExpression node) throws SemanticException {
		containsTemporal = false;
		if(node != null)
			node.accept(this);
		if(containsTemporal) {
			throw new SemanticException("Temporal operator may not be used here.");
		}
	}
	public void visitFutureTimeTemporalFormula(
			FutureTimeTemporalOperator formula) {
		containsTemporal = true;

	}

	public void visitLiteral(Literal literal) {
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		containsTemporal = true;
	}

	public void visitProposition(PropositionNode proposition) {
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
	}

}
