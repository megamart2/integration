package fi.hut.ics.lime.common.specification.visitors;

import java.util.HashSet;
import java.util.Set;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.specification.PltlSpecification;
import fi.hut.ics.lime.common.specification.SpecificationException;

/**
 * Assigns values for the AST nodes of the past time formula.
 * Uses the Rosu-Havelund method. 
 * @author jalampin
 */
public class PastTimeFormulaVisitor implements TreeVisitor {
	private PltlSpecification specification;
	private int numberOfPastTimeFormulas;
	private boolean unsupportedFormulas = false;
	private HashSet<PastTimeTemporalOperator> seenPastTimeOperators = new HashSet<PastTimeTemporalOperator>();
	
	/**
	 * Construct and apply the visitor pattern, assigning the values for the AST nodes
	 * of the PtLTL.
	 * @param specification The specification to visit
	 * @throws SpecificationException on error
	 */
	public PastTimeFormulaVisitor(PltlSpecification specification) 
	throws SpecificationException {
		this.specification = specification;
		numberOfPastTimeFormulas = 0;
		specification.getNode().accept(this);
		specification.setNumberOfPastTimeOperators(numberOfPastTimeFormulas);
		if(unsupportedFormulas)
			throw new SpecificationException(specification.getName()+" contains unsupported formulas.");
	}
	
	public void visitFutureTimeTemporalFormula(
			FutureTimeTemporalOperator formula) {
	}

	public void visitLiteral(Literal literal) {
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		if (seenPastTimeOperators.add(formula)) {
			String initValue = "";
			formula.setPre(specification.getPre()+"["+numberOfPastTimeFormulas+"]");
			formula.setNow(specification.getNow()+"["+numberOfPastTimeFormulas+"]");
			numberOfPastTimeFormulas++;
			switch(formula.getType()) {
			case END: 
				unsupportedFormulas = true;
				break;
			case HISTORICALLY:
				initValue = "true";
				break;
			case INTERVAL:
				unsupportedFormulas = true;
				break;
			case ONCE:
				initValue = "false";
				break;
			case PREVIOUSLY: 
				initValue = "false";
				break;
			case SINCE:
				initValue = formula.getNth(2).toString();
				break;
			case START: 
				unsupportedFormulas = true;
				break;
			case TRIGGER:
				initValue = formula.getNth(2).toString();
				break;
			case WEAK_INTERVAL: 
				unsupportedFormulas = true;
				break;
			case WEAK_PREVIOUSLY: 
				initValue = "true";
				break;
			case WEAK_SINCE: 
				unsupportedFormulas = true;
				break;
			}
			if(!unsupportedFormulas)
				specification.setInitValue(formula.getPre(), initValue);
		}
	}

	public void visitProposition(PropositionNode proposition) {
	}
	
	public void visitPropositionalConnective(PropositionalConnective connective) {
	}

}
