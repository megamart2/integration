package fi.hut.ics.lime.common.logic.ast.node;

import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * An abstract base class for logic operators in the AST.
 * This includes both primitive propositional operators and
 * temporal logic operators.
 * @author jalampin
 */
public abstract class LogicOperator extends BooleanExpression {
	/**
	 * Construct a new LogicOperator with the given number of children.
	 * The number of children can later be overridden with
	 * <code>setNumChildren()</code> if desired.
	 * @param numChildren the number of children
	 */
	protected LogicOperator(int numChildren) {
		super(numChildren);
	}
	
	/**
	 * @return true if this is a binary operator.
	 */
	public boolean isBinaryOperator() {
		return getNumChildren() == 2;
	}
	
	/**
	 * @return true if this is a unary operator.
	 */
	public boolean isUnaryOperator() {
		return getNumChildren() == 1;
	}
	
	@Override
	abstract public void accept(TreeVisitor visitor);
	
	@Override
	abstract public BooleanExpression accept(AbstractTreeModifier modifier);
}
