package fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton;
import java.util.Hashtable;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.MatchResult;
import java.util.regex.Pattern;

import fi.hut.ics.lime.common.logic.ast.modifiers.PropositionalSimplifyingModifier;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;
import fi.hut.ics.lime.common.pltl.scheck.SCheckException;

/**
 * Parses the DFA from the string representation returned by SCheck.
 * This includes mapping the propositions from the SCheck's p[:digit:]+
 * form into proposition nodes.
 * @author jalampin
 */
class GuardedTransitionAutomatonParser {
	// class constants:
	private static final Pattern STATE_PATTERN = Pattern.compile("(\\d) (\\d)( \\d)? -1");
	private static final Pattern TRANSITION_PATTERN = Pattern.compile("(\\d+) (.*)");
	private static final Pattern PROPOSITION_PATTERN = Pattern.compile("^(p\\d+)");
	private static final Pattern TRUE_PATTERN = Pattern.compile("^t");
	private static final Pattern AND_PATTERN = Pattern.compile("^&");
	private static final Pattern OR_PATTERN  = Pattern.compile("^"+Pattern.quote("|"));
	private static final Pattern NOT_PATTERN = Pattern.compile("^!");
	
	// instance variables:
	private GuardedTransitionAutomaton automaton; 
	private Hashtable<Integer, State> states;
	private Map<String, PropositionNode> propositions;
	private State initialState = null;
	private String guardText;
	
	/**
	 * Construct a new parser and parse the string representation from SCheck.
	 * @param automatonText the textual representation of the automaton, from SCheck
	 * @param propositions the map of proposition names to propositions
	 * @throws SCheckException on error
	 */
	public GuardedTransitionAutomatonParser(String automatonText, Map<String, PropositionNode> propositions) throws
		SCheckException {
		this.propositions = propositions;
		this.states = new Hashtable<Integer, State>();
		automaton = parseAutomaton(automatonText);
	}

	/**
	 * Get the automaton constructed from the parsed string.
	 * @return the parsed automaton
	 */
	public GuardedTransitionAutomaton getAutomaton() {
		return automaton;
	}
	
	/**
	 * Parse an automaton constructed by SCheck.
	 * @param automatonText the textual representation of the automaton, from SCheck
	 * @return the automaton
	 * @throws SCheckException on error
	 */
	private GuardedTransitionAutomaton parseAutomaton(String automatonText) 
	throws SCheckException {
		GuardedTransitionAutomaton automaton = new GuardedTransitionAutomaton();
		String line;
		State state = null;
		boolean scanningTransitions = false;
		
		Scanner scanner = new Scanner(automatonText);
		if(scanner.hasNextLine())
			scanner.nextLine(); // skip the first line of input as redundant
		else
			throw new SCheckException("No automata data.");
		
		// scan through states and transitions:
		while(scanner.hasNextLine()) {
			if(!scanningTransitions) {
				
				state = parseState(scanner.nextLine());
				
				scanningTransitions = true;
			} else {
				
				while(scanner.hasNextLine() && !(line = scanner.nextLine()).equals("-1")) {
					state.addTransition(parseTransition(line));
				}
				
				scanningTransitions = false;
			}
		}
		
		// add states to automaton:
		for(State s : states.values())
			automaton.addState(s);
		if(initialState == null)
			throw new SCheckException("The automaton contains no initial state.");
		try {
			automaton.setInitialState(initialState);
		} catch(GuardedTransitionAutomatonException e) {
			throw new SCheckException(e);
		}
		
		return automaton;
	}
	
	private State parseState(String stateString) throws SCheckException {
		State state = null;
		Scanner scanner = new Scanner(stateString);
		MatchResult matchResult;
		
		if(scanner.findInLine(STATE_PATTERN) == null)
			throw new SCheckException("Unable to parse a state");
		
		matchResult = scanner.match();
		state = state(Integer.valueOf(matchResult.group(1)));
		if(Integer.valueOf(matchResult.group(2)) != 0) {
			if(initialState != null) {
				throw new SCheckException("Duplicate initial states: "+state.getNumber()+
						  " and "+initialState.getNumber());
			}
			initialState = state;
		}
		if(matchResult.group(3) != null)
			state.setAccepting(true);
		
		return state;
	}
	
	private GuardedTransition parseTransition(String transitionText) throws SCheckException {
		GuardedTransition guardedTransition = new GuardedTransition();
		State target;
		Scanner scanner = new Scanner(transitionText);
		MatchResult matchResult;
		BooleanExpression guard, oldGuard;
		
		
		if(scanner.findInLine(TRANSITION_PATTERN) == null)
			throw new SCheckException("Bad transition format.");
		
		matchResult = scanner.match();
		target = state(Integer.valueOf(matchResult.group(1)));
		guardedTransition.setTarget(target);
		guardText = matchResult.group(2);
		guard = parseGuard();
		// optimize the guards:
		do {			
			oldGuard = guard;
			guard = new PropositionalSimplifyingModifier(guard).getSimplifiedCode();
		} while(!guard.equals(oldGuard));
		
		guardedTransition.setGuard(guard);
		
		return guardedTransition;
	}

	private BooleanExpression parseGuard() throws SCheckException {
		PropositionalConnective connective = null;
		guardText = guardText.trim();
		Scanner scanner = new Scanner(guardText);
		
		if(scanner.findInLine(PROPOSITION_PATTERN) != null) {
			String key = scanner.match().group(1).trim();
			PropositionNode proposition = propositions.get(key);
			proposition.setValue(proposition.getProposition());
			guardText = guardText.substring(scanner.match().end());
			return proposition;
		} else if(scanner.findInLine(AND_PATTERN) != null) {
			connective = new PropositionalConnective(PropositionalConnectiveType.AND);
			guardText = guardText.substring(scanner.match().end());
			connective.setNth(1,parseGuard());
			connective.setNth(2,parseGuard());
		} else if(scanner.findInLine(OR_PATTERN) != null) {
			connective = new PropositionalConnective(PropositionalConnectiveType.OR);
			guardText = guardText.substring(scanner.match().end());
			connective.setNth(1,parseGuard());
			connective.setNth(2,parseGuard());
		} else if(scanner.findInLine(NOT_PATTERN) != null) {
			connective = new PropositionalConnective(PropositionalConnectiveType.NOT);
			guardText = guardText.substring(scanner.match().end());
			connective.setNth(1,parseGuard());	
		} else if(scanner.findInLine(TRUE_PATTERN) != null) {
			guardText = guardText.substring(scanner.match().end());
			return new Literal(true);
		} else {
			throw new SCheckException("Unidentified symbol at: "+guardText);
		}
		
		return connective;
	}

	private State state(Integer i) {
		State state;
		if(states.containsKey(i))
			state = states.get(i);
		else {
			state = new State();
			state.setNumber(i);
			states.put(i, state);
		}
		return state;
	}
}
