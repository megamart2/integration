package fi.hut.ics.lime.common.automaton;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.regexp.lexer.token.LexicalToken;

/**
 * An adapter between regexps and brics.dk automata.
 * @author sliedes
 */
public class RegexpAdapter extends BricsAutomatonAdapter {
	RegexpAdapter() {
		super();
		nodeMap = new Hashtable<LexicalToken, BooleanExpression>();
	}
	
	/**
	 * Set the list of lexical tokens in the regexp.
	 * @param tokens a list of lexical tokens
	 * @author jalampin
	 */
	public void setTokens(List<LexicalToken> tokens) {
		this.tokens = tokens;
	}

	/**
	 * Get all the lexical tokens in a regexp.
	 * Used only for regular expression definitions.
	 * @return a list of lexical tokens
	 * @author jalampin
	 */
	public List<LexicalToken> getTokens() {
		return tokens;
	}

	/**
	 * Get the mapping from lexical tokens to nodes.
	 * @return a map from lexical tokens to nodes
	 * @author jalampin
	 */
	public Map<LexicalToken, BooleanExpression> getNodeMap() {
		return nodeMap;
	}

	/**
	 * Add a mapping from a lexical token to a node.
	 * @param token the token to add mapping for
	 * @param node the node to map the token to
	 * @author jalampin
	 */
	public void mapToken(LexicalToken token, BooleanExpression node) {
		nodeMap.put(token, node);
	}

	@Override
	protected void generatePropositions() {
		PropositionVisitor visitor = new PropositionVisitor();
		
		for (Entry<LexicalToken, BooleanExpression> entry : nodeMap.entrySet())
			mapToken(entry.getKey(), visitor.traverse(entry.getValue()));
		
		propositions = visitor.getPropositions().toArray(new PropositionNode[0]);
		
	}
	
	private List<LexicalToken> tokens;
	private Map<LexicalToken, BooleanExpression> nodeMap;

}
