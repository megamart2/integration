package fi.hut.ics.lime.common.specification;

import java.util.Hashtable;
import java.util.Map;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.visitors.PropositionPickingVisitor;

/**
 * A specification for PLTL formulas.
 * @author jalampin
 */
public class PltlSpecification extends AbstractSpecification {
	/**
	 * The AST tree for the PLTL formula.
	 */
	private BooleanExpression node;
	private int numberOfPastTimeOperators;
	private String pre, now;
	private Map<String, String> initValues;
	
	public PltlSpecification() {
		super();
		numberOfPastTimeOperators = 0;
		initValues = new Hashtable<String, String>();
	}
	
	/** Get the root node of the AST of this specification. */
	@Override
	public BooleanExpression getNode() {
		return node;
	}

	/** Get the number of past-time operators in the tree. */
	public int getNumberOfPastTimeOperators() {
		return numberOfPastTimeOperators;
	}

	/** Get the name of the variable containing the current value of this specification. */
	public String getNow() {
		return now;
	}

	/** Get the name of the variable containing the pre-value of this specification. */
	public String getPre() {
		return pre;
	}
	
	/**
	 * Set the root of the AST of this specification.
	 * @param node the new root
	 */
	@Override
	public void setNode(BooleanExpression node) {
		this.node = node;
	}

	/**
	 * Set the number of past time operators in the tree.
	 * @param numberOfPastTimeOperators the new number of past time operators
	 */
	public void setNumberOfPastTimeOperators(int numberOfPastTimeOperators) {
		this.numberOfPastTimeOperators = numberOfPastTimeOperators;
	}
	
	/**
	 * Set the name of this specification.
	 * @name the new name
	 */
	@Override
	public void setName(String name) {
		super.setName(name);
		pre = "pre"+name;
		now = "now"+name;
	}

	/** Set the initial value of a proposition in this specification.
	 * @param name the name of a proposition
	 * @param value the value of the proposition
	 */
	public void setInitValue(String name, String value) {
		initValues.put(name, value);
	}
	
	/**
	 * Get the initial values of the variables in this specification.
	 * @return map of names of variables to their initial values as Java code
	 */
	public Map<String, String> getInitValues() {
		return initValues;
	}

	/**
	 * Get a human-readable representation of this specification.
	 */
	@Override
	public String toString() {
		return "pltl "+super.toString();
	}

	public Map<PropositionNode, Integer> getPropositionValues() {
		return new PropositionPickingVisitor(getNode()).getPropositions();
	}
}
