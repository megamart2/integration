package fi.hut.ics.lime.isl_c.aspect.generator;

import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.specification.AbstractSpecification;

/**
 * A visitor (common for regexps and PLTLs) that generates state update code from
 * AST representation.
 * @author jalampin
 */
public abstract class AbstractTreeVisitingCodeGenerator extends
		AbstractCodeGenerator implements TreeVisitor {

	/**
	 * Constructor for an AbstractTreeVisitingCodeGenerator.
	 * 
	 * @param specification the specification to generate code for
	 * @param aspect the aspect in which the code is added
	 * @author jalampin
	 */
	protected AbstractTreeVisitingCodeGenerator(AbstractSpecification specification, Aspect aspect) {
		super(specification, aspect);
	}
	
	/** 
	 * An empty (no operation) constructor for the class. 
	 */
	protected AbstractTreeVisitingCodeGenerator() {
		
	}
	
	/**
	 * Visit a propositional connective.
	 * Generates a textual Java representation for the expression.
	 * This code is later embedded in the advice.
	 * 
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
