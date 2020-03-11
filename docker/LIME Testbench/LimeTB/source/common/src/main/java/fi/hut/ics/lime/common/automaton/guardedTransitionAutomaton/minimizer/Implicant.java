package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.minimizer;

import java.util.HashSet;

/**
 * Represents the implicants used in the Quine-McCluskey algorithm in
 * {@link ExpressionMinimizer}. This class is considered a friend of
 * {@link ExpressionMinimizer} and as such reveals its member variables to it
 * (as package private).
 * 
 * @author osaariki
 */
class Implicant {
	int truePropositions;
	int doesntMatter;
	boolean isPrime;
	HashSet<Minterm> minterms;

	/**
	 * (truePropositions & doesntMatter) must always be zero (must not overlap).
	 * 
	 * @param truePropositions
	 *            the true proposition bits.
	 * @param doesntMatter
	 *            the bits of the propositions that don't matter.
	 */
	Implicant(int truePropositions, int doesntMatter) {
		this.truePropositions = truePropositions;
		this.doesntMatter = doesntMatter;
		isPrime = true;
		minterms = new HashSet<Minterm>();
	}

	/**
	 * Tries to combine this implicant with the given implicant. Combining
	 * implicants is only possible when they have the same propositions marked
	 * as ones that don't matter and their true propositions differ by exactly
	 * one.
	 * 
	 * @param other
	 *            the implicant to combine this implicant with.
	 * @return the new implicant or <code>null</code> if the combination was not
	 *         possible.
	 */
	Implicant combine(Implicant other) {
		int differentPropositions;
		if ((doesntMatter == other.doesntMatter)
				&& (Integer
						.bitCount(differentPropositions = (truePropositions ^ other.truePropositions)) == 1)) {
			int newDoesntMatter = differentPropositions | doesntMatter;
			Implicant implicant = new Implicant(truePropositions
					& ~newDoesntMatter, newDoesntMatter);
			implicant.minterms.addAll(this.minterms);
			implicant.minterms.addAll(other.minterms);

			this.isPrime = false;
			other.isPrime = false;

			return implicant;
		} else
			return null;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Implicant) {
			Implicant other = (Implicant) obj;
			if (this.truePropositions == other.truePropositions
					&& this.doesntMatter == other.doesntMatter
					&& this.isPrime == other.isPrime
					&& this.minterms.containsAll(other.minterms)
					&& other.minterms.containsAll(this.minterms))
				return true;
		}
		return super.equals(obj);
	}

	@Override
	public int hashCode() {
		int hashCode = truePropositions + doesntMatter + (isPrime ? 1 : 0);
		for (Minterm minterm : minterms)
			hashCode += minterm.hashCode();
		return hashCode;
	}
}
