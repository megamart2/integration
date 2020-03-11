package fi.hut.ics.lime.common.specification.visitors;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.sourcecode.Method;

/**
 * Replaces named propositions in the AST by their implementations.
 * @author jalampin
 */
public class NamedPropositionExpanderVisitor extends AbstractTreeModifier {
	private Map<String, PropositionNode> propositions; 
	private List<PropositionNode> undefined;
	private Specification specification;
	
	/**
	 * Construct a new PropositionVisitor.
	 * @param spec the specification to process
	 * @param propositions a map of proposition names to their implementations
	 */
	public NamedPropositionExpanderVisitor(Specification spec, Map<String, PropositionNode> propositions){
		super(ProcessingStrategy.POSTORDER);
		undefined = new LinkedList<PropositionNode>();
		this.propositions = propositions;
		this.specification = spec;
	}
	
	/**
	 * Visit a proposition node, replacing named propositions in the subtree with
	 * their definitions.
	 * @return the given proposition with named propositions replaced with their
	 * definitions
	 */
	@Override
	public BooleanExpression visitPropositionNode(PropositionNode node) {		
		if(propositions == null) {
			markMethods(node);
			return node;
		}
		if(node.getPropositionKind() == PropositionKind.NAMED) {
			PropositionNode prop = propositions.get(node.getProposition());
			if(prop == null) {
				undefined.add(node);
				return node;
			}
			markMethods(prop);
			return prop;
		}
		markMethods(node);
		return node;
	}

	/**
	 * Get a list of undefined but referenced named propositions.
	 * @return a list of proposition nodes
	 */
	public List<PropositionNode> getUndefined() {
		return undefined;
	}
	
	private void markMethods(PropositionNode node) {
		if(node.getPropositionKind() != PropositionKind.CALL) {
			return;
		}
		
		for (Method m : specification.getSourceType().getAllMethods()) {
			if(m.getSimpleName().equals(node.getProposition())) {
				specification.addEnforcedMethod(m);
			}
		}
	}
}
