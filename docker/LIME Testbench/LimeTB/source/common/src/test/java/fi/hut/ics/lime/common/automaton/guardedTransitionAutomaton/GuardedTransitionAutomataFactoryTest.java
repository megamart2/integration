package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;

import java.util.Hashtable;
import java.util.Map;

import junit.framework.TestCase;
import dk.brics.automaton.Automaton;
import dk.brics.automaton.State;
import fi.hut.ics.lime.common.automaton.MockBricsAutomatonAdapter;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;

public class GuardedTransitionAutomataFactoryTest extends TestCase {
	private GuardedTransitionAutomataFactory factory = GuardedTransitionAutomataFactory.instance();
	private Automaton bricsAutomaton;
	private MockBricsAutomatonAdapter adapter;
	private GuardedTransitionAutomaton automaton;
	private Map<State, Integer> stateMap;
	private State bricsState;
	private PropositionNode[] propositionNodes;
	private PropositionNode propositionNode;
	
	@Override
	protected void setUp() {
		automaton = null;
		stateMap = new Hashtable<State, Integer>();
		
		// make brics automaton
		bricsAutomaton = new Automaton();
		bricsState = new State();
		bricsState.setAccept(true);
		bricsAutomaton.setInitialState(bricsState);
		// make adapter
		adapter = new MockBricsAutomatonAdapter();
		adapter.setStateMap(stateMap);
		adapter.setComplementAutomaton(bricsAutomaton);
		// make propositions
		propositionNode = new PropositionNode();
		propositionNode.setProposition("x > 0");
		propositionNode.setPropositionKind(PropositionKind.VALUE);
		propositionNodes = new PropositionNode[1];
		propositionNodes[0] = propositionNode;
		adapter.setPropositions(propositionNodes);
	}
	
	/**
	 * Test that the automaton created by the factory is not null.
	 */
	public void testNullCreation() {
		stateMap.put(bricsState, 1);
		adapter.setComplementAutomaton(bricsAutomaton);
		try {
			automaton = factory.generateAutomaton(adapter);
		} catch (GuardedTransitionAutomatonException e) {
			fail(e.getMessage());
		}
		assertNotNull("Returned automaton is null.", automaton);
	}
	
	public void testOneStated() {
		if(bricsAutomaton.getNumberOfStates() != 1) {
			throw new RuntimeException("Error in test brics automaton should have one state.");
		}
	
		stateMap.put(bricsState, 1);
		try {
			automaton = factory.generateAutomaton(adapter);
		} catch(GuardedTransitionAutomatonException e) {
			fail(e.getMessage());
		}
		
		int size = automaton.getNumberOfStates();
		assertTrue("Resulting automaton should have one state, got "+size, size == 1);
		assertTrue("Resulting automaton state should have the same number as the state of the adapter", 
				automaton.iterator().next().getNumber() == 1);
	}
}
