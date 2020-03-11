package fi.hut.ics.lime.common.logic.ast;

import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * An abstract superclass for all AST structure modifies. 
 * @author jalampin
 */
public abstract class AbstractTreeModifier {
	private final ProcessingStrategy processingStrategy;
	
	/**
	 * Construct a new AbstractTreeModifier with the given processing strategy.
	 * The strategy tells whether the processing should be done in pre- or post-order.
	 * @author jalampin 
	 */
	protected AbstractTreeModifier(ProcessingStrategy processingStrategy) {
		this.processingStrategy = processingStrategy;
	}
	
	/**
	 * Get the current processing strategy (pre- or post-order).
	 * @see fi.hut.cis.common.temporalLogic.ast.TreeModifier#getProcessingStrategy()
	 * @author jalampin
	 */
	public ProcessingStrategy getProcessingStrategy() {
		return processingStrategy;
	}

	/**
	 * Visit a future time LTL node.
	 */
	public BooleanExpression visitFutureTimeTemporalFormula(FutureTimeTemporalOperator futureTimeTemporalOperator) {
		return futureTimeTemporalOperator;
	}

	/**
	 * Visit a literal node.
	 */
	public BooleanExpression visitLiteral(Literal literal) {
		return literal;
	}

	/**
	 * Visit a PtLTL node.
	 */
	public BooleanExpression visitPastTimeTemporalFormula(PastTimeTemporalOperator pastTimeTemporalOperator) {
		return pastTimeTemporalOperator;
	}

	/**
	 * Visit a propositional connective node.
	 */
	public BooleanExpression visitPropositionalConnective(PropositionalConnective propositionalConnective) {
		return propositionalConnective;
	}

	/**
	 * Visit a proposition node.
	 */
	public BooleanExpression visitPropositionNode(PropositionNode propositionNode) {
		return propositionNode;
	}
}
