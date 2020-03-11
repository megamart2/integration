package fi.hut.ics.lime.limec.aspect.generator;

import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.limec.aspect.components.CAspectMethod;
import fi.hut.ics.lime.limec.aspect.components.CInitializer;

/**
 * A generator for state update code for PtLTL formulas.
 * 
 * @author jalampin
 */
public class PtLtlCodeGenerator extends AbstractTreeVisitingCodeGenerator {
	private Boolean unsupportedFormulas;
	private	CInitializer initializer;
	
	/**
	 * Construct the generator and generate code for the PtLTL.
	 * 
	 * @param node the AST node to generate code for.
	 * @param initializer the constructor to add code to
	 * @param transitionMethod the transition method to add code to
	 * @throws AspectException on unsupported formulas
	 */
	PtLtlCodeGenerator(BooleanExpression node, CInitializer initializer, 
					CAspectMethod transitionMethod) throws AspectException {
		this.initializer = initializer;
		this.transitionMethod = transitionMethod;
		unsupportedFormulas = false;
		node.accept(this);
		if(unsupportedFormulas)
			throw new AspectException("specification contains unsupported formulas.");
	}
	
	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
	}

	public void visitLiteral(Literal literal) {
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		String nextValue = null;
		String initValue = null;
		String pre = formula.getPre();
		String now = formula.getNow();
		BooleanExpression first, second = null;
		
		first = formula.getNth(1);
		formula.setValue(now);

		if(formula.isBinaryOperator()) {
			second = formula.getNth(2);
		}
		
		switch(formula.getType()) {
		case END: 
			unsupportedFormulas = true;
			break;
		case HISTORICALLY:
			nextValue = first.getValue()+" && "+pre;
			initValue = "1";
			break;
		case INTERVAL:
			unsupportedFormulas = true;
			break;
		case ONCE: 
			nextValue = first.getValue()+" || "+pre;
			initValue = "0";
			break;
		case PREVIOUSLY:
			nextValue = pre;
			initValue = "0";
			break;
		case SINCE: 
			nextValue = second.getValue()+" || ("+first.getValue()+" && "+pre+")";
			initValue = "0";
			break;
		case START: 
			unsupportedFormulas = true;
			break;
		case TRIGGER:
			nextValue = second.getValue()+" && ("+first.getValue()+" || "+pre+")";
			initValue = "1";
			break;
		case WEAK_INTERVAL: 
			unsupportedFormulas = true;
			break;
		case WEAK_PREVIOUSLY: 
			nextValue = pre;
			initValue = "0";
			break;
		case WEAK_SINCE: 
			unsupportedFormulas = true;
			break;
		}
		if(unsupportedFormulas)
			return;
		
		initializer.addCode(pre+" = "+initValue+"; /* "+formula.getType().name()+" */\n");
		transitionMethod.addEnd(now+" = "+nextValue+"; /* "+formula.getType().name()+" */\n");
		if(formula.getType() != PastTimeTemporalOperatorType.PREVIOUSLY &&
				formula.getType() != PastTimeTemporalOperatorType.WEAK_PREVIOUSLY) {
			transitionMethod.addEnd(pre+" = "+now+";\n");
		}
		else {
			transitionMethod.addEnd(pre+" = "+first.getValue()+";\n");
		}
		
	}

	public void visitProposition(PropositionNode proposition) {
	}

}
