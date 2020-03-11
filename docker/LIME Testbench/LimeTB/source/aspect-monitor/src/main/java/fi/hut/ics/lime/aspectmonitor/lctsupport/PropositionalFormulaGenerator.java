package fi.hut.ics.lime.aspectmonitor.lctsupport;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Conjunction;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Constant;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Disjunction;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Equivalence;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.ExclusiveDisjunction;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Formula;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Implication;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Negation;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.PTOperatorProposition;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Proposition;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.LogicOperator;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;

/**
 * This class is used to convert the abstract syntax tree of the automaton transition guards and past time formulas into
 * a tree structure that supports easy evaluation of it's truth value for different truth value assignments to
 * propositions.
 * 
 * @author osaariki
 */
public class PropositionalFormulaGenerator {

	private Map<String, PTOperatorProposition> ptPropositions;
	private Map<String, Proposition> callPropositions;
	private Map<String, Proposition> otherPropositions;

	/**
	 * Constructs a new instance with the given past time operator propositions, which must contain propositions for all
	 * past time operators that will be encountered.
	 * 
	 * @param ptPropositions
	 *            the past time operator propositions to use.
	 */
	public PropositionalFormulaGenerator(Collection<PTOperatorProposition> ptPropositions) {
		this.ptPropositions = new HashMap<String, PTOperatorProposition>();
		/*
		 * Create a mapping from the "now" values of the operators to the propositions. PropositionNode instances in
		 * automaton transition guards have a value corresponding to this "now" name.
		 */
		for (PTOperatorProposition proposition : ptPropositions)
			this.ptPropositions.put(proposition.getOperator().getNow(), proposition);
		callPropositions = new HashMap<String, Proposition>();
		otherPropositions = new HashMap<String, Proposition>();
	}

	/**
	 * Converts a {@link BooleanExpression} tree to a {@link Formula} based one. New proposition encountered will be
	 * stored and can be later retrieved with their getter methods.
	 * 
	 * @param expression
	 *            the expression to convert.
	 * @return the converted formula.
	 */
	public Formula processExpression(BooleanExpression expression) {
		/*
		 * Process the expression based on its runtime class and possibly recurse through its children.
		 */
		if (expression instanceof Literal)
			return new Constant(expression.getTruthValue());
		else if (expression instanceof PropositionNode) {
			PropositionNode propositionNode = (PropositionNode) expression;
			String propositionName = propositionNode.getValue();

			if (ptPropositions.containsKey(propositionName))
				return ptPropositions.get(propositionName);
			else if (otherPropositions.containsKey(propositionName))
				return otherPropositions.get(propositionName);
			else if (callPropositions.containsKey(propositionName))
				return callPropositions.get(propositionName);
			else {
				Proposition proposition = new Proposition();
				if (propositionNode.getPropositionKind() == PropositionKind.CALL)
					callPropositions.put(propositionName, proposition);
				else
					otherPropositions.put(propositionName, proposition);
				return proposition;
			}
		} else if (expression instanceof PropositionalConnective) {
			PropositionalConnective connective = (PropositionalConnective) expression;

			Formula first = processExpression(connective.getNth(1));
			Formula second = null;
			if (connective.isBinaryOperator())
				second = processExpression(connective.getNth(2));

			switch (connective.getType()) {
			case NOT:
				return new Negation(first);
			case AND:
				return new Conjunction(first, second);
			case EQUIVALENCE:
				return new Equivalence(first, second);
			case IMPLICATION:
				return new Implication(first, second);
			case OR:
				return new Disjunction(first, second);
			case XOR:
				return new ExclusiveDisjunction(first, second);
			default:
				throw new IllegalArgumentException("Unsupported connective type: " + connective.getType());
			}
		} else if (expression instanceof PastTimeTemporalOperator)
			return ptPropositions.get(((PastTimeTemporalOperator) expression).getNow());
		else
			throw new IllegalArgumentException("Unsupported BooleanExpression subclass: "
					+ expression.getClass().getCanonicalName());
	}

	/**
	 * Calculates the distance of past time operators from the given expression and updates this value to the
	 * corresponding proposition. The distance is equal to how many past time operators lie on the path from the root to
	 * the operator in question or in other words only past time operators increase the distance.
	 * 
	 * @param expression
	 *            the expression to update for.
	 */
	public void updateDistancesFromAutomaton(BooleanExpression expression) {
		updateDistancesFromAutomaton(expression, 0);
	}

	/*
	 * Helper method for hiding the recursion parameter from the public API.
	 */
	private void updateDistancesFromAutomaton(BooleanExpression expression, int distance) {
		int nextDistance = distance;
		if (expression instanceof PropositionNode) {
			PropositionNode proposition = (PropositionNode) expression;
			if (ptPropositions.containsKey(proposition.getValue()))
				expression = ptPropositions.get(proposition.getValue()).getOperator();
		}
		if (expression instanceof PastTimeTemporalOperator) {
			ptPropositions.get(((PastTimeTemporalOperator) expression).getNow()).updateDistanceFromAutomaton(distance);
			++nextDistance;
		}
		if (expression instanceof LogicOperator) {
			LogicOperator operator = (LogicOperator) expression;
			updateDistancesFromAutomaton(operator.getNth(1), nextDistance);
			if (operator.isBinaryOperator())
				updateDistancesFromAutomaton(operator.getNth(2), nextDistance);
		}
	}

	/**
	 * Creates update rules for all the past time propositions given upon construction of this instance.
	 */
	public void createUpdateRules() {
		for (PTOperatorProposition ptProposition : ptPropositions.values()) {
			PastTimeTemporalOperator ptOperator = ptProposition.getOperator();

			BooleanExpression first = ptOperator.getNth(1);

			BooleanExpression second = null;
			if (ptOperator.isBinaryOperator())
				second = ptOperator.getNth(2);

			Formula preUpdateRule, postUpdateRule;
			switch (ptOperator.getType()) {
			case HISTORICALLY:
				preUpdateRule = new Conjunction(processExpression(first), ptProposition);
				postUpdateRule = ptProposition;
				break;
			case ONCE:
				preUpdateRule = new Disjunction(processExpression(first), ptProposition);
				postUpdateRule = ptProposition;
				break;
			case PREVIOUSLY:
				preUpdateRule = ptProposition;
				postUpdateRule = processExpression(first);
				break;
			case SINCE:
				preUpdateRule = new Disjunction(processExpression(second), new Conjunction(processExpression(first),
						ptProposition));
				postUpdateRule = ptProposition;
				break;
			case TRIGGER:
				preUpdateRule = new Conjunction(processExpression(second), new Disjunction(processExpression(first),
						ptProposition));
				postUpdateRule = ptProposition;
				break;
			case WEAK_PREVIOUSLY:
				preUpdateRule = ptProposition;
				postUpdateRule = processExpression(first);
				break;
			default:
				throw new IllegalArgumentException("Unsupported past time temporal operator: " + ptOperator.getType());
			}

			ptProposition.setPreUpdateRule(preUpdateRule);
			ptProposition.setPostUpdateRule(postUpdateRule);
		}
	}

	/**
	 * @return all the call propositions encountered in the processed expressions.
	 */
	public Collection<Proposition> getCallPropositions() {
		return callPropositions.values();
	}

	/**
	 * @return all the propositions other than "call" type ones encountered in the processed expressions.
	 */
	public Collection<Proposition> getOtherPropositions() {
		return otherPropositions.values();
	}
}
