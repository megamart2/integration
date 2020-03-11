package fi.hut.ics.lime.common.logic.lexer;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.regex.*;

/**
 * A lexer for PLTL.
 * @author jalampin
 */
public class PropertyLexer {
	
	// static variables:
	private static final Pattern LBRACKET = Pattern.compile("^(\\[)", Pattern.MULTILINE);
	private static final Pattern COMMA = Pattern.compile("^(,)", Pattern.MULTILINE);
	private static final Pattern LPAREN = Pattern.compile("^(\\()", Pattern.MULTILINE);
	private static final Pattern RPAREN = Pattern.compile("^(\\))", Pattern.MULTILINE);
	//private static final Pattern RPAREN = Pattern.compile("^([)])[^ws]|^([)])$", Pattern.MULTILINE);
	
	//private static final String JAVA_IDENTIFIER = "[A-Za-z0-9_]+";
	private static final String JAVA_IDENTIFIER = "\\p{javaJavaIdentifierStart}\\p{javaJavaIdentifierPart}*";
	private static final Pattern VALUE = Pattern.compile("^<\\{([^}]+)\\}>");
	private static final Pattern NAMED = Pattern.compile("^("+JAVA_IDENTIFIER+")(?:$|[^(])", Pattern.MULTILINE);
	private static final Pattern CALL  = Pattern.compile("^("+JAVA_IDENTIFIER+")\\(\\)", Pattern.MULTILINE);
	private static final Pattern TRUE = Pattern.compile("^(TRUE)", Pattern.MULTILINE);
	private static final Pattern FALSE = Pattern.compile("^(FALSE)", Pattern.MULTILINE);
		
	// propositional:
	private static final Pattern NOT = Pattern.compile("^(!)", Pattern.MULTILINE);
	private static final Pattern AND = Pattern.compile("^(&&)", Pattern.MULTILINE);
	private static final Pattern OR  = Pattern.compile("^(\\|\\|)", Pattern.MULTILINE);
	private static final Pattern XOR = Pattern.compile("^(\\+\\+)", Pattern.MULTILINE);
	private static final Pattern IMPLICATION = Pattern.compile("^(->)", Pattern.MULTILINE);
	private static final Pattern EQUIVALENCE = Pattern.compile("^(<->)", Pattern.MULTILINE);
	
	// ptLTL:
	private static final Pattern PREVIOUSLY = Pattern.compile("^(Y)", Pattern.MULTILINE);
	private static final Pattern WEAK_PREVIOUSLY = Pattern.compile("^(Z)", Pattern.MULTILINE);
	private static final Pattern ONCE = Pattern.compile("^(O)", Pattern.MULTILINE);
	private static final Pattern HISTORICALLY = Pattern.compile("^(H)", Pattern.MULTILINE);
	private static final Pattern WEAK_SINCE = Pattern.compile("^(Sw) ", Pattern.MULTILINE);
	private static final Pattern STRONG_SINCE = Pattern.compile("^(S) ", Pattern.MULTILINE);
	private static final Pattern TRIGGER = Pattern.compile("^(T) ", Pattern.MULTILINE);
	
	// monitoring operators (ptLTL):
	private static final Pattern START = Pattern.compile("^(Start)", Pattern.MULTILINE);
	private static final Pattern END = Pattern.compile("^(End)", Pattern.MULTILINE);
	private static final Pattern WEAK_INTERVAL = Pattern.compile("^("+Pattern.quote(")w")+")", Pattern.MULTILINE);
	private static final Pattern STRONG_INTERVAL = Pattern.compile("^("+Pattern.quote(")s")+")", Pattern.MULTILINE);
	
	// LTL:
	private static final Pattern NEXT = Pattern.compile("^(X)", Pattern.MULTILINE);
	private static final Pattern FINALLY = Pattern.compile("^(F)", Pattern.MULTILINE);
	private static final Pattern GLOBALLY = Pattern.compile("^(G)", Pattern.MULTILINE);
	private static final Pattern WEAK_UNTIL = Pattern.compile("^(Uw) ", Pattern.MULTILINE);
	private static final Pattern STRONG_UNTIL = Pattern.compile("^(U) ", Pattern.MULTILINE);
	private static final Pattern RELEASE = Pattern.compile("^(V)", Pattern.MULTILINE);
	
	// white space:
	private static final Pattern WHITE_SPACE = Pattern.compile("^\\s+");

	// instance variables:
	private LinkedList<LexicalToken> lexedProperty;
	private String property;
	private int currentIndex;
	private ArrayList<PatternToken> tokenList;
	
	private static final class PatternToken{
		public Pattern p;
		public LexicalToken t;
		
		public PatternToken(Pattern p, LexicalToken t) {
			this.p = p;
			this.t = t;
		}
	}
	
	public PropertyLexer() {
		tokenList = new ArrayList<PatternToken>();
		tokenList.add(new PatternToken(LBRACKET,         new LexicalToken(TokenType.LBRACKET)));
		tokenList.add(new PatternToken(COMMA,            new LexicalToken(TokenType.COMMA)));
		tokenList.add(new PatternToken(LPAREN,           new LexicalToken(TokenType.LPAREN)));
		tokenList.add(new PatternToken(RPAREN,           new LexicalToken(TokenType.RPAREN)));
		tokenList.add(new PatternToken(TRUE,             new LexicalToken(TokenType.TRUE)));
		tokenList.add(new PatternToken(FALSE,            new LexicalToken(TokenType.FALSE)));
		tokenList.add(new PatternToken(NOT,              new LexicalToken(TokenType.NOT)));			
		tokenList.add(new PatternToken(AND,              new LexicalToken(TokenType.AND)));
		tokenList.add(new PatternToken(OR,               new LexicalToken(TokenType.OR)));
		tokenList.add(new PatternToken(XOR,              new LexicalToken(TokenType.XOR)));
		tokenList.add(new PatternToken(IMPLICATION,      new LexicalToken(TokenType.IMPLICATION)));
		tokenList.add(new PatternToken(EQUIVALENCE,      new LexicalToken(TokenType.EQUIVALENCE)));
		tokenList.add(new PatternToken(PREVIOUSLY,       new LexicalToken(TokenType.PREVIOUSLY)));
		tokenList.add(new PatternToken(WEAK_PREVIOUSLY,  new LexicalToken(TokenType.WEAK_PREVIOUSLY)));
		tokenList.add(new PatternToken(ONCE,             new LexicalToken(TokenType.ONCE)));
		tokenList.add(new PatternToken(HISTORICALLY,     new LexicalToken(TokenType.HISTORICALLY)));
		tokenList.add(new PatternToken(WEAK_SINCE,       new LexicalToken(TokenType.WEAK_SINCE)));
		tokenList.add(new PatternToken(STRONG_SINCE,     new LexicalToken(TokenType.SINCE)));
		tokenList.add(new PatternToken(TRIGGER,          new LexicalToken(TokenType.TRIGGER)));
		tokenList.add(new PatternToken(START,            new LexicalToken(TokenType.START)));
		tokenList.add(new PatternToken(END,              new LexicalToken(TokenType.END)));
		tokenList.add(new PatternToken(WEAK_INTERVAL,    new LexicalToken(TokenType.WEAK_INTERVAL)));
		tokenList.add(new PatternToken(STRONG_INTERVAL,  new LexicalToken(TokenType.INTERVAL)));
		tokenList.add(new PatternToken(NEXT,             new LexicalToken(TokenType.NEXT)));
		tokenList.add(new PatternToken(FINALLY,          new LexicalToken(TokenType.FINALLY)));
		tokenList.add(new PatternToken(GLOBALLY,         new LexicalToken(TokenType.GLOBALLY)));
		tokenList.add(new PatternToken(WEAK_UNTIL,       new LexicalToken(TokenType.WEAK_UNTIL)));
		tokenList.add(new PatternToken(STRONG_UNTIL,     new LexicalToken(TokenType.UNTIL)));
		tokenList.add(new PatternToken(RELEASE,          new LexicalToken(TokenType.RELEASE)));
		tokenList.add(new PatternToken(CALL,             new LexicalToken(TokenType.NAMELESS_CALLPROPOSITION)));
		tokenList.add(new PatternToken(NAMED,            new LexicalToken(TokenType.NAMED_PROPOSITION)));
		tokenList.add(new PatternToken(VALUE,		     new LexicalToken(TokenType.NAMELESS_VALUEPROPOSITION)));
	}
	
	/**
	 * Lexically analyze a PLTL property string.
	 * @param property The string to analyze
	 * @return a list of lexical tokens
	 * @throws LexicalException on error
	 */
	public LinkedList<LexicalToken> lexProperty(String property) 
			throws LexicalException {
		this.property = property;
		lexedProperty = new LinkedList<LexicalToken>();
		currentIndex  = 0;
		lex();
		return lexedProperty;
	}
		
	private void lex() throws LexicalException {
		Scanner scanner;
		boolean matched;
		while(currentIndex < property.length()) {
			matched = false;
			scanner = new Scanner(property.substring(currentIndex));
			if(scanner.findInLine(WHITE_SPACE) != null) {
				currentIndex += scanner.match().end();
				continue;
			}
			for(PatternToken pt : tokenList) {
				Pattern pattern = pt.p;
				if(scanner.findInLine(pattern) == null)
					continue;
				LexicalToken token = pt.t.clone();
				lexedProperty.add(token);
				if(pattern.equals(LPAREN) || pattern.equals(RPAREN) || pattern.equals(LBRACKET)) {
					token.setValue(property.substring(currentIndex, currentIndex+1));
					currentIndex++;
				}
				else if(pattern.equals(VALUE) || pattern.equals(CALL)) {
					token.setValue(scanner.match().group(1).trim());
					currentIndex += scanner.match().end();
				}
				else {
					if(pattern.equals(NAMED) && scanner.match().group(1) == null) {
						token.setValue(scanner.match().group(2).trim());
						currentIndex += scanner.match().group(2).length();
					}
					else {
						token.setValue(scanner.match().group(1));
						currentIndex += scanner.match().group(1).length();
					}
				}
				matched = true;
			}
			if(!matched) {
				throw new LexicalException("Invalid token encountered: "+property.substring(currentIndex));
			}
			
		}
	}
}
