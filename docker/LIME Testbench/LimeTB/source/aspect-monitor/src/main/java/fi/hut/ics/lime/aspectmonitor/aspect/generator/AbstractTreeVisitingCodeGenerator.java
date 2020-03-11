package fi.hut.ics.lime.aspectmonitor.aspect.generator;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;

/**
 * A visitor (common for regexps and PLTLs) that generates state update code from
 * AST representation.
 * @author jalampin
 */
public abstract class AbstractTreeVisitingCodeGenerator implements TreeVisitor {
	
	/**
	 * Visit a propositional connective.
	 * Generates a textual Java representation for the expression.
	 * This code is later embedded in the advice.
	 * @author jalampin
	 */
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
			connective.setValue("(!("+first+") || "+second+")");
			break;
		case NOT: 
			connective.setValue("(!("+first+"))");
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
