package fi.hut.ics.lime.common.logic.parser;

import java.util.LinkedList;

import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;
import fi.hut.ics.lime.common.logic.lexer.LexicalToken;
import fi.hut.ics.lime.common.logic.lexer.TokenType;
import fi.hut.ics.lime.common.logic.parser.PLTLParser;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.logic.parser.SyntacticException;
import junit.framework.TestCase;

/**
 * Tester for the parser of PLTL formulas.
 * @author jalampin
 */
public class PLTLParserTest extends TestCase {
	private LinkedList<LexicalToken> tokens;
	private PLTLParser pLTLParser;
	private final LexicalToken trueToken, falseToken;
	
	public PLTLParserTest() {
		trueToken = new LexicalToken(TokenType.TRUE);
		falseToken = new LexicalToken(TokenType.FALSE);
	}
	
	/**
	 * Set up the test.
	 */
	@Override
	public void setUp() {
		tokens = new LinkedList<LexicalToken>();
		pLTLParser = null;
	}
	/**
	 * Negative test for null argument in constructor - should produce
	 * an exception.
	 */
	public void testNull() {
		try {
			new PLTLParser(null);
		} catch(SyntacticException e) {
			return;
		}
		fail("Null argument does not produce syntactic exception");
	}
	/**
	 * Negative test for empty list of lexical tokens - should produce
	 * an exception.
	 */
	public void testEmpty() {
		try {
			new PLTLParser(tokens);
		} catch(SyntacticException e) {
			return;
		}
		fail("Empty token list does not produce syntactic exception");
	}
	/**
	 * Positive test for literal true.
	 *
	 */
	public void testTrueLiteral() {
		tokens.add(trueToken);
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			fail("Literal true produces a syntactic exception.");
		}
		if(!pLTLParser.getAst().equals(new Literal(true)))
			fail("Literal true produces wrong kind of ast");
	}
	/**
	 * Positive test for TRUE -> FALSE.
	 */
	public void testImplication() {
		BooleanExpression node;
		tokens.add(trueToken);
		tokens.add(new LexicalToken(TokenType.IMPLICATION));
		tokens.add(falseToken);
		node = new PropositionalConnective(PropositionalConnectiveType.IMPLICATION);
		node.setNth(1,new Literal(true));
		node.setNth(2,new Literal(false));
		
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			fail("TRUE -> FALSE produces a syntactic exception.");
		}
		if(!(pLTLParser.getAst().equals(node)))
			fail("TRUE -> FALSE produces wrong kind of ast");
	}
	
	/**
	 * Test "(p <-> q)".
	 */
	public void testEquivalenceWithParenthes() {
		tokens.add(new LexicalToken(TokenType.LPAREN));
		tokens.add(trueToken);
		tokens.add(new LexicalToken(TokenType.EQUIVALENCE));
		tokens.add(falseToken);
		tokens.add(new LexicalToken(TokenType.RPAREN));
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch (SyntacticException e) {
			fail("A valid formula: (p <-> q) causes a syntactic "+
					"exception. "+e.getMessage());
		}
	}
	/**
	 * Positive test for G FALSE.
	 *
	 */
	public void testGlobally() {
		BooleanExpression node;
		tokens.add(new LexicalToken(TokenType.GLOBALLY));
		tokens.add(falseToken);
		node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.GLOBALLY);
		node.setNth(1,new Literal(false));
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			fail("G FALSE produces a syntactic exception");
		}
		if(!(pLTLParser.getAst().equals(node)))
			fail("G FALSE produces wrong kind of ast");
	}
	/**
	 * Negative test for TRUE TRUE
	 */
	public void testInvalidFormulaTrueTrue() {
		tokens.add(trueToken);
		tokens.add(trueToken);
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			return;
		}
		fail("The formula: TRUE TRUE does not procude a syntactic error");	
	}
	/**
	 * Negative test for ->
	 *
	 */
	public void testInvalidFormulaImplication() {
		tokens.add(new LexicalToken(TokenType.IMPLICATION));
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			return;
		}
		fail("The formula: -> does not procude a syntactic error");	

	}
	
	/**
	 * Test "proposition1 T proposition2".
	 */
	public void testTrigger() {
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));
		tokens.add(new LexicalToken(TokenType.TRIGGER));
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			fail("Valid formula: proposition1 T proposition2 causes "+
					"a syntactic exception");
		}
	}

	/**
	 * Test "[TRUE, FALSE)s".
	 */
	public void testSimpleInterval() {
		tokens.add(new LexicalToken(TokenType.LBRACKET));
		tokens.add(trueToken);
		tokens.add(new LexicalToken(TokenType.COMMA));
		tokens.add(falseToken);
		tokens.add(new LexicalToken(TokenType.INTERVAL));
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch (SyntacticException e) {
			fail("Valid formula: [TRUE, FALSE)s causes a syntactic "+
					"exception.");
		}
	}
	
	/**
	 * Test "{(p -> q), r)w".
	 */
	public void testComplexInterval() {
		tokens.add(new LexicalToken(TokenType.LBRACKET));      // [
		tokens.add(new LexicalToken(TokenType.LPAREN));        // (
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));   // p
		tokens.add(new LexicalToken(TokenType.IMPLICATION));   // ->
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));   // q
		tokens.add(new LexicalToken(TokenType.RPAREN));        // )
		tokens.add(new LexicalToken(TokenType.COMMA));         // ,
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));   // r
		tokens.add(new LexicalToken(TokenType.WEAK_INTERVAL)); // )w
		try {
			pLTLParser = new PLTLParser(tokens);
		} catch(SyntacticException e) {
			fail("Valid formula: [(p -> q), r)w causes a syntactic "+
					"exception: "+e.getMessage());
		}
	}
	
	/**
	 * Negative test for a ->
	 *
	 */
	public void testPropositionImplies() {
		tokens.add(new LexicalToken(TokenType.NAMED_PROPOSITION));
		tokens.add(new LexicalToken(TokenType.IMPLICATION));
		try {
			new PLTLParser(tokens);
		} catch (SyntacticException e) {
			return;
		}
		fail("The formula a -> does not produce syntactic exception.");
	}
	
	/**
	 * Test "G method()".
	 */
	public void testGloballyCallProposition() {
		PLTLParser p = null;
		LexicalToken call = new LexicalToken(TokenType.NAMELESS_CALLPROPOSITION);
		
		tokens.addLast(new LexicalToken(TokenType.GLOBALLY));
		call.setValue("method");
		tokens.addLast(call);
		try {
			p = new PLTLParser(tokens);
		} catch (SyntacticException e) {
			fail("Could not parse 'G method()'");
		}
		assertNotNull("Parsed property was null", p);
		BooleanExpression n = p.getAst();
		assertNotNull("Root node was null", n);
		assertTrue("Root node was not a future time temporal operator.",n instanceof FutureTimeTemporalOperator);
		FutureTimeTemporalOperator f = (FutureTimeTemporalOperator) n;
		assertTrue("Root node was not Globally",f.getType() == FutureTimeTemporalOperatorType.GLOBALLY);
		n = f.getNth(1);
		assertNotNull(n);
		assertTrue(n instanceof PropositionNode);
		PropositionNode pNode = (PropositionNode) n;
		assertTrue(pNode.getPropositionKind() == PropositionKind.CALL);
		assertNotNull("Proposition node had no value",pNode.getValue());
		assertTrue(pNode.getValue().equals("method"));
	}
	
	/**
	 * Test "G (m() -> O(n()))".
	 */
	public void testGloballyWithPast() {
		PLTLParser p = null;
		tokens.add(new LexicalToken(TokenType.GLOBALLY));
		tokens.add(new LexicalToken(TokenType.LPAREN));
		tokens.add(new LexicalToken(TokenType.NAMELESS_CALLPROPOSITION));
		tokens.add(new LexicalToken(TokenType.IMPLICATION));
		tokens.add(new LexicalToken(TokenType.ONCE));
		tokens.add(new LexicalToken(TokenType.LPAREN));
		tokens.add(new LexicalToken(TokenType.NAMELESS_CALLPROPOSITION));
		tokens.add(new LexicalToken(TokenType.RPAREN));
		tokens.add(new LexicalToken(TokenType.RPAREN));
		try {
			p = new PLTLParser(tokens);
		} catch (SyntacticException e) {
			fail("Could not parse 'G (m() -> O(n()))'");
		}
		BooleanExpression n = p.getAst();
		assertNotNull("Root node was null", n);
		assertTrue(n instanceof FutureTimeTemporalOperator);
		FutureTimeTemporalOperator globally = (FutureTimeTemporalOperator) n;
		assertTrue(globally.getType() == FutureTimeTemporalOperatorType.GLOBALLY);
	}
}
