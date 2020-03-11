package fi.hut.ics.lime.common.logic.ast.node;
import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;

/**
 * AST node that implements past time temporal operators.
 * @author jalampin
 */
public class PastTimeTemporalOperator extends LogicOperator {
	private PastTimeTemporalOperatorType type;
	// pre = yesterday
	private String pre, now;
	
	/**
	 * Get the now value of the proposition rooted in this operator.
	 * @return the now value of this operator, as string
	 */
	public String getNow() {
		return now;
	}

	/**
	 * Get the pre-value of the proposition rooted in this operator.
	 * @return the pre-value of this operator, as string
	 */
	public String getPre() {
		return pre;
	}

	/**
	 * Set the now value of the proposition rooted in this operator.
	 * @param now the new now value, as string
	 */
	public void setNow(String now) {
		this.now = now;
	}

	/**
	 * Set the pre-value of the proposition rooted in this operator.
	 * @param pre the new pre-value, as string
	 */
	public void setPre(String pre) {
		this.pre = pre;
	}

	/**
	 * Construct a new PastTimeTemporalOperator.
	 * @param type the type of this operator; one of the PtLTL temporal operators.
	 */
	public PastTimeTemporalOperator(PastTimeTemporalOperatorType type) {
		super(0);
		this.type = type;
		switch(type) {
		case END:
		case START:
		case HISTORICALLY:
		case ONCE:
		case WEAK_PREVIOUSLY:
		case PREVIOUSLY:
			setNumChildren(1);
			break;
		case WEAK_INTERVAL:
		case INTERVAL:
		case WEAK_SINCE:
		case SINCE:
		case TRIGGER:
			setNumChildren(2);
			break;
		default:
			throw new AssertionError("should not reach this code");
		}
	}
	
	/**
	 * Get the type of this operator.
	 * @return the type of this operator; one of the PtLTL temporal operators.
	 */
	public PastTimeTemporalOperatorType getType() {
		return type;
	}
	
	@Override
	public void accept(TreeVisitor visitor) {
		visitChildren(visitor);
		visitor.visitPastTimeTemporalFormula(this);
	}
	
	@Override
	public boolean equals(BooleanExpression node) { 
		if(node instanceof PastTimeTemporalOperator) {
			PastTimeTemporalOperator other = (PastTimeTemporalOperator)node;
			if (this.type != other.type)
				return false;
			return childrenEqual(node);
		} else
			return false;
	}
	
	@Override
	public PastTimeTemporalOperator clone() {
		return (PastTimeTemporalOperator)super.clone();
	}

	@Override
	public BooleanExpression accept(AbstractTreeModifier modifier) {
		if(modifier.getProcessingStrategy() == ProcessingStrategy.PREORDER) {
			BooleanExpression node = modifier.visitPastTimeTemporalFormula(this);
			return node.preorderTraverse(modifier);
		}
		if(modifier.getProcessingStrategy() == ProcessingStrategy.POSTORDER) {
			postorderTraverse(modifier);
			return modifier.visitPastTimeTemporalFormula(this);
		}
		throw new NodeOperationException("Unknown processing strategy.");
	}
}
