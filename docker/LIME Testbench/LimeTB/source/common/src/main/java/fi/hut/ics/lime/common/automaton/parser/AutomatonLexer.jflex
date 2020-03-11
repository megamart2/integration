package fi.hut.ics.lime.common.automaton.parser;
import java_cup.runtime.*;

/**
  * A lexer for nfa_always specifications.
  * @author sliedes
  */
%%

%class AutomatonLexer
%unicode	// see jflex doc for why %unicode should be used
%cup
%char
%public

%{
	private Symbol symbol(int type) {
		return new Symbol(type, yychar, yychar+yylength());
	}
	
	private Symbol symbol(int type, Object value) {
		return new Symbol(type, yychar, yychar+yylength(), value);
	}
%}

WhiteSpace 		= [ \t\r\n\t\f]+
Identifier 		= [a-zA-Z$_][a-zA-Z0-9$_]*

%%

// keywords

"always_nfa"			{ return symbol(sym.ALWAYS_NFA); }
"if"					{ return symbol(sym.IF); }
"fi"					{ return symbol(sym.FI); }
"goto"					{ return symbol(sym.GOTO); }

// comments and whitespace

"/*" ~"*/"				|
"//" ~"\n"				|
{WhiteSpace}			{  /* ignore */ }

// tokens with values

//"<{" ~"}>"				{ return symbol(sym.NATIVE, yytext().substring(2,yylength()-2).trim()); }
{Identifier}			{ return symbol(sym.IDENTIFIER, yytext()); }

// other tokens without values

"{"						{ return symbol(sym.LBRACE); }
"}"						{ return symbol(sym.RBRACE); }
"::"					{ return symbol(sym.DOUBLE_COLON); }
"("						{ return symbol(sym.LPAREN); }
")"						{ return symbol(sym.RPAREN); }
":"						{ return symbol(sym.COLON); }
";"						{ return symbol(sym.SEMICOLON); }
"->"					{ return symbol(sym.ARROW); }
"=="					{ return symbol(sym.EQ); }
"!="					{ return symbol(sym.NEQ); }
"!"						{ return symbol(sym.NOT); }
"&&"					{ return symbol(sym.AND); }
"||"					{ return symbol(sym.OR); }
"0"						{ return symbol(sym.ZERO); }
"1"						{ return symbol(sym.ONE); }

// recognize # as in value propositions so we can give nicer error messages

"#"						{ /* ignore */ }
