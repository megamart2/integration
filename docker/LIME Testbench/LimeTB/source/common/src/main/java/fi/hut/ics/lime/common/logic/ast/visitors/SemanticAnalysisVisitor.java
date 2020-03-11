package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;


/**
 * This visitor performs semantic analysis to the formulas.
 * @author jalampin
 *
 */
public class SemanticAnalysisVisitor implements TreeVisitor {
	private boolean hasIllegalFormulas;
	
	/**
	 * Construct a visitor and semantically analyze the formulas.
	 * @param node the root of the AST
	 * @throws SemanticException if PtLTLs have FtLTL subformulas
	 */
	public SemanticAnalysisVisitor(BooleanExpression node) throws SemanticException {
		hasIllegalFormulas = false;
		node.accept(this);
		if(hasIllegalFormulas) {
			throw new SemanticException("Unsupported property: past time "+
					"formulas are not allowed to have future time subformulas.");
		}
	}
	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
		formula.setFutureTimeFormula(true);
		if(formula.isUnaryOperator()) {
			formula.setPastTimeFormula(formula.getNth(1).isPastTimeFormula());
		} else {
			formula.setPastTimeFormula(formula.getNth(1).isPastTimeFormula() || 
					formula.getNth(2).isPastTimeFormula());
		}
			
	}

	public void visitLiteral(Literal literal) {
		literal.setFutureTimeFormula(false);
		literal.setPastTimeFormula(false);
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		
		formula.setPastTimeFormula(true);
		if(formula.isUnaryOperator()) {
			formula.setFutureTimeFormula(formula.getNth(1).isFutureTimeFormula());
		} else {
			formula.setFutureTimeFormula(formula.getNth(1).isFutureTimeFormula() ||
					formula.getNth(2).isFutureTimeFormula());
		}
		if(formula.isFutureTimeFormula()) {
			hasIllegalFormulas = true;
		}		
	}

	public void visitProposition(PropositionNode proposition) {
		proposition.setFutureTimeFormula(false);
		proposition.setPastTimeFormula(false);
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
		boolean past, future;
		if(connective.isUnaryOperator()) {
			past = connective.getNth(1).isPastTimeFormula();
			future = connective.getNth(1).isFutureTimeFormula();
		} else {
			past = (connective.getNth(1).isPastTimeFormula() ||
					connective.getNth(2).isPastTimeFormula());
			future = (connective.getNth(1).isFutureTimeFormula() ||
					connective.getNth(2).isFutureTimeFormula());
		}
		connective.setFutureTimeFormula(future);
		connective.setPastTimeFormula(past);
	}

}
