package fi.hut.ics.lime.common.specification.propositions;

import java.util.HashSet;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.sourcecode.Method;

/**
 * A class that defines the semantics for a value proposition.
 * @author jalampin
 */
public class Proposition {
	
	/** The string "callTarget" */
	public static final String TARGET = "callTarget";
	private static final String TARGETPATTERN = "#this";
	
	/** The string "callResult" */
	public static final String RESULT = "callResult";
	private static final String RESULTPATTERN = "#result";
	
	// matches the "#pre" expression
	private static final Pattern PREPATTERN = 
		Pattern.compile("#pre([.](byte|short|int|long|float|double|boolean|char))?");
	// matches any "#expression", matches all characters allowed in java identifiers
	private static final Pattern ARGPATTERN = 
		Pattern.compile("#(\\p{javaJavaIdentifierStart}\\p{javaJavaIdentifierPart}*)");
		
	private final PropositionNode propositionNode;
	private Set<String> arguments;
	private Map<String, String> preValues;
	private Map<String, String> preTypes;
	private boolean referencesTarget;
	private boolean referencesResult;
	private String proposition;
	private int pre;
	
	/**
	 * Construct a new proposition from a proposition AST node.
	 * @param node the AST node
	 * @throws PropositionException on error
	 */
	public Proposition(PropositionNode node, int precount)
	throws PropositionException {
		
		propositionNode = node;
		referencesTarget = false;
		referencesResult = false;
		
		arguments = new HashSet<String>();
		preValues = new Hashtable<String, String>();
		preTypes  = new Hashtable<String, String>();
		pre = precount;
		
		proposition = node.getProposition();
		if(node.getPropositionKind() == PropositionKind.VALUE)
			lexProposition();
	}

	/**
	 * @return whether this is a named proposition, a value proposition or a call proposition.
	 */
	public PropositionKind getPropositionKind() {
		return propositionNode.getPropositionKind();
	}

	/** 
	 * @return the arguments of this proposition, in a set
	 */
	public Set<String> getArguments() {
		return arguments;
	}

	/**
	 * @return Mapping from the internal name of the nth pre-statement as "preN"
	 * to the expression that is needed to assign the value to it, for the pre-value
	 * variable assignment before the proceed() call.
	 */
	public Map<String, String> getPreValues() {
		return preValues;
	}
	
	/**
	 * @return The type for the history variable with the given name (preN), 
	 * as Java string. The types are always Java primitives.
	 */
	public Map<String, String> getPreTypes() {
		return preTypes;
	}

	/**
	 * @return Whether the proposition contains the form \#this.
	 */
	public boolean referencesTarget() {
		return referencesTarget;
	}

	/**
	 * @return Whether the proposition contains the form \#result (which is the return
	 * value of the proceed() call).
	 */
	public boolean referencesResult() {
		return referencesResult;
	}
	
	/**
	 * Get the textual representation of the proposition in AspectJ code.
	 * This often, but not always, means an expression. For example in the
	 * case of exception propositions, it is the name of the exception class.
	 * @return the textual representation of the proposition in AspectJ code.
	 */
	public String getProposition() {
		return proposition;
	}

	/**
	 * Check if this proposition matches (should be used for) a method 
	 * @param method the method to match against
	 * @return true on a match
	 */
	public boolean matchesMethod(Method method) {
		return getPropositionKind() == PropositionKind.CALL &&
			propositionNode.getProposition().equals(method.getSimpleName());
	}
	
	/**
	 * Get the specification text for this proposition, unparsed.
	 * It is a single proposition and does not contain any LTL operators
	 * (but can be inside one, and contain \#pre).
	 */
	public String getValue() {
		return propositionNode.getValue();
	}

	/**
	 * Return a human-readable string representing this proposition and its kind,
	 * for pretty printers.
	 */
	@Override
	public String toString() {
		return propositionNode.toString();
	}

	private void lexProposition() 
	throws PropositionException {
		// target references:
		referencesTarget = proposition.contains(TARGETPATTERN);
		proposition = proposition.replaceAll(TARGETPATTERN, TARGET);
		
		// result references:
		referencesResult = proposition.contains(RESULTPATTERN);
		proposition = proposition.replaceAll(RESULTPATTERN, RESULT);
				
		// argument references:
		String tmp = "";
		Matcher matcher = ARGPATTERN.matcher(proposition);
		
		while(matcher.find()) {
			// if the proposition starts with "#pre" save the string up to that
			// point and process the remainder
			if (proposition.substring(matcher.start(), matcher.end()).equals("#pre")) {
				tmp = tmp + proposition.substring(0, matcher.end());
				proposition = proposition.substring(matcher.end());
			} else {
				proposition = matcher.replaceFirst(matcher.group(1));
				arguments.add(matcher.group(1));
			}
			matcher = ARGPATTERN.matcher(proposition);
		}
		proposition = tmp + proposition;
		
		// pre values:
		String type;
		matcher = PREPATTERN.matcher(proposition);
		
		while(matcher.find()) {
			String first = proposition.substring(0, matcher.start());
			String rest  = proposition.substring(matcher.end());
			if(matcher.group(1) == null)
				type = "int";
			else
				type = matcher.group(1).substring(1);

			proposition = first+extractPrevalue(type, rest);
			matcher = PREPATTERN.matcher(proposition);
		}
	}
	
	private String extractPrevalue(String type, String proposition) 
	throws PropositionException {
		int paren = 0;
		StringBuffer preValue = new StringBuffer();
				
		// proposition:
		if(!proposition.startsWith("("))
			throw new PropositionException("prevalues must declared with syntax #pre[.<primitive type>](<value>)");
		do {
			if(proposition.length() == 0)
				throw new PropositionException("prevalue has bad format.");
	
			if(proposition.startsWith("("))
				paren++;
			else if(proposition.startsWith(")"))
				paren--;
			
			preValue.append(proposition.charAt(0));
			proposition = proposition.substring(1);
		} while(paren > 0);
		
		String value = "pre"+pre++;
		preValues.put(value, preValue.toString());
		preTypes.put(value, type);
		return value+proposition;
	}
}
