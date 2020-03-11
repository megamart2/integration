package fi.hut.ics.lime.common.regexp.lexer;

import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Pattern;

import fi.hut.ics.lime.common.regexp.lexer.token.LexicalToken;
import fi.hut.ics.lime.common.regexp.lexer.token.TokenType;

/**
 * This class implements a lexer for regular expressions.
 * 
 * @author jalampin
 *
 */
public class RegExpLexer {
	// Regular expression operators:
	private static final Pattern CLOSURE       = Pattern.compile("^("+Pattern.quote("*")+")");
	private static final Pattern CONCATENATION = Pattern.compile("^(;)");
	private static final Pattern UNION         = Pattern.compile("^("+Pattern.quote("|")+")[^|]??");
	private static final Pattern LPAREN        = Pattern.compile("^("+Pattern.quote("(")+")");
	private static final Pattern RPAREN        = Pattern.compile("^("+Pattern.quote(")")+")");
	private static final Pattern LNATIVE       = Pattern.compile("^("+Pattern.quote("<{")+")");
	private static final Pattern RNATIVE       = Pattern.compile("^("+Pattern.quote("}>")+")");
	private static final Pattern WHITE_SPACE   = Pattern.compile("^\\s+");
	
	private Map<Pattern, LexicalToken> tokenMap;
	public RegExpLexer() {
		tokenMap = new Hashtable<Pattern, LexicalToken>();
		tokenMap.put(CLOSURE, new LexicalToken(TokenType.CLOSURE));
		tokenMap.put(CONCATENATION, new LexicalToken(TokenType.CONCATENATION));
		tokenMap.put(UNION, new LexicalToken(TokenType.UNION));
		tokenMap.put(LPAREN, new LexicalToken(TokenType.LPAREN));
		tokenMap.put(RPAREN, new LexicalToken(TokenType.RPAREN));
	}
	
	/**
	 * Lexically analyze a regular expression
	 * @param regexp Regular expression to parse
	 * @return Linked list containing tokens
	 * @throws LexicalException
	 */
	public LinkedList<LexicalToken> lexRegExp(String regexp) throws LexicalException {
		LinkedList<LexicalToken> l = new LinkedList<LexicalToken>();
		String proposition = "";
		Scanner scanner;
		boolean matched;
		int parenInProposition = 0;
		
		if(regexp == null) {
			throw new LexicalException("Could not lex null.");
		}
		
		while(!regexp.equals("")) {
			scanner = new Scanner(regexp);
			matched = false;
			// white space
			if(proposition.equals("") && scanner.findInLine(WHITE_SPACE) != null) {
				regexp = regexp.substring(scanner.match().end());
				continue;
			}
			// native code <{ #this.x > 0 }>
			if(scanner.findInLine(LNATIVE) != null) {
				while(scanner.findInLine(RNATIVE) == null && !regexp.equals("")) {
					proposition += regexp.substring(0, 1);
					regexp = regexp.substring(1);
					scanner = new Scanner(regexp);
				}
				scanner = new Scanner(regexp);
				if(scanner.findInLine(RNATIVE) != null) {
					proposition += "}>";
					regexp = regexp.substring(2);
					continue;
				}
			}
			// regexp operators: 
			for(Pattern pattern : tokenMap.keySet()) {
				if(scanner.findInLine(pattern) != null) {
					if(!pattern.equals(LPAREN) && !pattern.equals(RPAREN)) {
						if(!proposition.equals("")) {
							LexicalToken lexicalToken = new LexicalToken(TokenType.PROPOSITIONAL);
							lexicalToken.setValue(proposition);
							proposition = "";
							l.addLast(lexicalToken);
						}
						matched = true;
						l.addLast(tokenMap.get(pattern).clone());
						regexp = regexp.substring(scanner.match().group(1).length());
						break;
					}
					else if(proposition.equals("")) {
						l.addLast(tokenMap.get(pattern).clone());
						regexp = regexp.substring(scanner.match().group(1).length());
						parenInProposition = 0;			
						matched = true;
						break;
					}
					else if(pattern.equals(LPAREN)) {
						parenInProposition++;
					} 
					else if(parenInProposition > 0)
						parenInProposition--;
					else {
						LexicalToken lexicalToken = new LexicalToken(TokenType.PROPOSITIONAL);
						lexicalToken.setValue(proposition);
						proposition = "";
						l.addLast(lexicalToken);
						l.addLast(tokenMap.get(pattern).clone());
						regexp = regexp.substring(scanner.match().group(1).length());
						parenInProposition = 0;
						matched = true;
						break;
					}
				}
			}
			// proposition:
			if(!matched) {
				proposition += regexp.substring(0, 1);
				regexp = regexp.substring(1);
			}
		}
		if(!proposition.equals("")) {
			LexicalToken lexicalToken = new LexicalToken(TokenType.PROPOSITIONAL);
			lexicalToken.setValue(proposition);
			l.addLast(lexicalToken);
		}
		return l;
	}
}
