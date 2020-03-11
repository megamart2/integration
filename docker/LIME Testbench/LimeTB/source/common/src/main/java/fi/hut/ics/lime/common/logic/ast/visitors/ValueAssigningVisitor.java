package fi.hut.ics.lime.common.logic.ast.visitors;

import java.util.Map;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * Visitor that assigns values to propositional formulas
 * such as guards of a GuardedTransitionAutomaton.
 * @author jalampin
 *
 */
public class ValueAssigningVisitor extends TreeVisitorSupport {
	private Map<PropositionNode, Integer> values;
	
	/**
	 * Assign values to propositional formulas according to 
	 * the mapping given as parameter. If a PropositionNode
	 * that appears in the expression does not have a value
	 * in the mapping, nothing is done to it.
	 * @param expression The expression to assign values to
	 * @param values The values to assign
	 */
	public ValueAssigningVisitor(BooleanExpression expression, Map<PropositionNode, Integer> values) {
		this.values = values;
		expression.accept(this);
	}

	@Override
	public void visitLiteral(Literal literal) {
		literal.setValue(literal.getTruthValue() ? "true" : "false");
	}

	@Override
	public void visitProposition(PropositionNode proposition) {
		Integer value = values.get(proposition);
		if(value != null) {
			proposition.setValue("p"+value);
		}
	}
	/**
	 * Visit a propositional connective.
	 * Generates a textual Java representation for the expression.
	 * This code is later embedded in the advice.
	 * @author jalampin
	 */
	@Override
	public void visitPropositionalConnective(PropositionalConnective connective) {
		String first, second = null;
		
		first = connective.getNth(1).getValue();
		if(!connective.isUnaryOperator())
			second = connective.getNth(2).getValue();
		
		switch(connective.getType()) {
		case AND: 
			connective.setValue("("+first+" && "+second+")");
			break;
		case EQUIVALENCE: 
			connective.setValue("("+first+" == "+second+")");
			break;
		case IMPLICATION: 
			connective.setValue("(!"+first+" || "+second+")");
			break;
		case NOT: 
			connective.setValue("(!"+first+")");
			break;
		case OR:
			connective.setValue("("+first+" || "+second+")");
			break;
		case XOR: 
			connective.setValue("("+first+" ^ "+second+")");
			break;
		}
	}
}
