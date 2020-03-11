package fi.hut.ics.lime.common.specification;

import java.util.Hashtable;
import java.util.Map;

import fi.hut.ics.lime.common.automaton.BricsAutomatonAdapter;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

/**
 * A specification implementation for regexp and nfa specifications.
 * @author jalampin
 */
public class BricsAutomatonSpecification extends AbstractSpecification {
	private BricsAutomatonAdapter adapter;

	/**
	 * Get the BricsAutomatonAdapter associated with this specification.
	 * @return the BricsAutomatonAdapter associated with this specification
	 */
	public BricsAutomatonAdapter getAdapter() {
		return adapter;
	}

	/**
	 * Set the BricsAutomatonAdapter associated with this specification.
	 * @param adapter the BricsAutomatonAdapter associated with this specification
	 */
	public void setAdapter(BricsAutomatonAdapter adapter) {
		this.adapter = adapter;
	}

	@Override
	public String toString() {
		return "automaton "+super.toString();
	}

	public Map<PropositionNode, Integer> getPropositionValues() {
		PropositionNode[] pNodes = getAdapter().getPropositions();
		Map<PropositionNode, Integer> propositionsValues = new Hashtable<PropositionNode, Integer>();
		for(int i = 0; i < pNodes.length; i++)
			propositionsValues.put(pNodes[i], i);
		return propositionsValues;
	}
}
