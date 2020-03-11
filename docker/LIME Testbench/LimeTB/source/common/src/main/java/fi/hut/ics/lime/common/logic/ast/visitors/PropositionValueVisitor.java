package fi.hut.ics.lime.common.logic.ast.visitors;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
/**
 * This visitor assigns proposition nodes their correct values.
 * @author jalampin
 *
 */
public class PropositionValueVisitor implements TreeVisitor {
	private Map<String, String> propositions;
	private boolean hasErrors;
	private List<String> unknownPropositions;
	
	/**
	 * Starts the visitor which assigns the values for the propositions.
	 * @param propositions A mapping from proposition names to their
	 * corresponding values.
	 * @param node Root node of the formula.
	 * @throws UnknownPropositionException If the visitor encounters a node
	 * to which it can't assign a value.
	 */
	public PropositionValueVisitor(Map<String, String> propositions, BooleanExpression node) throws
		UnknownPropositionException {
		String errorMessage = "The formula contains the following undeclared proposition(s):\n";
		this.propositions = propositions;
		this.hasErrors = false;
		this.unknownPropositions = new LinkedList<String>();
		node.accept(this);
		
		if(hasErrors) {
			for(String proposition : unknownPropositions) {
				errorMessage += proposition+"\n";
			}
			throw new UnknownPropositionException(errorMessage);
		}
	}
	
	/**
	 * Dummy for the TreeVisitor interface.
	 */
	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
	}

	/**
	 * Dummy for the TreeVisitor interface.
	 */
	public void visitLiteral(Literal literal) {
	}
	/**
	 * Dummy for the TreeVisitor interface.
	 */
	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
	}
	
	/**
	 * Assigns a proposition its (possibly context-dependant) value.
	 */
	public void visitProposition(PropositionNode proposition) {
		if(proposition.getPropositionKind() != PropositionKind.NAMED) {
			return;
		}
		if(!propositions.containsKey(proposition.getProposition())) {
			hasErrors = true;
			unknownPropositions.add(proposition.getProposition());
			return;
		}
		proposition.setValue(propositions.get(proposition.getProposition()));
	}

	/**
	 * Dummy for the TreeVisitor interface.
	 */
	public void visitPropositionalConnective(PropositionalConnective connective) {
	}
}
