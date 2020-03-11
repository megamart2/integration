package fi.hut.ics.lime.common.regexp.lexer.token;

/**
 * Lexical token for regexp
 * @author jalampin
 */
public class LexicalToken implements Cloneable {
	private final TokenType type;
	private String value;
	
	/**
	 * Construct a lexical token with a given type.
	 * @param type the type of the lexical token
	 */
	public LexicalToken(TokenType type) {
		this.type = type;
	}
	
	/**
	 * Get the type of the token. 
	 * @return the type of the token
	 */
	public TokenType getType() {
		return type;
	}

	/**
	 * Get the value of the token.
	 * @return the value of the token, as a string.
	 */
	public String getValue() {
		return value;
	}

	/**
	 * Set the value of the token.
	 * @param value the value of the token, as a string.
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	/**
	 * Get a string representation of the token. Standard regexp syntax.
	 */
	@Override
	public String toString() {
		switch(type) {
		case CLOSURE : return "*";
		case CONCATENATION : return "";
		case LPAREN : return "(";
		case RPAREN : return ")";
		case UNION : return "|";
		default: return value;
		}
	}
	
	/**
	 * Clone a lexical token.
	 * @author jalampin
	 */
	@Override
	public LexicalToken clone() {
		try {
			return (LexicalToken)super.clone();
		} catch (CloneNotSupportedException e) {
			throw new AssertionError(e);
		}
	}
	
}
