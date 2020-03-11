package fi.hut.ics.lime.common.automaton;

import fi.hut.ics.lime.common.automaton.BricsAutomatonAdapter;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

/**
 * A mock implementation for BricsAutomatonAdapter. 
 * Use this only for testing purposes! 
 * @author jalampin
 *
 */
public class MockBricsAutomatonAdapter extends BricsAutomatonAdapter {
	public MockBricsAutomatonAdapter() {
		super();
	}
	
	@Override
	protected void generatePropositions() {
		// TODO Auto-generated method stub
	}
	
	public void setPropositions(PropositionNode[] propositions) {
		this.propositions = propositions;
	}
}
