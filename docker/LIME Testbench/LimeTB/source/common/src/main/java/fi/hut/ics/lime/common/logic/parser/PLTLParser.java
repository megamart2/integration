/**
 * This class is a recursive descent parser for (both past and future time)
 * temporal logic formulas.
 */
 
 /* Various parse functions (non-terminals are marked with '):
  * A' := D'B' | [D',D'C' 
  * B' := S D' | Sw D' | V D' | T D' | U D' | Uw D' | null
  * C' := )s | )w
  * D' := F'E'
  * E' := <-> F' | null
  * F' := H'G'
  * G' := -> H' | null
  * H' := J'I'
  * I' := && H' | null
  * J' := L'K'
  * K' := ++ J | null
  * L' := N'M'
  * M' := || L' | null
  * N' := !N' | Y N' | Z N' | <*> N' | [*] N' | X N' | <> N' |
  *       [] N' | End(N') | Start(N') | O'
  * O' := (A') | TRUE | FALSE | proposition
  */
package fi.hut.ics.lime.common.logic.parser;
import java.util.*;

import fi.hut.ics.lime.common.logic.ast.node.*;
import fi.hut.ics.lime.common.logic.lexer.LexicalToken;
import fi.hut.ics.lime.common.logic.lexer.TokenType;
/**
 * A recursive descent parser for PLTL formulas.
 * Also includes the AST.
 * @author jalampin
 */
public class PLTLParser {
	private BooleanExpression ast;
	private LexicalToken token;
	private Iterator<LexicalToken> i;
	
	/**
	 * @param lexedProperty lexical tokens to be parsed.
	 * @throws SyntacticException
	 */
	public PLTLParser(LinkedList<LexicalToken> lexedProperty) throws 
		SyntacticException {
		if(lexedProperty == null) {
			throw new SyntacticException("Unable to parse null");
		}
		i = lexedProperty.iterator();
		nextToken();
		this.ast = parseA();		
	}
	
	/**
	 * Getter for the abstract syntax tree corresponding to the lexical symbols of
	 * the property.
	 * @return The root node of the corresponding abstract syntax tree.
	 */
	public BooleanExpression getAst() {
		return ast;
	}
	
	private BooleanExpression parseA() throws SyntacticException{
		BooleanExpression first, second, node;
		if(token == null)
			throw new SyntacticException("An unexpected empty syntax structure encountered.");
		
		if(token.getType() == TokenType.LBRACKET) {
			nextToken();
			first = parseD();
			if(!(token.getType() == TokenType.COMMA))
				throw new SyntacticException("Expecting comma separator in interval definition."+
						"Got "+token.toString()+".");
			nextToken();
			second = parseD();
			node = parseC();
			node.setNth(1,first);
			node.setNth(2,second);
		}
		else {
			first = parseD();
			node = parseB();
			if(node != null)
				node.setNth(1,first);
			else
				node = first;
		}
		return node;
	}
	
	private BooleanExpression parseB() throws SyntacticException {
		BooleanExpression node;
		TokenType tokenType;
		if(token == null || token.getType() == TokenType.RPAREN)
			return null;
		
		tokenType = token.getType();
		
		if(tokenType == TokenType.SINCE) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.SINCE);
		} else if(tokenType == TokenType.WEAK_SINCE) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.WEAK_SINCE);
		} else if(tokenType == TokenType.UNTIL) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.STRONG_UNTIL);
		} else if(tokenType == TokenType.WEAK_UNTIL) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.WEAK_UNTIL);
		} else if(tokenType == TokenType.RELEASE) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.RELEASE);
		} else if(tokenType == TokenType.TRIGGER) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.TRIGGER);
		} else {
			throw new SyntacticException("Unexpected lexical token: "+token.toString());
		}
		nextToken();
		node.setNth(2,parseD());
		return node;
	}
	
	private BooleanExpression parseC() throws SyntacticException {
		BooleanExpression node;
		TokenType tokenType = token.getType();
		if(tokenType == TokenType.INTERVAL) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.INTERVAL);
		}
		else if(tokenType == TokenType.WEAK_INTERVAL) {
			node =  new PastTimeTemporalOperator(PastTimeTemporalOperatorType.WEAK_INTERVAL);
		}
		else {
			throw new SyntacticException("Unexpected end for an interval formula "+
					token.toString());
		}
		nextToken();
		return node;
	}
	
	private BooleanExpression parseD() throws SyntacticException {
		BooleanExpression first, node;
		first = parseF();
		node = parseE();
		if(node == null)
			return first;
		node.setNth(1,first);
		return node;
	}
	
	private BooleanExpression parseE() throws SyntacticException {
		BooleanExpression node;
		if(token != null && token.getType() == TokenType.EQUIVALENCE) {
			node = new PropositionalConnective(PropositionalConnectiveType.EQUIVALENCE);
			nextToken();
			node.setNth(2,parseF());
			return node;
		}
		else {
			return null;
		}
	}
	
	private BooleanExpression parseF() throws SyntacticException {
		BooleanExpression first, node;
		first = parseH();
		node  = parseG();
		if(node == null)
			return first;
		node.setNth(1,first);
		return node;
	}
	
	private BooleanExpression parseG() throws SyntacticException {
		BooleanExpression node;
		if(token != null && token.getType() == TokenType.IMPLICATION) {
			node = new PropositionalConnective(PropositionalConnectiveType.IMPLICATION);
			nextToken();
			node.setNth(2,parseH());
			return node;
		}
		else {
			return null;
		}
	}
	
	private BooleanExpression parseH() throws SyntacticException {
		BooleanExpression first, node;
		first = parseJ();
		node = parseI();
		if(node == null)
			return first;
		node.setNth(1,first);
		return node;
	}
	
	private BooleanExpression parseI() throws SyntacticException {
		BooleanExpression node;
		if(token != null && token.getType() == TokenType.OR) {
			node = new PropositionalConnective(PropositionalConnectiveType.OR);
			nextToken();
			node.setNth(2,parseH()); 
			return node;
		}
		else {
			return null; 
		}
	}
	
	private BooleanExpression parseJ() throws SyntacticException {
		BooleanExpression first, node;
		first = parseL();
		node = parseK();
		if(node == null)
			return first;
		node.setNth(1,first);
		return node;
	}
	
	private BooleanExpression parseK() throws SyntacticException {
		BooleanExpression node;
		if(token != null && token.getType() == TokenType.XOR) {
			node = new PropositionalConnective(PropositionalConnectiveType.XOR);
			nextToken();
			node.setNth(2,parseJ());
			return node;
		}
		else {
			return null;
		}
	}
	private BooleanExpression parseL() throws SyntacticException {
		BooleanExpression first, node;
		first = parseN();
		node  = parseM();
		if(node == null)
			return first;
		node.setNth(1,first);
		return node;
	}
	private BooleanExpression parseM() throws SyntacticException {
		BooleanExpression node;
		if(token != null && token.getType() == TokenType.AND) {
			node = new PropositionalConnective(PropositionalConnectiveType.AND);
			nextToken();
			node.setNth(2,parseL());
			return node;
		}
		else {
			return null;
		}
	}
	
	private BooleanExpression parseN() throws SyntacticException {
		BooleanExpression node;
		TokenType tokenType = (token != null ? token.getType() : null);
		
		if(tokenType == TokenType.NOT) {
			node = new PropositionalConnective(PropositionalConnectiveType.NOT);
		}
		else if(tokenType == TokenType.HISTORICALLY) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.HISTORICALLY);
		}
		else if(tokenType == TokenType.ONCE) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.ONCE);
		}
		else if(tokenType == TokenType.PREVIOUSLY) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.PREVIOUSLY);
		}
		else if(tokenType == TokenType.WEAK_PREVIOUSLY) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.WEAK_PREVIOUSLY);
		}
		else if(tokenType == TokenType.START) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.START);
		}
		else if(tokenType == TokenType.END) {
			node = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.END);
		}
		else if(tokenType == TokenType.GLOBALLY) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.GLOBALLY);
		}
		else if(tokenType == TokenType.FINALLY) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.FINALLY);
		}
		else if(tokenType == TokenType.NEXT) {
			node = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.NEXT);	
		}
		else {
			return parseO();
		}
		nextToken();
		node.setNth(1,parseN());
		return node;
	}
	
	
	private BooleanExpression parseO() throws SyntacticException {
		BooleanExpression node;
		TokenType tokenType;

		// FIXME check if this is really correct
		final String expect = "Expected one of '(', 'T', 'F', named proposition identifier," +
		" call proposition, <{ ... }>.";
		
		if(token == null)
			throw new SyntacticException("Unexpected end of formula.\n"+expect);
		
		tokenType = token.getType();
		if(tokenType == TokenType.LPAREN) {
			nextToken();
			node = parseA();
			if(token.getType() != TokenType.RPAREN)
				throw new SyntacticException("Unmatched parentheses - expecting: "+
						"RPAREN got "+token.toString());
			nextToken();
			return node;
		}
		else if(tokenType == TokenType.TRUE) {
			node = new Literal(true);
		}
		else if(tokenType == TokenType.FALSE) {
			node = new Literal(false);
		}
		else if(tokenType == TokenType.NAMED_PROPOSITION) {
			PropositionNode p = new PropositionNode(token.getValue());
			p.setPropositionKind(PropositionKind.NAMED);
			node = p;
		}
		else if(tokenType == TokenType.NAMELESS_CALLPROPOSITION) {
			PropositionNode p = new PropositionNode(token.getValue());
			p.setPropositionKind(PropositionKind.CALL);
			p.setValue(token.getValue());
			node = p;
		}
		else if(tokenType == TokenType.NAMELESS_VALUEPROPOSITION) {
			PropositionNode p = new PropositionNode(token.getValue());
			p.setPropositionKind(PropositionKind.VALUE);
			p.setValue(token.getValue());
			node = p;
		}
		else
			throw new SyntacticException("Unexpected lexical symbol: \""+token.getValue()+"\".\n"+expect);
		nextToken();
		return node;
	}
	

	private LexicalToken nextToken() {
		token = (i.hasNext() ? i.next() : null);
		return token;
	}
}
