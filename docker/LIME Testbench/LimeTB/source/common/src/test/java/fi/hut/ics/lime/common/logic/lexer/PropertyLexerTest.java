package fi.hut.ics.lime.common.logic.lexer;

import java.util.Iterator;
import java.util.LinkedList;

import fi.hut.ics.lime.common.logic.lexer.LexicalException;
import fi.hut.ics.lime.common.logic.lexer.LexicalToken;
import fi.hut.ics.lime.common.logic.lexer.PropertyLexer;
import fi.hut.ics.lime.common.logic.lexer.TokenType;

import junit.framework.TestCase;

/**
 * Tester for the lexer of temporal logic formulas.
 * @author jalampin
 */
public class PropertyLexerTest extends TestCase {

	private final PropertyLexer lexer = new PropertyLexer();
	private LinkedList<LexicalToken> tokens;
	private TokenType got;
	
	/**
	 * Set up the test.
	 */
	@Override
	public void setUp() {
		tokens = null;
		got = null;
	}
	
	/**
	 * Test a proposition.
	 */
	public void testProposition() {
		try {
			tokens = lexer.lexProperty("proposition");
		} catch(LexicalException e) {
			fail("Could not lex 'proposition' - "+e.getMessage());
		}
		assertTrue(tokens.size() == 1);
		got = tokens.getFirst().getType();
		assertTokenType(TokenType.NAMED_PROPOSITION, got);
	}
	
	/**
	 * Test an unnamed value proposition.
	 */
	public void testNamelessValueProposition() {
		try {
			tokens = lexer.lexProperty("<{ #this.x }>");
		} catch (LexicalException e) {
			fail("Could not lex '<{ #this.x }>' - "+e.getMessage());
		}
		assertTrue(tokens.size() == 1);
		assertTrue(tokens.getFirst().getType() == TokenType.NAMELESS_VALUEPROPOSITION);
	}
	
	/**
	 * Test an unnamed call proposition.
	 */
	public void testNamelessCallProposition() {
		try {
			tokens = lexer.lexProperty("test()");
		} catch(LexicalException e) {
			fail("Could not lex 'test()' - "+e.getMessage());
		}
		assertTrue("Expected 1 token, got "+tokens.size(), tokens.size() == 1);
		assertTrue("Expected NAMELESS_CALLPROPOSITION, got " +tokens.getFirst().getType().name(),
				tokens.getFirst().getType() == TokenType.NAMELESS_CALLPROPOSITION);
	}
	
	/**
	 * Test the and lexeme (&&).
	 */
	public void testAnd() {
		try {
			tokens = lexer.lexProperty("&&");
		} catch(LexicalException e) {
			fail("Could not lex '&&' - "+e.getMessage());
		}
		assertTrue(tokens.getFirst().getType() == TokenType.AND);
		assertTrue(tokens.size() == 1);
	}
	
	/**
	 * Test trigger (T).
	 */
	public void testTrigger() {
		try {
			tokens = lexer.lexProperty("p T q");
		} catch(LexicalException e) {
			fail("Could not lex 'p T q' - "+e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue(i.next().getType() == TokenType.NAMED_PROPOSITION);
		assertTrue(i.next().getType() == TokenType.TRIGGER);
		assertTrue(i.next().getType() == TokenType.NAMED_PROPOSITION);
		assertTrue(tokens.size() == 3);
	}
	
	/**
	 * Test parenthesis.
	 */
	public void testParenthesis() {
		try {
			tokens = lexer.lexProperty("(p S q)");
		} catch(LexicalException e) {
			fail("Could not lex '(p S q)' - "+e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue(i.next().getType() == TokenType.LPAREN);
		assertTrue(i.next().getType() == TokenType.NAMED_PROPOSITION);
		assertTrue(i.next().getType() == TokenType.SINCE);
		assertTrue(i.next().getType() == TokenType.NAMED_PROPOSITION);
		assertTrue(i.next().getType() == TokenType.RPAREN);
		assertTrue(tokens.size() == 5);
	}
	
	/**
	 * Test "(k Uw d())"
	 */
	public void testCallAsOperand() {
		try {
			tokens = lexer.lexProperty("(k Uw d())");
		} catch(LexicalException e) {
			fail("Could not lex '(k Uw d())' - "+e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 5 tokens, got "+tokens.size(), tokens.size() == 5);
		got = i.next().getType();
		assertTokenType(TokenType.LPAREN, got);
		assertTrue("Expected LPAREN, got "+got.name(), got == TokenType.LPAREN);
		got = i.next().getType();
		assertTrue("Expected NAMED_PROPOSITION, got "+got.name(), got == TokenType.NAMED_PROPOSITION);
		got = i.next().getType();
		assertTrue("Expected WEAK_UNTIL, got "+got.name(), got == TokenType.WEAK_UNTIL);
		got = i.next().getType();
		assertTrue("Expected NAMELESS_CALLPROPOSITION, got "+got.name(), got == TokenType.NAMELESS_CALLPROPOSITION);
		got = i.next().getType();
		assertTrue("Expected RPAREN, got "+ got.name(), got == TokenType.RPAREN);
	}
	
	/**
	 * Test "G unlock()"
	 */
	public void testGloballyCallProposition() {
		try {
			tokens = lexer.lexProperty("G unlock()");
		} catch(LexicalException e) {
			fail("Could not lex 'G unlock()'"+e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 2 tokens, got "+tokens.size(), tokens.size() == 2);
		got = i.next().getType();
		assertTokenType(TokenType.GLOBALLY, got);
		LexicalToken l = i.next();
		got = l.getType();
		assertTokenType(TokenType.NAMELESS_CALLPROPOSITION, got);
		assertTrue("Expected value: unlock, got "+l.getValue(), l.getValue().equals("unlock"));
	}
	
	/**
	 * Test "G H <{ x > 0 }>"
	 */
	public void testGloballyHistoricallyValueProposition() {
		try {
			tokens = lexer.lexProperty("G H <{ x > 0 }>");
		} catch(LexicalException e) {
			fail("Could not lex 'G H <{ x > 0 }>'"+e.getMessage());
		}
		Iterator<LexicalToken> i = tokens.iterator();
		assertTrue("Expected 3 tokens, got "+tokens.size(), tokens.size() == 3);
		got = i.next().getType();
		assertTokenType(TokenType.GLOBALLY, got);
		LexicalToken l = i.next();
		got = l.getType();
		assertTokenType(TokenType.HISTORICALLY, got);
		l = i.next();
		got = l.getType();
		assertTokenType(TokenType.NAMELESS_VALUEPROPOSITION, got);
	}

	/**
	 * Test "test() -> <{ %s.length() > 0 }>"
	 */
	public void testCallImpliesValue() {
		try {
			tokens = lexer.lexProperty("test() -> <{ #s.length() > 0 }>");
		} catch (LexicalException e) {
			fail("Could not lex: test() -> <{ #s.length() > 0 }>");
		}
		assertTrue("Expected 3 tokens, got "+tokens.size(), tokens.size() == 3);
		Iterator<LexicalToken> i = tokens.iterator();
		got = i.next().getType();
		assertTokenType(TokenType.NAMELESS_CALLPROPOSITION, got);
		got = i.next().getType();
		assertTokenType(TokenType.IMPLICATION, got);
		got = i.next().getType();
		assertTokenType(TokenType.NAMELESS_VALUEPROPOSITION, got);
	}
	
	/**
	 * Test that a non-terminating value proposition causes a LexicalException.
	 */
	public void testTestNonterminatingValue() {
		try {
			tokens = lexer.lexProperty("<{ #s.length() > 0");
		} catch (LexicalException e) {
			return;
		} catch (RuntimeException e) {
			fail("Non-terminating value proposition causes runtime exception");
		}
		
		fail("Non-terminating value proposition causes no exception");
	}
	
	/**
	 * Test that two values work. 
	 */
	public void testTwoValues() {
		try {
			tokens = lexer.lexProperty("<{ x > 0 }> && <{ y < 0 }>");
		} catch (LexicalException e) {
			fail("Could not lex: <{ x > 0 }> && <{ y < 0 }>");
		}
		assertTrue("Expected 3 tokens, got "+tokens.size(), tokens.size() == 3);
	}
	
	/**
	 * Test "G (start() -> O (ignite()))".
	 */
	public void testGloballyWithPast() {
		String string = "G (start() -> O (ignite()))";
		try {
			tokens = lexer.lexProperty(string);
		} catch (LexicalException e) {
			fail("Could not lex: "+string);
		}
		assertTrue("Expected 9 tokens, got "+tokens.size(), tokens.size() == 9);
		Iterator<LexicalToken> i = tokens.iterator();
		got = i.next().getType();
		assertTokenType(TokenType.GLOBALLY, got);
		got = i.next().getType();
		assertTokenType(TokenType.LPAREN, got);
		got = i.next().getType();
		assertTokenType(TokenType.NAMELESS_CALLPROPOSITION, got);
		got = i.next().getType();
		assertTokenType(TokenType.IMPLICATION, got);
		got = i.next().getType();
		assertTokenType(TokenType.ONCE, got);
		got = i.next().getType();
		assertTokenType(TokenType.LPAREN, got);
		got = i.next().getType();
		assertTokenType(TokenType.NAMELESS_CALLPROPOSITION, got);
		got = i.next().getType();
		assertTokenType(TokenType.RPAREN, got);
		got = i.next().getType();
		assertTokenType(TokenType.RPAREN, got);
	}
	
	private void assertTokenType(TokenType expected, TokenType got) {
		assertTrue("Expected "+expected.name()+", got "+ got.name(), expected == got);
	}
}
