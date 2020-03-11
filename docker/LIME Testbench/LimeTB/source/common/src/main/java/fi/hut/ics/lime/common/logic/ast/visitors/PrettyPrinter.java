package fi.hut.ics.lime.common.logic.ast.visitors;
import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.*;
/**
 * A basic pretty printer visitor for temporal formulas.
 * @author jalampin
 *
 */
public class PrettyPrinter implements TreeVisitor {
	private String prettyPrint;
	
	/**
	 * Construct a pretty printer for an AST tree.
	 * @param node the AST node (subtree) to pretty print
	 */
	public PrettyPrinter(BooleanExpression node) {
		node.accept(this);
		prettyPrint = node.getValue();
	}
	
	/**
	 * Get the pretty-printed AST tree.
	 * @return the pretty-printed AST tree 
	 */
	public String getPrettyPrint() {
		return prettyPrint;
	}


	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
		String first, second;
		second = "";
		first = formula.getNth(1).getValue();
		if(!formula.isUnaryOperator())
			second = formula.getNth(2).getValue();
		
		switch(formula.getType()) {
		case FINALLY      : formula.setValue("(F "+first+")"); break;
		case GLOBALLY     : formula.setValue("(G "+first+")"); break;
		case NEXT         : formula.setValue("(X "+first+")"); break;
		case RELEASE      : formula.setValue("("+first+" V "+second+")"); break;
		case STRONG_UNTIL : formula.setValue("("+first+" U "+second+")"); break;
		case WEAK_UNTIL   : formula.setValue("("+first+" Uw "+second+")"); break;
		}
	}

	public void visitLiteral(Literal literal) {
		literal.setValue(literal.getTruthValue() ? "true" : "false");
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		String first, second;
		second = "";
		first = formula.getNth(1).getValue();
		if(!formula.isUnaryOperator())
			second = formula.getNth(2).getValue();
		
		switch(formula.getType()) {
		case ONCE            : formula.setValue("(O "+first+")"); break;
		case HISTORICALLY    : formula.setValue("(H "+first+")"); break;
		case PREVIOUSLY      : formula.setValue("(Y "+first+")"); break;
		case WEAK_PREVIOUSLY : formula.setValue("(Z "+first+")"); break;
		case START           : formula.setValue("(start "+first+")"); break;
		case END             : formula.setValue("(end "+first+")"); break;
		case TRIGGER         : formula.setValue("("+first+" T "+second+")"); break;
		case SINCE    : formula.setValue("("+first+" S "+second+")"); break;
		case WEAK_SINCE      : formula.setValue("("+first+" Sw "+second+")"); break;
		case WEAK_INTERVAL   : formula.setValue("["+first+", "+second+")w"); break;
		case INTERVAL : formula.setValue("["+first+", "+second+")s"); break;
		}
	}

	public void visitProposition(PropositionNode proposition) {
		proposition.setValue("(["+proposition.getPropositionKind().name()+"]:"+proposition.getProposition()+")");
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
		String first, second;
		second = "";
		first = connective.getNth(1).getValue();
		if(!connective.isUnaryOperator())
			second = connective.getNth(2).getValue();
		
		switch(connective.getType()) {
		case NOT         : connective.setValue("(! "+first+")"); break;
		case AND         : connective.setValue("("+first+" && "+second+")"); break;
		case OR          : connective.setValue("("+first+" || "+second+")"); break;
		case XOR         : connective.setValue("("+first+" ++ "+second+")"); break;
		case IMPLICATION : connective.setValue("("+first+" -> "+second+")"); break;
		case EQUIVALENCE : connective.setValue("("+first+" <-> "+second+")"); break;
		}
	}
}
