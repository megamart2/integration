package fi.hut.ics.lime.limec.aspect.generator;

import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.limec.aspect.ACCAspect;
import fi.hut.ics.lime.limec.aspect.components.CAspectMethod;

/**
 * A generator for state update code for PtLTL formulas.
 */
public class PtLtlCodeGenerator extends AbstractTreeVisitingCodeGenerator {
	private Boolean unsupportedFormulas;
	private	ACCAspect initializer;
	protected CAspectMethod transitionMethod;
	
	/**
	 * Construct the generator.
	 * 
	 * @param constructor the constructor to add code to
	 * @param transitionMethod the transition method to add code to
	 */
	PtLtlCodeGenerator(ACCAspect initializer, CAspectMethod transitionMethod) {
		this.initializer = initializer;
		this.transitionMethod = transitionMethod;
	}
	
	/**
	 * Generate code for the PtLTL
	 * 
	 * @param node the AST node to generate code for.
	 * @throws AspectException on unsupported formulas.
	 */
	public void processNodes(BooleanExpression node) throws AspectException {
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
		String rootpre = "lime_obs->"+pre;
		String rootnow = "lime_obs->"+now;
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
			nextValue = first.getValue()+" && "+rootpre;
			initValue = "1";
			break;
		case INTERVAL:
			unsupportedFormulas = true;
			break;
		case ONCE: 
			nextValue = first.getValue()+" || "+rootpre;
			initValue = "0";
			break;
		case PREVIOUSLY:
			nextValue = rootpre;
			initValue = "0";
			break;
		case SINCE: 
			nextValue = second.getValue()+" || ("+first.getValue()+" && "+rootpre+")";
			initValue = "0";
			break;
		case START: 
			unsupportedFormulas = true;
			break;
		case TRIGGER:
			nextValue = second.getValue()+" && ("+first.getValue()+" || "+rootpre+")";
			initValue = "1";
			break;
		case WEAK_INTERVAL: 
			unsupportedFormulas = true;
			break;
		case WEAK_PREVIOUSLY: 
			nextValue = rootpre;
			initValue = "0";
			break;
		case WEAK_SINCE: 
			unsupportedFormulas = true;
			break;
		}
		if(unsupportedFormulas)
			return;
		
		// TODO: this be ugly, fix this
		initializer.getPre(pre.substring(0, pre.length()-2)).setValue(initValue+"; /* "+formula.getType().name()+" */\n");
		transitionMethod.addEnd(rootnow+" = "+nextValue+"; /* "+formula.getType().name()+" */\n");
		if(formula.getType() != PastTimeTemporalOperatorType.PREVIOUSLY &&
				formula.getType() != PastTimeTemporalOperatorType.WEAK_PREVIOUSLY) {
			transitionMethod.addEnd(rootpre+" = "+rootnow+";\n");
		}
		else {
			transitionMethod.addEnd(rootpre+" = "+first.getValue()+";\n");
		}
		
	}

	public void visitProposition(PropositionNode proposition) {
		
	}

}
