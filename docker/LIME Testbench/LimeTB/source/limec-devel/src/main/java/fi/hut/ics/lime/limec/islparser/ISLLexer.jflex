package fi.hut.ics.lime.limec.islparser;
import java_cup.runtime.*;

/**
  * @author sliedes jalampin lharpf
  */
%%

%class ISLLexer
%unicode	// see jflex doc for why %unicode should be used
%cup
%line
%column
%public

%{
	private Symbol symbol(int type) {
		return new Symbol(type, yyline, yycolumn);
	}
	
	private Symbol symbol(int type, Object value) {
		return new Symbol(type, yyline, yycolumn, value);
	}
%}

WhiteSpace 		= [ \t\r\n\t\f]+
Identifier 		= [a-zA-Z$_][a-zA-Z0-9$_]*
String			= \"\" | \" ~ ([^\\]\")

%%

// keywords
"CallSpecifications"		{ return symbol(sym.CALLSPEC); }
"ReturnSpecifications"		{ return symbol(sym.RETURNSPEC); }
"Observe"					{ return symbol(sym.OBSERVE); }
"Instance"					{ return symbol(sym.INSTANCE); }

// comments and whitespace

{WhiteSpace}			{ /* ignore */ }

// tokens with values

{Identifier}			{ return symbol(sym.IDENTIFIER, yytext()); }
{String}				{ return symbol(sym.STRING,
									    yytext().substring(1,
									    	yylength()-1)); }

// other tokens without values

"{"						{ return symbol(sym.LBRACE); }
"}"						{ return symbol(sym.RBRACE); }
"("						{ return symbol(sym.LPAREN); }
")"						{ return symbol(sym.RPAREN); }
"="						{ return symbol(sym.EQ); }
","						{ return symbol(sym.COMMA); }
