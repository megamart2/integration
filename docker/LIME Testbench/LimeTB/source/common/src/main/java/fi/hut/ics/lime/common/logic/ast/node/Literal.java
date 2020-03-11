package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * A true or false literal for ASTs.
 * @author jalampin
 */
public class Literal extends BooleanExpression {
	/**
	 * Construct a new literal.
	 * @param value the value of the literal
	 */
	public Literal(boolean value) {
		super(0);
		super.setTruthValue(value);
	}
	
	@Override
	public void setTruthValue(boolean truthValue) {
		throw new UnsupportedOperationException(
				"Can not change truth values of literals after construction.");
	}

	@Override
	public void accept(TreeVisitor visitor) {
		visitor.visitLiteral(this);
	}
	
	@Override
	public BooleanExpression accept(AbstractTreeModifier modifier) {
		BooleanExpression node = modifier.visitLiteral(this);

		if(modifier.getProcessingStrategy() == ProcessingStrategy.PREORDER) {
			return node.preorderTraverse(modifier);
		}
		if(modifier.getProcessingStrategy() == ProcessingStrategy.POSTORDER) {
			return node;
		}
		throw new NodeOperationException("Unknown processing strategy.");
	}	

	/**
	 * Return a human readable representation of the literal.
	 */
	@Override
	public String toString() {
		return (getTruthValue() ? "Literal(true)" : "Literal(false)");
	}

	@Override
	public boolean equals(BooleanExpression node) {
		if(node instanceof Literal) {
			return getTruthValue() == node.getTruthValue();
		}
		return false;
	}
	
	/**
	 * Create a clone of this literal
	 */
	@Override
	public Literal clone() {
		return (Literal)super.clone();
	}
}
