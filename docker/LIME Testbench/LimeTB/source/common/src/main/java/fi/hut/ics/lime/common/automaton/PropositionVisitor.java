package fi.hut.ics.lime.common.automaton;

import java.util.LinkedList;
import java.util.List;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;

/**
 * Builds an array of atomic propositions for DNF conversion and merges
 * identical propositions. The DNF conversion itself is done in TruthValueVisitor. 
 * @author jalampin
 */
public class PropositionVisitor extends AbstractTreeModifier {
	private List<PropositionNode> propositions;

	PropositionVisitor() {
		super(ProcessingStrategy.PREORDER);
		propositions = new LinkedList<PropositionNode>();
	}
	
	/**
	 * Traverse the given boolean expression. Builds an array of atomic propositions.
	 * @param expr the expression to traverse
	 */
	BooleanExpression traverse(BooleanExpression expr) {
		return expr.accept(this);
	}
	
	/**
	 * Get the list of atomic propositions in the expressions previously traversed.
	 */
	List<PropositionNode> getPropositions() {
		return propositions;
	}
	
	/**
	 * Visit method for a proposition node.
	 * If the proposition node (subtree) is not currently known to this class,
	 * it is recorded. Otherwise it is mapped to the previously known node.
	 * @param propositionNode the node to visit. 
	 * @return a proposition node (subtree) 
	 */
	@Override
	public BooleanExpression visitPropositionNode(PropositionNode propositionNode) {
		return getNode(propositionNode);
	}
	
	private PropositionNode getNode(PropositionNode node) {
		for (PropositionNode propositionNode : propositions) {
			if(node.equals(propositionNode)) {
				return propositionNode;
			}
		}
		propositions.add(node);
		return node;
	}
}
