package fi.hut.ics.lime.common.specification.propositions;

import java.util.Hashtable;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Pattern;

import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.sourcecode.Source;

/**
 * A singleton factory for creating propositions.
 * @author jalampin
 */
public class PropositionFactory {
	
	private static final String JAVA_IDENTIFIER = "\\p{javaJavaIdentifierStart}\\p{javaJavaIdentifierPart}*";
	
	private static final Pattern CALL_PROPOSITION_PATTERN = Pattern.compile("^([a-z][a-zA-Z0-9_-]*) ::= ("+JAVA_IDENTIFIER+")"+Pattern.quote("()"));
	private static final Pattern VALUE_PROPOSITION_PATTERN = Pattern.compile("^([a-z][a-zA-Z]*) ::= ([^;]+)");
	private static final Pattern EXCEPTION_PROPOSITION_PATTERN = Pattern.compile("^([a-z][a-zA-Z]*) ::= ("+JAVA_IDENTIFIER+")");
	
	private Map<Source, Map<String, PropositionNode>> propositionNodes;
	
	// Counter for proposition pre-instances. Must be stored here to avoid
	// conflicts if multiple pre-statements are in different valuepropositions
	// in one specification.
	private int precount;
	
	private static class PropositionFactoryHolder {
		private static final PropositionFactory INSTANCE = new PropositionFactory();
	}
	
	public static PropositionFactory getInstance() {
		return PropositionFactoryHolder.INSTANCE;
	}
	
	private PropositionFactory() {
		this.propositionNodes = new Hashtable<Source, Map<String,PropositionNode>>();
		this.precount = 0;
	}

	/**
	 * Parse a call proposition and create a named proposition.
	 * @param sourceType the class or interface the proposition is associated with
	 * @param proposition the proposition as a Java string
	 * @throws PropositionException
	 */
	public void createCallPropositionNode(Source sourceType, String proposition)
	throws PropositionException {
		Scanner scanner = new Scanner(proposition);
		String name, value;
		if(scanner.findInLine(CALL_PROPOSITION_PATTERN) == null) {
			throw new PropositionException("Call propositions must be of form: "+
					CALL_PROPOSITION_PATTERN.pattern()+". Got "+proposition+".");
		}
		name = scanner.match().group(1);
		value = scanner.match().group(2);
		
		PropositionNode node = createPropositionNode(sourceType, name, value);
		node.setPropositionKind(PropositionKind.CALL);
	}
	
	/**
	 * Parse a proposition string and create a value proposition node associated
	 * with the annotated class or interface.
	 * @param sourceType In Java, the class or interface the proposition is 
	 * associated with. In C, the source file the proposition is associated with.
	 * @param proposition the proposition, as a string
	 * @throws PropositionException on a syntax error
	 */
	public void createValuePropositionNode(Source sourceType, String proposition) 
	throws PropositionException {
		Scanner scanner = new Scanner(proposition);
		PropositionNode node;
		String name, value;
		
		if(scanner.findInLine(VALUE_PROPOSITION_PATTERN) == null) {
			throw new PropositionException("Value propositions must be of form: "+
					VALUE_PROPOSITION_PATTERN.pattern()+". Got "+proposition+".");
		}
		name = scanner.match().group(1);
		value = scanner.match().group(2);
		node = createPropositionNode(sourceType, name, value);
		node.setPropositionKind(PropositionKind.VALUE);
	}
	
	/**
	 * Parse a proposition string and create an exception proposition node associated
	 * with the annotated class or interface.
	 * @param sourceType In Java, the class or interface the proposition is
	 * associated with. In C, the source file the proposition is associated with.
	 * @param proposition the proposition, as a string
	 * @throws PropositionException on a syntax error
	 */
	public void createExceptionPropositionNode(Source sourceType, String proposition) 
	throws PropositionException {
		// FIXME combine this and other create*PropositionNode()s
		Scanner scanner = new Scanner(proposition);
		PropositionNode node;
		String name, value;
		
		if(scanner.findInLine(EXCEPTION_PROPOSITION_PATTERN) == null) {
			throw new PropositionException("Exception propositions must be of form: "+
					EXCEPTION_PROPOSITION_PATTERN.pattern()+". Got "+proposition+".");
		}
		name = scanner.match().group(1);
		value = scanner.match().group(2);
		node = createPropositionNode(sourceType, name, value);
		node.setPropositionKind(PropositionKind.EXCEPTION);
	}

	/**
	 * Get proposition nodes created using this factory that are associated with
	 * the given class or interface.
	 * @param sourceType the source type to get proposition nodes for
	 * @return a map from the names of the propositions to the proposition nodes
	 */
	public Map<String, PropositionNode> getPropositionNodesByType(Source sourceType) {
		return this.propositionNodes.get(sourceType);
	}
	
	/**
	 * Create a new proposition from a PropositionNode
	 * @return the newly created proposition
	 * @throws PropositionException
	 */
	public Proposition createProposition(PropositionNode node)
	throws PropositionException {
		return new Proposition(node, this.precount++);
	}
	
	private PropositionNode createPropositionNode(Source sourceType, String name, String value) 
	throws PropositionException {
		PropositionNode node = new PropositionNode(value);
		Map<String, PropositionNode> propMap = this.propositionNodes.get(sourceType);
		
		if(propMap == null) {
			propMap = new Hashtable<String, PropositionNode>();
			this.propositionNodes.put(sourceType, propMap);
		}
		
		if(propMap.get(name) != null)
			throw new PropositionException("Duplicate proposition "+name);
		propMap.put(name, node);
		return node;
	}
	
}
