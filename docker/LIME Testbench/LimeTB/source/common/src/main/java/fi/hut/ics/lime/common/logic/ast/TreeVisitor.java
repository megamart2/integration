package fi.hut.ics.lime.common.logic.ast;

import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
/**
 * Interface for the basic tree visitor pattern for the temporal formulas.
 * @author jalampin
 *
 */
public interface TreeVisitor {
	/**
	 * Visit a literal node.
	 * @param literal a literal AST node to visit
	 */
	public void visitLiteral(Literal literal);

	/**
	 * Visit a proposition node.
	 * @param proposition a proposition AST node to visit
	 */
	public void visitProposition(PropositionNode proposition);
	
	/**
	 * Visit a propositional connective node.
	 * @param connective a propositional connective AST node to visit
	 */
	public void visitPropositionalConnective(
			PropositionalConnective connective);
	
	/**
	 * Visit a PtLTL node.
	 * @param formula a PtLTL AST node to visit.
	 */
	public void visitPastTimeTemporalFormula(
			PastTimeTemporalOperator formula);
	
	/**
	 * Visit a FtLTL node.
	 * @param formula a FtLTL AST node to visit.
	 */
	public void visitFutureTimeTemporalFormula(
			FutureTimeTemporalOperator formula);
}