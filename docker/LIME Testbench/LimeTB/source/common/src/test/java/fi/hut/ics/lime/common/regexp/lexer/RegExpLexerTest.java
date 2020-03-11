package fi.hut.ics.lime.common.regexp.lexer;

import java.util.Iterator;
import java.util.LinkedList;

import fi.hut.ics.lime.common.regexp.lexer.LexicalException;
import fi.hut.ics.lime.common.regexp.lexer.RegExpLexer;
import fi.hut.ics.lime.common.regexp.lexer.token.LexicalToken;
import fi.hut.ics.lime.common.regexp.lexer.token.TokenType;

import junit.framework.TestCase;

/**
 * Tester for RegExpLexer
 * @author jalampin
 */
public class RegExpLexerTest extends TestCase {
	private RegExpLexer regExpLexer = new RegExpLexer();
	private LinkedList<LexicalToken> tokens = null;
	
	/**
	 * Set up the test.
	 */
	@Override
	protected void setUp() throws Exception {
		tokens = null;
	}
	
	/**
	 * Test null argument
	 *
	 */
	public void testNull() {
		try {
			regExpLexer.lexRegExp(null);
		} catch (LexicalException e) {
			return;
		}
		fail("null argument should cause an exception.");
	}
	
	/**
	 * Test closure symbol *
	 *
	 */
	public void testClosure() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("*");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 1 token, got "+tokens.size(), tokens.size() == 1);
		tokenType = i.next().getType();
		assertTrue("Expected CLOSURE, got "+ tokenType.name(), tokenType == TokenType.CLOSURE);
	}
	
	/**
	 * Test proposition
	 *
	 */
	public void testPropositional() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("aregexp");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expect 1 token, got "+tokens.size(),tokens.size() == 1);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
	}
	
	/**
	 * Test union symbol
	 *
	 */
	public void testUnion() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("|");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue(tokens.size() == 1);
		tokenType = i.next().getType();
		assertTrue("Expected UNION, got "+ tokenType.name(), tokenType == TokenType.UNION);
	}
	
	/**
	 * Test concatenation with propositions and closure
	 * 
	 */
	public void testConcatenationAndClosure() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("(u ; l)*");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue(tokens.size() == 6);
		tokenType = i.next().getType();
		assertTrue("Expected LPAREN, got "+ tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected CONCATENATION, got "+ tokenType.name(), tokenType == TokenType.CONCATENATION);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected CLOSURE, got "+ tokenType.name(), tokenType == TokenType.CLOSURE);
	}
	
	/**
	 * Test union of propositional formulas
	 *
	 */
	public void testPropositionalUnion() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("a -> f | e -> b");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 3 tokens got: "+tokens.size(), tokens.size() == 3);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected UNION, got "+ tokenType.name(), tokenType == TokenType.UNION);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
	}
	
	/**
	 * Test proposition in parenthesis
	 *
	 */
	public void testParenthesis() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("(a)");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 3 tokens got: "+tokens.size(), tokens.size() == 3);
		tokenType = i.next().getType();
		assertTrue("Expected LPAREN, got "+ tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
	}
	
	/**
	 * Test nameless value proposition
	 *
	 */
	public void testValueProposition() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("<{ a || b }>");
		} catch (LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		LexicalToken l;
		assertTrue("Expected 1 token, got "+tokens.size(), tokens.size() == 1);
		l = i.next();
		tokenType = l.getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		assertEquals("<{ a || b }>", l.getValue());
	}
	
	/**
	 * Test call proposition
	 *
	 */
	public void testCallProposition() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("call()");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 1 tokens got: "+tokens.size(), tokens.size() == 1);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
	}
	
	/**
	 * Test call proposition closure
	 *
	 */
	public void testCallClosure() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("(call())*");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 4 tokens got: "+tokens.size(), tokens.size() == 4);
		tokenType = i.next().getType();
		assertTrue("Expected LPAREN, got "+ tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected CLOSURE, got "+ tokenType.name(), tokenType == TokenType.CLOSURE);
	}
	
	/**
	 * Test union of call and value propositions:
	 *
	 */
	public void testCallValueUnion() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("call() | <{ x > 0 }>");
		} catch(LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 3 tokens got: "+tokens.size(), tokens.size() == 3);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected UNION, got "+ tokenType.name(), tokenType == TokenType.UNION);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
	}
	
	/**
	 * Test more complex regular expression
	 *
	 */
	public void testComplexRegExp() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("(a -> b)* ; (c && a)");
		} catch (LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 8 tokens, got "+tokens.size(), tokens.size() == 8);
		tokenType = i.next().getType(); 
		assertTrue("Expected LPAREN, got "+tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected CLOSURE, got "+ tokenType.name(), tokenType == TokenType.CLOSURE);
		tokenType = i.next().getType();
		assertTrue("Expected CONCATENATION, got "+ tokenType.name(), tokenType == TokenType.CONCATENATION);
		tokenType = i.next().getType();
		assertTrue("Expected LPAREN, got "+tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
	}
	
	/**
	 * Test "(test() -> <{ #s.length() > 0 }>)*".
	 */
	public void testCallImpliesValueClosure() {
		TokenType tokenType;
		try {
			tokens = regExpLexer.lexRegExp("(test() -> <{ #s.length() > 0 }>)*");
		} catch (LexicalException e) {
			fail(e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 8 tokens, got "+tokens.size(), tokens.size() == 4);
		tokenType = i.next().getType(); 
		assertTrue("Expected LPAREN, got "+tokenType.name(), tokenType == TokenType.LPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected PROPOSITIONAL, got "+ tokenType.name(), tokenType == TokenType.PROPOSITIONAL);
		tokenType = i.next().getType();
		assertTrue("Expected RPAREN, got "+ tokenType.name(), tokenType == TokenType.RPAREN);
		tokenType = i.next().getType();
		assertTrue("Expected CLOSURE, got "+ tokenType.name(), tokenType == TokenType.CLOSURE);
	}
}
