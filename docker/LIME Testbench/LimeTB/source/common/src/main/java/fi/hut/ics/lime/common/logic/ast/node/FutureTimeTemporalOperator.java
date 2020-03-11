
package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * A node corresponding to a future time temporal operator in 
 * a formula.
 * @author jalampin
 *
 */
public class FutureTimeTemporalOperator extends LogicOperator {
	private final FutureTimeTemporalOperatorType type;
	
	/**
	 * Sets type of the formula.
	 * @param type
	 */
	public FutureTimeTemporalOperator(FutureTimeTemporalOperatorType type) {
		super(0);
		this.type = type;
		switch(type) {
		case FINALLY:
		case GLOBALLY:
		case NEXT:
			this.setNumChildren(1);
			break;
		case RELEASE:
		case STRONG_UNTIL:
		case WEAK_UNTIL:
			this.setNumChildren(2);
			break;
		default:
			throw new AssertionError("should not reach this code");
		}
	}

	/**
	 * @return type of the temporal operator.
	 */
	public FutureTimeTemporalOperatorType getType() {
		return type;
	}

	/**
	 * Accept a visit from a visitor. Implements post-order traversal.
	 */
	@Override
	public void accept(TreeVisitor visitor) {
		visitChildren(visitor);
		visitor.visitFutureTimeTemporalFormula(this);
	}
	
	@Override
	public BooleanExpression accept(AbstractTreeModifier modifier) {
		if(modifier.getProcessingStrategy() == ProcessingStrategy.PREORDER) {
			BooleanExpression node = modifier.visitFutureTimeTemporalFormula(this);
			return node.preorderTraverse(modifier);
		}
		if(modifier.getProcessingStrategy() == ProcessingStrategy.POSTORDER) {
			postorderTraverse(modifier);
			return modifier.visitFutureTimeTemporalFormula(this);
		}
		throw new NodeOperationException("Unknown processing strategy.");
	}

	/**
	 * A test for the equality of two formulas. Here equality means _exact_ structural
	 * equivalence of the two formulas.
	 */
	@Override
	public boolean equals(BooleanExpression node) {
		if(node instanceof FutureTimeTemporalOperator) {
			FutureTimeTemporalOperator other = (FutureTimeTemporalOperator) node;
			if(this.type != other.getType())
				return false;
			return childrenEqual(other);
		}
		return false;
	}
	
	/**
	 * Clones the node and its subnodes.
	 */
	@Override
	public FutureTimeTemporalOperator clone() {
		return (FutureTimeTemporalOperator)super.clone(); 
	}
}
