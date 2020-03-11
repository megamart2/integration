package fi.hut.ics.lime.common.automaton;

import java.util.Arrays;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import dk.brics.automaton.Automaton;
import dk.brics.automaton.MinimizationOperations;
import dk.brics.automaton.RegExp;
import dk.brics.automaton.State;
import dk.brics.automaton.StatePair;
import dk.brics.automaton.Transition;

import fi.hut.ics.lime.common.automaton.ast.AutomatonDefinition;
import fi.hut.ics.lime.common.logic.TemporalLogicException;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.visitors.PrettyPrinter;
import fi.hut.ics.lime.common.logic.ast.visitors.TruthValueVisitor;
import fi.hut.ics.lime.common.logic.lexer.PropertyLexer;
import fi.hut.ics.lime.common.logic.parser.PLTLParser;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.regexp.lexer.token.LexicalToken;
import fi.hut.ics.lime.common.regexp.lexer.token.TokenType;

/**
 * This class converts regexps to DFAs using the automaton package.
 * It does this by converting the LIME regexp to a form where all events
 * are replaced by letters, since the automaton package only handles
 * letters. The reverse is done to the DFA returned.
 * 
 * @author jalampin
 */
public class AutomatonAdapterFactory {
	private static final PropertyLexer propertyLexer = new PropertyLexer();
	private static final AutomatonAdapterFactory instance = new AutomatonAdapterFactory();

	/**
	 * Get the instance of this singleton.
	 * @return the instance of this singleton
	 */
	public static final AutomatonAdapterFactory instance() {
		return instance;
	}
	
	private AutomatonAdapterFactory() {
	}

	/**
	 * Create a RegexpAdapter containing a list of lexical tokens.
	 * A DFA is not yet created, use createAutomatonFromRegexp() for that.
	 * A semantic error can happen if a regexp contains temporal
	 * operators.
	 * @param tokens The tokens to store in the adapter 
	 * @throws RegularExpressionException on syntax or semantic error
	 */
	public RegexpAdapter createFromRegexp(List<LexicalToken> tokens) 
	throws RegularExpressionException {
		RegexpAdapter adapter = new RegexpAdapter();
		StringBuffer parsed = new StringBuffer();
		PrettyPrinter pPrinter;
		
		adapter.setTokens(tokens);
		for(LexicalToken token : tokens) {
			if(token.getType() == TokenType.PROPOSITIONAL) {
				BooleanExpression node = null;
				try {
					PLTLParser pLTLParser;
					pLTLParser = new PLTLParser(propertyLexer.lexProperty(token.getValue()));
					node = pLTLParser.getAst();
					pPrinter = new PrettyPrinter(node);
					parsed.append(pPrinter.getPrettyPrint());
				} catch (TemporalLogicException e) {
					throw new RegularExpressionException(e.getMessage(), e.getCause());
				}
				adapter.mapToken(token, node);
			}
			else if(token.getType() != TokenType.CONCATENATION)
				parsed.append(token.toString());
			else
				parsed.append(" ; "); // brics regexps use space as concatenation
		}
		adapter.setParsedDefinition(parsed.toString());
		return adapter;
	}
	
	/**
	 * Create an AutomatonAdapter from an always_nfa AST definition node.
	 * @param definition the always_nfa AST definition node
	 * @return the newly created adapter
	 */
	public AutomatonAdapter createFromAutomaton(AutomatonDefinition definition) {
		AutomatonAdapter adapter = new AutomatonAdapter();
		
		adapter.setDefinition(definition);
		adapter.setParsedDefinition(definition.prettyPrint());
		
		return adapter;
	}
	
	/**
	 * Parse a regular expression stored in an adapter and convert it into a DFA.
	 * This is done using the automaton package. The result is stored in the 
	 * adapter object.
	 * @param adapter The adapter previously created using createRegexpAdapter()
	 */
	public void createAutomatonFromRegexp(RegexpAdapter adapter) {
		Map<LexicalToken, BooleanExpression> nodeMap = adapter.getNodeMap();
		PropositionNode[] propositions;
		BooleanExpression node;
		StringBuffer regexpString = new StringBuffer();
		Automaton automaton;
		SortedSet<Integer> impossiblePropositionCombinations = new TreeSet<Integer>();
		
		propositions = adapter.getPropositions();
		recordInternal(adapter);
		
		for(LexicalToken token : adapter.getTokens()) {
			if(token.getType() != TokenType.PROPOSITIONAL) {
				regexpString.append(token.toString());
				continue;
			}
			node = nodeMap.get(token);
			regexpString.append(makeTruthAssignmentRegexp(
					makeTruthAssignments(
							propositions,
							node,
							impossiblePropositionCombinations)));
		}
		
		automaton = new RegExp(regexpString.toString()).toAutomaton();
		automaton.prefixClose();
		postprocessAutomaton(adapter, automaton, impossiblePropositionCombinations);
	}
	
	/**
	 * Create a dk.brics automaton from an always_nfa definition and convert it
	 * into a DFA.
	 * This is done using the automaton package. The result is stored in the
	 * adapter object.  
	 * @param adapter the adapter to store the DFA in
	 * @param definition the AST node representing the always_nfa definition
	 * @throws AutomatonException on error
	 */
	public void createAutomatonFromAutomatonDefinition(AutomatonAdapter adapter,
			AutomatonDefinition definition) throws AutomatonException {
		Automaton automaton = new Automaton();
		SortedSet<Integer> impossiblePropositionCombinations = new TreeSet<Integer>();

		int numStates = definition.getNumStates();
		State states[] = new State[numStates];
		LinkedList<State> initStates = new LinkedList<State>();
		for (int i=0; i<numStates; i++) {
			states[i] = new State();
			AutomatonDefinition.StateInfo info = definition.getState(i);
			states[i].setAccept(info.isAccept());
			if (info.isInit())
				initStates.add(states[i]);
		}

		automaton.getStates().addAll(Arrays.asList(states));
		automaton.setDeterministic(false);
		
		PropositionNode[] propositions = adapter.getPropositions();
		adapter.setInternalDefinition(definition.prettyPrint());
		
		if (initStates.isEmpty())
			throw new AutomatonException("Given always_nfa automaton has no initial states.");
		else if (initStates.size() == 1)
			automaton.setInitialState(initStates.getFirst());
		else {
			State dummyInit = new State();
			dummyInit.setAccept(true);
			automaton.getStates().add(dummyInit);
			for (State s : initStates)
				automaton.addEpsilons(Arrays.asList(	
						new StatePair[] {new StatePair(dummyInit,s)}));
			automaton.setInitialState(dummyInit);
		}

		State sink = new State();
		
		for (int i=0; i<numStates; i++) {
			makeTruthAssignmentTransitions(
					states[i], sink,
					makeTruthAssignments(
							propositions,
							new Literal(true),
							impossiblePropositionCombinations));
			for (int j=0; j<definition.getState(i).getNumBranches(); j++)
				makeTruthAssignmentTransitions(
						states[i],
						states[definition.getState(i).getTarget(j)],
						makeTruthAssignments(
								propositions,
								definition.getState(i).getExpandedCondition(j),
								impossiblePropositionCombinations));
		}

		makeTruthAssignmentTransitions(
				sink, sink,
				makeTruthAssignments(
						propositions,
						new Literal(true),
						impossiblePropositionCombinations));
		
		automaton.setDeterministic(false);
		automaton.restoreInvariant();
		postprocessAutomaton(adapter, automaton, impossiblePropositionCombinations);
	}
	
	/**
	 * Complement, minimize and determinize the automaton and set the adapter field.
	 * @param adapter automaton adapter to place the final automaton in
	 * @param automaton non-complemented automaton to process
	 */
	private void postprocessAutomaton(BricsAutomatonAdapter adapter,
			Automaton automaton,
			SortedSet<Integer> impossiblePropositionCombinations) {
		automaton.determinize();
		automaton = automaton.complement();

		for(State state : automaton.getAcceptStates()) {
			state.getTransitions().removeAll(state.getTransitions());
		}

		// Cut away ranges outside our proposition vector range and the impossible proposition vectors
		Automaton allowedRange = new Automaton();
		{
			State s = new State();
			s.setAccept(true);
			int lowerBound = 0;
			for (int upperBound : impossiblePropositionCombinations) {
				if (upperBound - lowerBound > 0)
					if (upperBound - lowerBound > 1)
						s.addTransition(new Transition((char) lowerBound,
								(char) (upperBound - 1), s));
					else
						s.addTransition(new Transition((char) lowerBound, s));
				lowerBound = upperBound + 1;
			}
			if (lowerBound < (1 << adapter.propositions.length))
				if (lowerBound < (1 << adapter.propositions.length) - 1)
					s.addTransition(new Transition((char) lowerBound,
							(char) ((1 << adapter.propositions.length) - 1), s));
				else
					s.addTransition(new Transition((char) lowerBound, s));
			allowedRange.setInitialState(s);
			allowedRange.restoreInvariant();
		}
		
		automaton = automaton.intersection(allowedRange);
		
		// minimize() also determinizes
		MinimizationOperations.minimize(automaton);

		adapter.setComplementAutomaton(automaton);
		Integer i = 0;
		Map<State, Integer> stateMap = new Hashtable<State, Integer>();
		
		for(State state : automaton.getStates()) {
			stateMap.put(state, i++);
		}
		adapter.setStateMap(stateMap);
	}
	
	/**
	 * Record the internal representation of regexp to the
	 * corresponding adapter.
	 * @param adapter
	 */
	private void recordInternal(RegexpAdapter adapter) {
		StringBuffer regexpString = new StringBuffer();
		Map<LexicalToken, BooleanExpression> nodeMap = adapter.getNodeMap();
		for(LexicalToken token : adapter.getTokens()) {	
			if(token.getType() != TokenType.PROPOSITIONAL && token.getType() != TokenType.CONCATENATION) {
				regexpString.append(token.toString());
			} else if(token.getType() == TokenType.CONCATENATION) {
				regexpString.append(" ; "); // brics automaton uses "" as concatenation
			} else {
				BooleanExpression n = nodeMap.get(token);
				PrettyPrinter p = new PrettyPrinter(n);
				regexpString.append(p.getPrettyPrint());
			}
		}
		adapter.setInternalDefinition(regexpString.toString());
	}
	
	private StringBuffer makeTruthAssignments(PropositionNode[] propositions,
			BooleanExpression expr,
			SortedSet<Integer> impossiblePropositionCombinations) {
		StringBuffer list = new StringBuffer();
		TruthValueVisitor truthValueVisitor = new TruthValueVisitor();

		AllPropositionCombinations: for(int i = 0; i < (1 << propositions.length); i++) {
			boolean oneCallPropositionTrue = false;
			for(int j = 0; j < propositions.length; j++) {
				propositions[j].setTruthValue((i & (1 << j)) != 0);
				if (propositions[j].getPropositionKind() == PropositionKind.CALL && propositions[j].getTruthValue())
					if (oneCallPropositionTrue) {
						impossiblePropositionCombinations.add(i);
						continue AllPropositionCombinations;
					} else
						oneCallPropositionTrue = true;
			}
			expr.accept(truthValueVisitor);
			
			if(expr.getTruthValue())
				list.append((char) i);
		}
		
		return list;
	}
	
	private void makeTruthAssignmentTransitions(State from, State to, CharSequence list) {
		int len = list.length();
		
		for (int i=0; i<len; i++)
			from.addTransition(new Transition(list.charAt(i),to));
	}
	
	private String makeTruthAssignmentRegexp(CharSequence list) {
		StringBuffer re = new StringBuffer("(");
		
		int len = list.length();
		if (len == 0)
			return "";
		re.append("\\"+list.charAt(0));

		for (int i=1; i<len; i++)
			re.append("|\\"+list.charAt(i));
		
		re.append(")");
		
		return re.toString();
	}
}
