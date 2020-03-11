package fi.hut.ics.lime.common.automaton.ast;

import java.util.HashMap;
import java.util.LinkedList;

import fi.hut.ics.lime.common.automaton.parser.SyntaxError;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;

/**
 * The AST node for an always_nfa definition.
 * Also includes functionality to associate state names with their numbers. 
 * @author sliedes
 */
public class AutomatonDefinition {
	/**
	 * Construct a new AutomatonDefinition AST node.
	 * @param states a linked list of automaton states
	 */
	public AutomatonDefinition(LinkedList<AutomatonState> states) {
		constructStateMap(states);
		constructStateInfo(states);
	}

	/**
	 * Get the states in this automaton as an array.
	 * @return an array of states
	 */
	public StateInfo getState(int i) {
		return states[i];
	}
	
	/**
	 * Get an array of all states in this automaton.
	 */
	public StateInfo[] getStates() {
		return states;
	}
	
	/**
	 * Get the number of states in this automaton.
	 * @return the number of states in this automaton
	 */
	public int getNumStates() {
		return states.length;
	}
	
	/**
	 * Get a brief human-readable representation of this automaton definition.
	 */
	@Override
	public String toString() {
		StringBuffer b = new StringBuffer();
		
		b.append("<AutomatonDefinition (");
		b.append("num_states="+getNumStates());
		b.append(")>");
		
		return b.toString();
	}

	/**
	 * Get a longer (well, currently not) human-readable representation of this
	 * automaton definition. 
	 */
	public String prettyPrint() {
		// FIXME
		return toString();
	}
	
	/**
	 * A single state in an AutomatonDefinition.
	 * Contains the state name and the transitions from the state.
	 * @author sliedes
	 */
	public class StateInfo {
		private int numBranches;
		private BooleanExpression[] exprs;
		
		/// These are exprs with named propositions expanded
		private BooleanExpression[] expandedExprs;
		
		private int[] targets;
		private String name;
		
		private StateInfo(AutomatonState state) {
			numBranches = state.getBranches().size();
			exprs = new BooleanExpression[numBranches];
			expandedExprs = new BooleanExpression[numBranches];
			targets = new int[numBranches];
			name = state.getName();
			
			int i=0;
			for (AutomatonIfBranch branch : state.getBranches()) {
				exprs[i] = branch.getCondition();
				Integer num = stateMap.get(branch.getTargetStateName());
				if (num == null) {
					throw new SyntaxError("No such state in automaton: "+
							branch.getTargetStateName());
				}
				targets[i++] = num;
			}
		}
		
		/**
		 * Get the number of branches (transitions from this state).
		 * @return the number of branches (transitions from this state)
		 */
		public int getNumBranches() {
			return numBranches;
		}

		/**
		 * Get the condition (boolean expressions) for a transition.
		 * @param branch the number of the branch to get condition for ([0..n-1])
		 * @return the condition (boolean expression) for the transition 
		 */
		public BooleanExpression getCondition(int branch) {
			return exprs[branch];
		}
		
		/**
		 * Get an array of conditions (boolean expressions) for all the transitions
		 * from this state.
		 * @return an array of conditions (boolean expressions)
		 */
		public BooleanExpression[] getConditions() {
			return exprs;
		}
		
		/**
		 * Get a condition, with named propositions expanded, for a transition.
		 * @param branch the number of the branch to get condition for ([0..n-1])
		 * @return the expanded condition (boolean expression with no named propositions)
		 */
		public BooleanExpression getExpandedCondition(int branch) {
			if (expandedExprs[branch] == null)
				throw new AssertionError("expanded cond not yet set");
			return expandedExprs[branch];
		}
		
		/**
		 * Set the expanded condition (named propositions expanded) for a transition.
		 * @param branch the number of the branch to set condition for ([0..n-1])
		 * @param expr the expanded condition (boolean expression with no named
		 * propositions)
		 */
		public void setExpandedCondition(int branch, BooleanExpression expr) {
			expandedExprs[branch] = expr;
		}
		
		/**
		 * Get the target state of a branch (transition).
		 * @param branch the number of the branch to get target for ([0..n-1])
		 * @return the number of the target state of a branch
		 */
		public int getTarget(int branch) {
			return targets[branch];
		}
		
		/**
		 * Get the name of this state.
		 * @return the name of this state
		 */
		public String getName() {
			return name;
		}

		/**
		 * Return true if this is an accepting state.
		 * @return true if this is an accepting state
		 */
		public boolean isAccept() {
			return !name.startsWith("reject_");
		}
		
		/**
		 * Return true if this is an initial state.
		 * @return true if this is an initial state
		 */
		public boolean isInit() {
			return name.endsWith("_init");
		}
	}
	
	/**
	 * The mapping of state names to their numbers ([0..n-1]).
	 */
	private HashMap<String, Integer> stateMap;
	private StateInfo[] states;
	
	/**
	 * Construct the array of StateInfos from a linked list of states.
	 * @param list a linked list of states
	 */
	private void constructStateInfo(LinkedList<AutomatonState> list) {
		int i=0;
		states = new StateInfo[list.size()];
		for (AutomatonState s : list)
			states[i++] = new StateInfo(s);
	}
	
	/**
	 * Construct the mapping from state names to their numbers. 
	 * @param list a linked list of states
	 */
	private void constructStateMap(LinkedList<AutomatonState> list) {
		int i=0;
		stateMap = new HashMap<String, Integer>();
		for (AutomatonState s : list)
			stateMap.put(s.getName(), i++);
	}
}
