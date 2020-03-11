package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import dk.brics.automaton.Transition;
import fi.hut.ics.lime.common.automaton.BricsAutomatonAdapter;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.minimizer.ExpressionMinimizer;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.visitors.PrettyPrinter;
import fi.hut.ics.lime.common.pltl.scheck.PrefixNotationGeneratingVisitor;
import fi.hut.ics.lime.common.pltl.scheck.SCheckException;
import fi.hut.ics.lime.common.pltl.scheck.SCheckInvocation;
import fi.hut.ics.lime.common.utils.Debug;

/**
 * Converts a future time LTL AST into a DFA. 
 * @author jalampin
 */
public class GuardedTransitionAutomataFactory  {
	private static GuardedTransitionAutomataFactory instance = new GuardedTransitionAutomataFactory();
	
	/**
	 * Get the instance of this singleton.
	 * @return the instance of this singleton
	 */
	public static GuardedTransitionAutomataFactory instance() {
		return instance;
	}
	//private Map<dk.brics.automaton.State, State> statemap = null;
	private GuardedTransitionAutomataFactory() {
	}

	/**
	 * Generate a deterministic guarded transition automaton from 
	 * an abstract syntax tree representation of a future time LTL 
	 * formula.
	 * @param node Root of an abstract syntax tree from a (future time) LTL formula.
	 * @return automaton of the corresponding behaviour.
	 * @throws SCheckException If something goes wrong in the scheck process.
	 */
	public GuardedTransitionAutomaton generateAutomaton(BooleanExpression node) 
	throws SCheckException {
		Debug.println("+generateAutomaton()");
		PrefixNotationGeneratingVisitor prefixNotationGeneratingVisitor;
		SCheckInvocation sCheckInvocation;
		String prefixNotation, automatonText;
		Map<String, PropositionNode> propositions; 
		GuardedTransitionAutomatonParser guardedTransitionAutomatonParser;
		
		prefixNotationGeneratingVisitor = new PrefixNotationGeneratingVisitor(node);
		prefixNotation = "! "+prefixNotationGeneratingVisitor.getPrefixNotation();		
		propositions = prefixNotationGeneratingVisitor.getPropositions();					
		sCheckInvocation = new SCheckInvocation(prefixNotation);		
		automatonText = sCheckInvocation.getAutomataText();
		PrettyPrinter p = new PrettyPrinter(node);
		try {
			guardedTransitionAutomatonParser = new GuardedTransitionAutomatonParser(automatonText,propositions);
		} catch (Exception e) {
			// FIXME better exception
			Debug.println("-generateAutomaton()");
			throw new SCheckException(p.getPrettyPrint());
		}

		Debug.println("-generateAutomaton()");
		GuardedTransitionAutomaton automaton = guardedTransitionAutomatonParser.getAutomaton();
		for (State state : automaton) {
			for (GuardedTransition transition : state) {
				BooleanExpression guard = ExpressionMinimizer.minimizeExpression(transition.getGuard());
				transition.setGuard(guard);
			}
		}
		return automaton;
	}
	
	/**
	 * Generates a GuardedTransitionAutomaton from a BricsAutomatonAdapter
	 * @param adapter
	 * @return The generated automaton
	 * @throws GuardedTransitionAutomatonException
	 */
	public GuardedTransitionAutomaton generateAutomaton(BricsAutomatonAdapter adapter) 
	throws GuardedTransitionAutomatonException {
		Map<dk.brics.automaton.State, State> states = new Hashtable<dk.brics.automaton.State, State>(); 
		GuardedTransitionAutomaton automaton = new GuardedTransitionAutomaton();
		State state;
		
		// create states:
		for(Entry<dk.brics.automaton.State, Integer> entry : adapter.getStateMap().entrySet()) {
			dk.brics.automaton.State bricsState = entry.getKey();
			Integer number = entry.getValue();
			state = new State();
			state.setNumber(number);
			state.setAccepting(bricsState.isAccept());
			automaton.addState(state);
			states.put(bricsState, state);
			if(adapter.getComplementAutomaton().getInitialState() == bricsState) {
				automaton.setInitialState(state);
			}
		}
		
		if(automaton.getInitialState() == null) {
			throw new GuardedTransitionAutomatonException("Resulting automaton has no initial state.");
		}
		
		for (dk.brics.automaton.State bricsState : adapter.getStateMap()
				.keySet()) {
			Map<dk.brics.automaton.State, List<Transition>> transitionsByTarget = new HashMap<dk.brics.automaton.State, List<Transition>>();
			for (Transition transition : bricsState.getTransitions()) {
				List<Transition> transitionList;
				if (transitionsByTarget.containsKey(transition.getDest()))
					transitionList = transitionsByTarget.get(transition
							.getDest());
				else {
					transitionList = new LinkedList<Transition>();
					transitionsByTarget.put(transition.getDest(),
							transitionList);
				}
				transitionList.add(transition);
			}
			for (dk.brics.automaton.State bricsTargetState : transitionsByTarget
					.keySet()) {
				GuardedTransition guardedTransition = new GuardedTransition();
				guardedTransition.setTarget(states.get(bricsTargetState));
				states.get(bricsState).addTransition(guardedTransition);
				guardedTransition.setGuard(ExpressionMinimizer
						.createCombinedGuard(adapter.getPropositions(),
								transitionsByTarget.get(bricsTargetState)));
			}
		}
		
		return automaton;
	}
}
