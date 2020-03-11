package fi.hut.ics.lime.common.logic.ast.visitors;

import java.util.Hashtable;
import java.util.Map;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

/**
 * Visitor that assigns a number for each proposition in a
 * BooleanExpression and represents the assignment as a mapping.
 * @author jalampin
 *
 */
public class PropositionPickingVisitor extends TreeVisitorSupport {
	private Map<PropositionNode, Integer> propositions;
	private int i;
	
	/**
	 * Constructor that creates to assignment for BooleanExpression
	 * given as parameter.
	 * @param booleanExpression to assign numbers to
	 */
	public PropositionPickingVisitor(BooleanExpression booleanExpression) {
		propositions = new Hashtable<PropositionNode, Integer>();
		i = 0;
		booleanExpression.accept(this);
	}
	
	/**
	 * Visitor method that assigns the value.
	 */
	@Override
	public void visitProposition(PropositionNode proposition) {
		Integer integer = propositions.get(proposition);
		if(integer == null) {
			propositions.put(proposition, i++);
		} 
	}
	
	/**
	 * Getter for proposition assignment
	 * @return propositions and their corresponding numbers as
	 * a mapping
	 */
	public Map<PropositionNode, Integer> getPropositions() {
		return propositions;
	}
}
