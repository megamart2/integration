package fi.hut.ics.lime.common.logic.ast.visitors;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * A class that takes an AST tree for a propositional formula and
 * converts it into DNF (Disjunctive Normal Form).
 * @author jalampin
 */
public class TruthValueVisitor extends TreeVisitorSupport {
	@Override
	public void visitPropositionalConnective(PropositionalConnective connective) {
		BooleanExpression first, second = null;
		first = connective.getNth(1);
		
		if(connective.isBinaryOperator()) {
			second = connective.getNth(2);
		}
		
		switch(connective.getType()) {
		case AND:
			connective.setTruthValue(first.getTruthValue() && second.getTruthValue());
			break;
		case EQUIVALENCE:
			connective.setTruthValue(first.getTruthValue() == second.getTruthValue());
			break;
		case IMPLICATION:
			connective.setTruthValue(!first.getTruthValue() || second.getTruthValue());
			break;
		case NOT:
			connective.setTruthValue(!first.getTruthValue());
			break;
		case OR:
			connective.setTruthValue(first.getTruthValue() || second.getTruthValue());
			break;
		case XOR:
			connective.setTruthValue(first.getTruthValue() != second.getTruthValue());
			break;
		}
	}
}
