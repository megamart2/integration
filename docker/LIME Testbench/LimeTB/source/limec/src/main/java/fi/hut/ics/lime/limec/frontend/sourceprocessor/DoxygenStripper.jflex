package fi.hut.ics.lime.limec.frontend.sourceprocessor;
import java_cup.runtime.*;

/**
  * @author lharpf
  */
%%

%class DoxygenStripper
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

JavaDocStyle		= "/**" ~"*/"
QtStyle				= "/*!" ~"*/"
LineComment			= "///" ~"\n" | "//!" ~"\n"
ISLComment			= "/*@" {ISLCommentContent} "@*/"
ISLCommentContent	= ( [^*] | \*+ [^/*] )*
Other				= . | \n

%%

// Doxygen-comments that are thrown away

{JavaDocStyle}			{ /* ignore */ }
{QtStyle}				{ /* ignore */ }
{LineComment}			{ /* ignore */ }

// ISL-comments that are converted into Doxygen-comments for later processing

{ISLComment}			{
						  /* Pass everything except the tags marking the
						  	 beginning and end of the ISL comment to the
						  	 parser. 
						  	 
						  	 We replace the tags marking the beginning
						  	 of ISL comments with Doxygen tags. */
						  return symbol(sym.OTHER,
						  	"/**\\verbatim " + 
						  	yytext().substring(3, yylength()-3).trim() + 
						  	"\\endverbatim*/");
						}
						
// Other parts of the source

{Other}					{ 	return symbol(sym.OTHER, yytext()); }
