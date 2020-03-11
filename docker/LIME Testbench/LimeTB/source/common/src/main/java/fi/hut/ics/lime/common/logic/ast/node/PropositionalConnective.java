package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * An AST node for propositional operators.
 * @author jalampin
 */
public class PropositionalConnective extends LogicOperator {
	private PropositionalConnectiveType type;

	/**
	 * Construct a new propositional connective.
	 * @param type the type of the connective
	 */
	public PropositionalConnective(PropositionalConnectiveType type) {
		super(0);
		this.type = type;
		if (type == PropositionalConnectiveType.NOT)
			this.setNumChildren(1);
		else
			this.setNumChildren(2);
	}
	
	/**
	 * Construct a propositional connective with a single child.
	 * @param type the type of this propositional connective
	 * @param child the child
	 */
	public PropositionalConnective(PropositionalConnectiveType type,
			BooleanExpression child) {
		this(type);
		if (this.getNumChildren() != 1)
			throw new NodeOperationException("Wrong number of children.");
		this.setNth(1,child);
	}
	
	/**
	 * Construct a propositional connective with two children.
	 * @param type the type of this propositional connective
	 * @param left the left child
	 * @param right the right child
	 */
	public PropositionalConnective(PropositionalConnectiveType type,
			BooleanExpression left, BooleanExpression right) {
		this(type);
		if (this.getNumChildren() != 2)
			throw new NodeOperationException("Wrong number of children.");
		this.setNth(1, left);
		this.setNth(2, right);
	}
	
	@Override
	public void accept(TreeVisitor visitor) {
		visitChildren(visitor);
		visitor.visitPropositionalConnective(this);
	}
	
	/**
	 * Get the type of this propositional connective.
	 * @return the type of this propositional connective; NOT, AND, OR, XOR etc.
	 */
	public PropositionalConnectiveType getType() {
		return type;
	}
	
	@Override
	public boolean equals(BooleanExpression node) {
		if(node instanceof PropositionalConnective) {
			PropositionalConnective other = (PropositionalConnective)node;
			if (this.type != other.type)
				return false;
			return childrenEqual(node);			
		}
		else
			return false;
	}
	
	@Override
	public PropositionalConnective clone() {
		return (PropositionalConnective)super.clone();
	}
	
	@Override
	public BooleanExpression accept(AbstractTreeModifier modifier) {
		if(modifier.getProcessingStrategy() == ProcessingStrategy.PREORDER) {
			BooleanExpression node = modifier.visitPropositionalConnective(this);
			return node.preorderTraverse(modifier);
		}
		if(modifier.getProcessingStrategy() == ProcessingStrategy.POSTORDER) {
			postorderTraverse(modifier);
			return modifier.visitPropositionalConnective(this);
		}
		throw new NodeOperationException("Unknown processing strategy.");
	}	
}
