package fi.hut.ics.lime.aspectmonitor.lctsupport;

import java.util.HashSet;
import java.util.Set;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.visitors.TreeVisitorSupport;

/**
 * A {@link TreeVisitor} that collects a set of all the past time operators in an expression.
 * 
 * @author osaariki
 */
public class PTOperatorCollectingVisitor extends TreeVisitorSupport {

	private Set<PastTimeTemporalOperator> operators;

	/**
	 * Constructs a new instance.
	 */
	public PTOperatorCollectingVisitor() {
		operators = new HashSet<PastTimeTemporalOperator>();
	}

	@Override
	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		operators.add(formula);
	}

	/**
	 * @return the set of operators collected.
	 */
	public Set<PastTimeTemporalOperator> getOperators() {
		return operators;
	}
}
