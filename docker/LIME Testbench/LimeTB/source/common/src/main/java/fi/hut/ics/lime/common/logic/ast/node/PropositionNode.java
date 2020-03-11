package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;

/**
 * AST node for all atomic propositions.
 * This includes named, call and value propositions.
 * @author jalampin
 */
public class PropositionNode extends BooleanExpression {
	private String proposition;
	private PropositionKind propositionKind;
	
	/**
	 * Construct a new proposition.
	 * @param proposition the name of the proposition
	 */
	public PropositionNode(String proposition) {
		super(0);
		this.proposition = proposition;
		this.propositionKind = PropositionKind.NAMED;
	}	
	
	public PropositionNode() {
		super(0);
	}
	
	/**
	 * Get the right hand side of the proposition definition.
	 * @return the right hand side of the proposition as a string
	 */
	public String getProposition() {
		return proposition;
	}

	/**
	 * Get the type of the proposition.
	 * @return the type of the proposition; named, call, value or exception
	 */
	public PropositionKind getPropositionKind() {
		return propositionKind;
	}

	/**
	 * Set the right hand side of the proposition definition.
	 * @param proposition the right hand side of the proposition definition
	 * as a string
	 */
	public void setProposition(String proposition) {
		this.proposition = proposition;
	}

	/**
	 * Set the type of the proposition.
	 * @param propositionKind the type of the proposition; named, call or value
	 */
	public void setPropositionKind(PropositionKind propositionKind) {
		this.propositionKind = propositionKind;
	}

	/**
	 * Return a human-readable representation of the proposition.
	 * @return a human-readable representation of the proposition
	 */
	@Override
	public String toString() {	
		return "["+this.propositionKind.name()+"]: "+this.proposition;
	}


	@Override
	public void accept(TreeVisitor visitor) {
		visitor.visitProposition(this);
	}
	
	@Override
	public BooleanExpression accept(AbstractTreeModifier modifier) {
		BooleanExpression node = modifier.visitPropositionNode(this);
		return node.preorderTraverse(modifier);
	}
	
	@Override
	public boolean equals(Object node) {
		PropositionNode other;
		
		if(node instanceof PropositionNode) {
			other = (PropositionNode) node;
			return this.proposition.equals(other.getProposition()) && 
					this.propositionKind == other.getPropositionKind();
		}
		return false;
	}

	@Override
	public boolean equals(BooleanExpression e) {
		return equals((Object) e);
	}
	
	@Override
	public int hashCode() {
		return proposition.hashCode();
	}
	
	@Override
	public PropositionNode clone() {
		return (PropositionNode)super.clone();
	}	
}
