package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.minimizer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dk.brics.automaton.Transition;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;
import fi.hut.ics.lime.common.logic.ast.visitors.TreeVisitorSupport;
import fi.hut.ics.lime.common.logic.ast.visitors.TruthValueVisitor;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;

/**
 * Implements the Quine-McCluskey algorithm for minimizing boolean expressions.
 * 
 * @author osaariki
 */
public class ExpressionMinimizer {

	/**
	 * Combines multiple transitions from the dk.brics.automaton library into
	 * one combined {@link BooleanExpression} transition guard.
	 * 
	 * @param propositions
	 *            the propositions used in the transition guards in the order
	 *            they were encoded for the dk.brics.automaton library.
	 * @param transitions
	 *            the transitions to create the guard for. These transitions
	 *            should have the same source and target state.
	 * @return a combined transition guard that is true when any of the input
	 *         transitions would have been true.
	 */
	public static BooleanExpression createCombinedGuard(
			PropositionNode[] propositions, Collection<Transition> transitions) {
		/*
		 * Generate the minterms from the transitions.
		 */
		Set<Minterm> minterms = new HashSet<Minterm>();
		for (Transition transition : transitions) {
			if (transition.getMax() >= (1 << propositions.length))
				throw new AssertionError(
						"Transition number out of proposition vector range.");
			for (int i = transition.getMin(); i <= transition.getMax(); ++i)
				minterms.add(new Minterm(i));
		}

		return minimizeFromMinterms(Arrays.asList(propositions), minterms);
	}

	public static BooleanExpression minimizeExpression(
			BooleanExpression expression) {
		/*
		 * Collect all the proposition nodes present in the expression. A map to
		 * lists is used because the expression can contain proposition nodes
		 * that are separate objects but represent the same proposition.
		 */
		final Map<String, List<PropositionNode>> propositionListsMap = new HashMap<String, List<PropositionNode>>();
		expression.accept(new TreeVisitorSupport() {
			@Override
			public void visitFutureTimeTemporalFormula(
					FutureTimeTemporalOperator formula) {
				throw new AssertionError("Can not handle future time formulas");
			}
			
			@Override
			public void visitPastTimeTemporalFormula(
					PastTimeTemporalOperator formula) {
				throw new AssertionError("Can not handle past time formulas");
			}

			@Override
			public void visitProposition(PropositionNode proposition) {
				List<PropositionNode> propositions;
				if (propositionListsMap.containsKey(proposition.getValue()))
					propositions = propositionListsMap.get(proposition
							.getValue());
				else {
					propositions = new LinkedList<PropositionNode>();
					propositionListsMap.put(proposition.getValue(),
							propositions);
				}
				propositions.add(proposition);
			}
		});

		/*
		 * If no propositions are found the expression is evaluated and a
		 * corresponding literal is returned.
		 */
		if (propositionListsMap.size() == 0) {
			TruthValueVisitor truthValueVisitor = new TruthValueVisitor();
			expression.accept(truthValueVisitor);
			return new Literal(expression.getTruthValue());
		}

		if (propositionListsMap.size() > 30)
			throw new IllegalArgumentException(
					"Can not handle more than 30 propositions due to ints being used in the "
							+ "bit represenation. Consider changing the algorithm to use longs.");

		/*
		 * This defines the order of the bit representation used in the
		 * minimization algorithm.
		 */
		List<List<PropositionNode>> propositionLists = new ArrayList<List<PropositionNode>>();
		List<PropositionNode> primaryPropositionsList = new LinkedList<PropositionNode>();
		for (List<PropositionNode> propositionList : propositionListsMap
				.values()) {
			propositionLists.add(propositionList);
			primaryPropositionsList.add(propositionList.get(0));
		}

		/*
		 * Evaluate the expression for all proposition truth combinations and
		 * generate minterms for true evaluations.
		 */
		Set<Minterm> minterms = new HashSet<Minterm>();
		TruthValueVisitor truthValueVisitor = new TruthValueVisitor();
		AllPropositionCombinations: for (int i = 0; i < (1 << primaryPropositionsList
				.size()); i++) {
			boolean oneCallPropositionTrue = false;
			for (int j = 0; j < primaryPropositionsList.size(); j++) {
				boolean propositionTruthValue = (i & (1 << j)) != 0;
				if (primaryPropositionsList.get(j).getPropositionKind() == PropositionKind.CALL
						&& propositionTruthValue)
					if (oneCallPropositionTrue)
						continue AllPropositionCombinations;
					else
						oneCallPropositionTrue = true;
				for (PropositionNode proposition : propositionLists.get(j))
					proposition.setTruthValue(propositionTruthValue);
			}
			expression.accept(truthValueVisitor);

			if (expression.getTruthValue())
				minterms.add(new Minterm(i));
		}

		return minimizeFromMinterms(primaryPropositionsList, minterms);
	}

	private static BooleanExpression minimizeFromMinterms(
			List<PropositionNode> propositions, Set<Minterm> minterms) {

		/*
		 * Create a bitmask containing the call type propositions.
		 */
		int callPropositions = 0;
		for (int i = 0; i < propositions.size(); ++i)
			if (propositions.get(i).getPropositionKind() == PropositionKind.CALL)
				callPropositions |= (1 << i);

		/*
		 * Create implicants from the minterms. Implicants that have a call
		 * proposition marked true will have the other call propositions marked
		 * as ones that don't matter.
		 */
		@SuppressWarnings("unchecked")
		Set<Implicant>[] implicantsByBitcount = new HashSet[propositions.size() + 1];
		for (int i = 0; i < implicantsByBitcount.length; ++i)
			implicantsByBitcount[i] = new HashSet<Implicant>();
		for (Minterm minterm : minterms) {
			Implicant implicant;
			int trueCallPropositions = minterm.truePropositions
					& callPropositions;
			if (trueCallPropositions != 0) {
				if (Integer.bitCount(trueCallPropositions) > 1)
					throw new IllegalArgumentException(
							"Encountered transition with multiple call propositions true.");
				implicant = new Implicant(minterm.truePropositions,
						(callPropositions ^ minterm.truePropositions)
								& callPropositions);
			} else
				implicant = new Implicant(minterm.truePropositions, 0);
			implicant.minterms.add(minterm);
			implicantsByBitcount[Integer.bitCount(implicant.truePropositions)]
					.add(implicant);
		}

		/*
		 * Iteratively combines all the implicants that will combine. Implicants
		 * that can not be combined any further are collected as prime
		 * implicants.
		 */
		List<Implicant> primeImplicants = new LinkedList<Implicant>();
		boolean someCombined;
		do {
			someCombined = false;
			@SuppressWarnings("unchecked")
			Set<Implicant>[] newImplicantsByBitcount = new HashSet[implicantsByBitcount.length];
			for (int i = 0; i < newImplicantsByBitcount.length; ++i)
				newImplicantsByBitcount[i] = new HashSet<Implicant>();

			for (int i = 0; i < implicantsByBitcount.length - 1; ++i)
				for (Implicant lowerBitcountImplicant : implicantsByBitcount[i])
					for (Implicant higherBitcountImplicant : implicantsByBitcount[i + 1]) {
						Implicant newImplicant = lowerBitcountImplicant
								.combine(higherBitcountImplicant);
						if (newImplicant != null) {
							someCombined = true;
							newImplicantsByBitcount[Integer
									.bitCount(newImplicant.truePropositions)]
									.add(newImplicant);
						}
					}

			for (Set<Implicant> implicants : implicantsByBitcount)
				for (Implicant implicant : implicants)
					if (implicant.isPrime)
						primeImplicants.add(implicant);

			implicantsByBitcount = newImplicantsByBitcount;
		} while (someCombined);

		/*
		 * Finds out which prime implicants are essential to covering the
		 * minterm set.
		 */
		Set<Implicant> implicantsToUse = new HashSet<Implicant>();
		AllMinterms: for (Minterm minterm : minterms) {
			Implicant essentialImplicant = null;
			for (Implicant implicant : primeImplicants)
				if (implicant.minterms.contains(minterm))
					if (essentialImplicant == null)
						essentialImplicant = implicant;
					else
						continue AllMinterms;
			implicantsToUse.add(essentialImplicant);
		}

		List<Minterm> mintermsNotCovered = new LinkedList<Minterm>();
		for (Minterm minterm : minterms) {
			boolean isInEssentialImplicant = false;
			for (Implicant implicant : implicantsToUse)
				if (implicant.minterms.contains(minterm)) {
					isInEssentialImplicant = true;
					break;
				}
			if (!isInEssentialImplicant)
				mintermsNotCovered.add(minterm);
		}

		/*
		 * Petrick's method is used to find the minimum prime implicants
		 * required to cover the minterms not covered by the essential prime
		 * implicants.
		 */
		if (mintermsNotCovered.size() > 0) {
			List<Implicant> nonEssentialImplicants = new LinkedList<Implicant>();
			for (Implicant implicant : primeImplicants)
				if (!implicantsToUse.contains(implicant))
					nonEssentialImplicants.add(implicant);

			/*
			 * Remove column dominations.
			 */
			for (int i = 0; i < nonEssentialImplicants.size(); ++i) {
				List<Implicant> newNonEssentialImplicants = new LinkedList<Implicant>();
				Implicant dominator = nonEssentialImplicants.remove(0);
				newNonEssentialImplicants.add(dominator);
				for (Implicant candidate : nonEssentialImplicants)
					if (!dominator.minterms.containsAll(candidate.minterms))
						newNonEssentialImplicants.add(candidate);
				nonEssentialImplicants = newNonEssentialImplicants;
			}

			/*
			 * Remove row dominations. TODO: The latter while loop seems a bit
			 * confusing and potentially dangerous. Find a better way to filter
			 * the minterms?
			 */
			Map<Minterm, Set<Implicant>> implicantsByMinterm = new HashMap<Minterm, Set<Implicant>>();
			for (Minterm minterm : mintermsNotCovered) {
				Set<Implicant> implicants = new HashSet<Implicant>();
				for (Implicant implicant : nonEssentialImplicants)
					if (implicant.minterms.contains(minterm))
						implicants.add(implicant);
				implicantsByMinterm.put(minterm, implicants);
			}
			List<Minterm> newMintermsNotCovered = new LinkedList<Minterm>();
			while (newMintermsNotCovered.size() < mintermsNotCovered.size()) {
				Minterm dominator = mintermsNotCovered.remove(0);
				boolean dominates = false;
				for (Minterm other : mintermsNotCovered)
					if (implicantsByMinterm.get(dominator).containsAll(
							implicantsByMinterm.get(other))) {
						dominates = true;
						break;
					}
				if (!dominates) {
					mintermsNotCovered.add(dominator);
					newMintermsNotCovered.add(dominator);
				}
			}

			/*
			 * Construct a product of sums of all the implicants containing each
			 * minterm.
			 */
			List<List<Set<Implicant>>> productOfSumsOfProducts = new LinkedList<List<Set<Implicant>>>();
			for (Minterm minterm : mintermsNotCovered) {
				List<Set<Implicant>> sumOfProducts = new LinkedList<Set<Implicant>>();
				for (Implicant implicant : nonEssentialImplicants)
					if (implicant.minterms.contains(minterm))
						sumOfProducts.add(Collections.singleton(implicant));
				productOfSumsOfProducts.add(sumOfProducts);
			}

			/*
			 * Use the distributive law to turn the expression into a sum of
			 * products.
			 */
			while (productOfSumsOfProducts.size() > 1) {
				List<Set<Implicant>> first = productOfSumsOfProducts.remove(0);
				List<Set<Implicant>> second = productOfSumsOfProducts.remove(0);
				List<Set<Implicant>> result = new LinkedList<Set<Implicant>>();
				for (Set<Implicant> productFromFirst : first)
					for (Set<Implicant> productFromSecond : second) {
						Set<Implicant> productOfProducts = new HashSet<Implicant>();
						productOfProducts.addAll(productFromFirst);
						productOfProducts.addAll(productFromSecond);
						result.add(productOfProducts);
					}
				productOfSumsOfProducts.add(0, result);
			}

			/*
			 * Collect the products with the least implicants.
			 */
			List<Set<Implicant>> smallestProducts = new LinkedList<Set<Implicant>>();
			int size = Integer.MAX_VALUE;
			for (Set<Implicant> product : productOfSumsOfProducts.get(0))
				if (product.size() < size) {
					smallestProducts.clear();
					size = product.size();
					smallestProducts.add(product);
				} else if (product.size() == size)
					smallestProducts.add(product);

			/*
			 * Select the product with the least significant propositions.
			 */
			Set<Implicant> productToUse = null;
			int maxPropositionsIgnored = -1;
			for (Set<Implicant> product : smallestProducts) {
				int numPropositionsIgnored = 0;
				for (Implicant implicant : product)
					numPropositionsIgnored += Integer
							.bitCount(implicant.doesntMatter);
				if (numPropositionsIgnored > maxPropositionsIgnored) {
					productToUse = product;
					maxPropositionsIgnored = numPropositionsIgnored;
				}
			}

			implicantsToUse.addAll(productToUse);
		}

		/*
		 * Generate the guard from the implicants selected.
		 */
		BooleanExpression guard = null;
		for (Implicant implicant : implicantsToUse) {
			BooleanExpression implicantExpression = null;
			if (Integer.bitCount(implicant.doesntMatter) == propositions.size())
				implicantExpression = new Literal(true);
			else
				for (int i = 0; i < propositions.size(); ++i) {
					BooleanExpression propositionExpression;
					if ((implicant.doesntMatter & (1 << i)) == 0) {
						if ((implicant.truePropositions & (1 << i)) != 0)
							propositionExpression = propositions.get(i).clone();
						else {
							propositionExpression = new PropositionalConnective(
									PropositionalConnectiveType.NOT);
							propositionExpression.setNth(1, propositions.get(i)
									.clone());
						}

						if (implicantExpression == null)
							implicantExpression = propositionExpression;
						else {
							PropositionalConnective and = new PropositionalConnective(
									PropositionalConnectiveType.AND);
							and.setNth(1, implicantExpression);
							and.setNth(2, propositionExpression);
							implicantExpression = and;
						}
					}
				}

			if (guard == null)
				guard = implicantExpression;
			else {
				PropositionalConnective or = new PropositionalConnective(
						PropositionalConnectiveType.OR);
				or.setNth(1, guard);
				or.setNth(2, implicantExpression);
				guard = or;
			}
		}

		/*
		 * If the guard is still null a literal false is returned. This happens
		 * only when no minterms are present.
		 */
		if (guard == null)
			guard = new Literal(false);

		return guard;
	}
}
