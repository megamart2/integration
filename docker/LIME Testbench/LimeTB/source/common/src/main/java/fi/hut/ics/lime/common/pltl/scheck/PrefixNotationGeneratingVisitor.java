package fi.hut.ics.lime.common.pltl.scheck;

import fi.hut.ics.lime.common.logic.ast.TreeVisitor;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;

import java.util.Hashtable;
import java.util.Map;

/**
 * Generates prefix notation for SCheck from an AST.
 * @author jalampin
 */
public class PrefixNotationGeneratingVisitor implements TreeVisitor {
	private boolean hasIllegalFormulas;
	private Integer propositionNumber;
	private Hashtable<String, Integer> propositionNumbers;
	private BooleanExpression node;
	private Map<String, PropositionNode> propositions;
	
	/**
	 * Construct the visitor object and generate prefix notation for SCheck.
	 * @param node the AST tree to generate prefix notation for 
	 * @throws SCheckException on unsupported subformulas
	 */
	public PrefixNotationGeneratingVisitor(BooleanExpression node) throws SCheckException {
		hasIllegalFormulas = false;
		propositionNumber = 0;
		propositionNumbers = new Hashtable<String, Integer>();
		propositions = new Hashtable<String, PropositionNode>();
		this.node = node;
		node.accept(this);
		if(hasIllegalFormulas) {
			throw new SCheckException("The given formula had unsupported subformulas.");
		}
	}
	
	/**
	 * Get the SCheck-readable prefix notation.
	 * @return the SCheck-readable prefix notation
	 */
	public String getPrefixNotation() {
		return node.getValue();
	}
	
	/*
	public Hashtable<String, Integer> getPropositionNumbers() {
		return propositionNumbers;
	}
    */
	
	/**
	 * Get a map of proposition names to propositions.
	 * @return a map of proposition names to propositions
	 */
	public Map<String, PropositionNode> getPropositions() {
		return propositions;
	}

	public void visitFutureTimeTemporalFormula(FutureTimeTemporalOperator formula) {
		String first, second;
		second = "";
		first = formula.getNth(1).getValue();
		if(!formula.isUnaryOperator())
			second = formula.getNth(2).getValue();
		
		switch(formula.getType()) {
		case FINALLY      : formula.setValue("F "+first); break;
		case GLOBALLY     : formula.setValue("G "+first); break;
		case NEXT         : formula.setValue("X "+first); break;
		case RELEASE      : formula.setValue("V "+first+" "+second); break;
		case STRONG_UNTIL : formula.setValue("U "+first+" "+second); break;
		case WEAK_UNTIL   : formula.setValue("| G "+first+" U "+first+" "+second); break;
		}
	}

	public void visitLiteral(Literal literal) {
		literal.setValue(literal.getTruthValue() ? "t" : "f");
	}

	public void visitPastTimeTemporalFormula(PastTimeTemporalOperator formula) {
		String p = formula.getNow();
		String key;
		PropositionNode propositionNode = new PropositionNode(p);
		propositionNode.setPropositionKind(PropositionKind.VALUE);
		if(p == null) {
			hasIllegalFormulas = true;
			return;
		}
		if(!propositionNumbers.containsKey(p))
			propositionNumbers.put(p, propositionNumber++);
		key = "p"+propositionNumbers.get(p);
		formula.setValue(key);
		propositions.put(key, propositionNode);
	}

	public void visitProposition(PropositionNode proposition) {
		String p = "p"+propositionNumber++;
		proposition.setValue(p);
		propositions.put(p, proposition.clone());
	}

	public void visitPropositionalConnective(PropositionalConnective connective) {
		String first, second;
		second = "";
		first = connective.getNth(1).getValue();
		if(!connective.isUnaryOperator())
			second = connective.getNth(2).getValue();
		
		switch(connective.getType()) {
		case NOT         : connective.setValue("! "+first); break;
		case AND         : connective.setValue("& "+first+" "+second); break;
		case OR          : connective.setValue("| "+first+" "+second); break;
		case XOR         : connective.setValue("^ "+first+" "+second); break;
		case IMPLICATION : connective.setValue("i "+first+" "+second); break;
		case EQUIVALENCE : connective.setValue("e "+first+" "+second); break;
		}
	}
}
