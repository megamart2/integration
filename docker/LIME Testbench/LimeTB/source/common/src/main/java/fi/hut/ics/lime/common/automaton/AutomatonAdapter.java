package fi.hut.ics.lime.common.automaton;

import fi.hut.ics.lime.common.automaton.ast.AutomatonDefinition;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

/**
 * Adapter between always_nfa automata definitions and dk.brics automata.
 * @author sliedes
 */
public class AutomatonAdapter extends BricsAutomatonAdapter {
	private AutomatonDefinition definition;
	
	/**
	 * Get the automaton definition (AST node).
	 * @return the automaton definition
	 */
	public AutomatonDefinition getDefinition() {
		return definition;
	}
	
	/**
	 * Set the automaton definition (AST node).
	 * @param def the automaton definition
	 */
	public void setDefinition(AutomatonDefinition def) {
		definition = def;
	}
	
	/**
	 * Merge identical propositions into one. Modifies expandedConditions in the states.
	 */
	@Override
	protected void generatePropositions() {
		PropositionVisitor visitor = new PropositionVisitor();
		
		for (AutomatonDefinition.StateInfo si : definition.getStates())
			for (int i=0; i<si.getNumBranches(); i++)
				si.setExpandedCondition(i,visitor.traverse(si.getExpandedCondition(i)));
		
		propositions = visitor.getPropositions().toArray(new PropositionNode[0]);
	}
}
