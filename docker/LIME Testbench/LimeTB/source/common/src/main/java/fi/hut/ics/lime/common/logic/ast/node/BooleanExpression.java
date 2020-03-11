package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * A base class for all AST boolean expression nodes (propositional and temporal). 
 * @author jalampin
 */
abstract public class BooleanExpression implements Cloneable, Comparable<BooleanExpression> {
	private String value;
	private boolean isPastTimeFormula, isFutureTimeFormula;
	private boolean truthValue;
	private BooleanExpression[] children;
	
	/**
	 * Construct a boolean expression with the given number of children.
	 * The number of children can later be overridden with
	 * <code>setNumChildren()</code> if desired.
	 * @param numChildren the number of children
	 */
	protected BooleanExpression(int numChildren) {
		children = new BooleanExpression[numChildren];
	}
	
	/**
	 * Get the number of children of this node.
	 * @return the number of children
	 */
	protected int getNumChildren() {
		return children.length;
	}
	
	/**
	 * Set the number of children of this node.
	 * @param n the number of children
	 */
	protected void setNumChildren(int n) {
		children = new BooleanExpression[n];
	}
	
	/**
	 * Accept a visit from a visitor.
	 * @author jalampin
	 */
	abstract public void accept(TreeVisitor visitor);

	/**
	 * Accept a visit from a modifier.
	 * @return the new (possibly modified) subtree
	 * @author jalampin
	 */
	abstract public BooleanExpression accept(AbstractTreeModifier modifier);
	
	/** 
	 * Check if this node is equal to another one.
	 * @author jalampin
	 * */
	abstract public boolean equals(BooleanExpression node);

	/**
	 * Set the nth child of a node (n starts from 1).
	 */
	public void setNth(int n, BooleanExpression node) {
		if (n < 1)
			throw new NodeOperationException("Child number "+n+", but children start from 1");
		else if (n > children.length)
			throw new NodeOperationException("Attempt to set child "+n+" for a node with "+
					"only "+children.length+" children.");
		children[n-1] = node;
	}
	
	/**
	 * Get the nth child of a node (n starts from 1).
	 */
	public BooleanExpression getNth(int n) {
		if (n < 1)
			throw new NodeOperationException("Child number "+n+", but children start from 1");
		else if (n > children.length)
			throw new NodeOperationException("Attempt to get child "+n+" for a node with "+
					"only "+children.length+" children.");
		return children[n-1];
	}
		
	/**
	 * @return the specification text 
	 */
	public String getValue() {
		return value;
	}
	
	/**
	 * @param value the specification text
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	/**
	 * @return true if this node represents a future time formula
	 */
	public boolean isFutureTimeFormula() {
		return isFutureTimeFormula;
	}
	
	/**
	 * @return true if this node represents a past time formula
	 */
	public boolean isPastTimeFormula() {
		return isPastTimeFormula;
	}
	
	/**
	 * @param isFutureTimeFormula whether this node represents a future time formula
	 */
	public void setFutureTimeFormula(boolean isFutureTimeFormula) {
		this.isFutureTimeFormula = isFutureTimeFormula;
	}

	/**
	 * @param isPastTimeFormula whether this node represents a past time formula
	 */
	public void setPastTimeFormula(boolean isPastTimeFormula) {
		this.isPastTimeFormula = isPastTimeFormula;
	}
	
	/**
	 * Get a clone of this node
	 */
	@Override
	public BooleanExpression clone() {
		BooleanExpression target;
		try {
			target = (BooleanExpression)super.clone();
		} catch (CloneNotSupportedException e) {
			throw new AssertionError(e);
		}
		target.children = new BooleanExpression[children.length];
		for (int i=0; i<children.length; i++)
			if (children[i] == null)
				target.children[i] = null;
			else
				target.children[i] = children[i].clone();
		return target;
	}

	/**
	 * Compare the specification texts.
	 */
	public int compareTo(BooleanExpression node) throws NullPointerException {
		return this.getValue().compareTo(node.getValue());
	}
	
	/**
	 * @return The (boolean) truth value for this node, if set
	 */
	public boolean getTruthValue() {
		return truthValue;
	}
	
	/**
	 * @param truthValue the (boolean) truth value for this node
	 */
	public void setTruthValue(boolean truthValue) {
		this.truthValue = truthValue;
	}
	
	/**
	 * Return true if the children (subtrees) of this node are equal to the
	 * children of the given boolean expression. 
	 * @param node the boolean expression to compare to
	 * @return true if the children of this and the other expression are equal
	 */
	protected boolean childrenEqual(BooleanExpression node) {
		if (children.length != node.children.length)
			return false;
		for (int i=0; i<children.length; i++)
			if (!children[i].equals(node.children[i]))
				return false;
		return true;
	}
	
	/**
	 * Visit all the children of this node with the given visitor.
	 * @param visitor the visitor to visit children with
	 */
	protected void visitChildren(TreeVisitor visitor) {
		for (BooleanExpression child : children)
			child.accept(visitor);
	}
	
	/**
	 * Traverse the subtree of this node in pre-order, possibly modifying the tree
	 * structure.
	 * @param modifier the visitor/modifier to use
	 * @return this node
	 */
	protected BooleanExpression preorderTraverse(AbstractTreeModifier modifier) {
		for (int i=0; i<children.length; i++)
			children[i] = children[i].accept(modifier);
		return this;
	}
	
	/**
	 * Traverse the subtree rooted at this node in post-order, possibly modifying
	 * the tree structure.
	 * @param modifier the modifier/visitor to use
	 */
	protected void postorderTraverse(AbstractTreeModifier modifier) {
		for (int i=0; i<children.length; i++)
			children[i] = children[i].accept(modifier);
	}

	
}
