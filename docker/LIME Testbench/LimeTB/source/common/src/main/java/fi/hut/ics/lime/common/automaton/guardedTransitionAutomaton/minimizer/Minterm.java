package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.minimizer;

/**
 * Represents the minterms used in the Quine-McCluskey algorithm in
 * {@link ExpressionMinimizer}. This class is considered a friend of
 * {@link ExpressionMinimizer} and as such reveals its member variables to it
 * (as package private).
 * 
 * @author osaariki
 */
class Minterm {
	int truePropositions;

	/**
	 * Constructs a new minterm with the given propositions marked true.
	 * 
	 * @param truePropositions
	 */
	Minterm(int truePropositions) {
		this.truePropositions = truePropositions;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Minterm)
			return ((Minterm) obj).truePropositions == truePropositions;
		return super.equals(obj);
	}

	@Override
	public int hashCode() {
		return truePropositions;
	}
}
