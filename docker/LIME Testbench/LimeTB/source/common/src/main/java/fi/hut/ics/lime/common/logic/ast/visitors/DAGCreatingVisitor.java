package fi.hut.ics.lime.common.logic.ast.visitors;

import java.util.Hashtable;
import java.util.Map;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.LogicOperator;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
/**
 * This visitor combines nodes of equal value in a tree forming
 * a directed acyclic graph (DAG) from it.
 * @author jalampin
 *
 */
public class DAGCreatingVisitor implements TreeVisitor {
	private Map<String, BooleanExpression> nodeMap = new Hashtable<String, BooleanExpression>();
	
	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
		processOperand(formula);
	}

	public void visitLiteral(Literal literal) {
		literal.setValue(literal.toString());
		if(!nodeMap.containsKey(literal.getValue())) {
			nodeMap.put(literal.getValue(), literal);
		}
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		processOperand(formula);
	}

	public void visitProposition(PropositionNode proposition) {
		proposition.setValue(proposition.getProposition());
		if(!nodeMap.containsKey(proposition.getValue())) {
			nodeMap.put(proposition.getValue(), proposition);
		}
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
		processOperand(connective);
	}
	
	private void processOperand(LogicOperator operator) {	
		String firstValue = operator.getNth(1).getValue();
		String secondValue = null;
		
		if(!nodeMap.containsKey(operator.getValue())) {
			nodeMap.put(operator.getValue(), operator);
		}
		
		if(nodeMap.containsKey(firstValue)) {
			operator.setNth(1,nodeMap.get(firstValue));
		}
		if(!operator.isUnaryOperator()) {
			secondValue = operator.getNth(2).getValue();
			if(nodeMap.containsKey(secondValue)) {
				operator.setNth(2,nodeMap.get(secondValue));
			}
		}
	}
}
