package fi.hut.ics.lime.common.logic.lexer;

/**
 * A PLTL token.
 * @author jalampin
 */
public class LexicalToken implements Cloneable {
	private String value;
	private TokenType type;
	
	public LexicalToken() {
	}
	
	/**
	 * Construct a new lexical token with a given type.
	 * @param type the type of the token
	 */
	public LexicalToken(TokenType type) {
		this.type = type;
	}
	
	/**
	 * Construct a new lexical token with a given type and a value.
	 * @param value the type of the token
	 * @param type the value of the token, as a string
	 */
	public LexicalToken(String value, TokenType type) {
		this.value = value;
		this.type  = type;
	}
	
	/**
	 * Get the value of the token.
	 * @return the value of the token, as a string
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
	 * Get the type of the token.
	 * @return the type of the token
	 */
	public TokenType getType() {
		return type;
	}
	
	/**
	 * Set the type of the token.
	 * @param type the type of the token
	 */
	public void setType(TokenType type) {
		this.type = type;
	}
	
	/**
	 * Get a human-readable string representation of this token.
	 */
	@Override
	public String toString() {
		return this.type.name()+(value == null ? "" : "("+value+")");
	}
	
	/**
	 * Clone this lexical token.
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
