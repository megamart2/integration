package fi.hut.ics.lime.common.logic.lexer;

public enum TokenType {
	// syntax tokens:
	COMMA, LBRACKET, LPAREN, RPAREN,
	// literals and propositions:
	TRUE, FALSE, NAMED_PROPOSITION, NAMELESS_VALUEPROPOSITION, NAMELESS_CALLPROPOSITION,
	// propositional connectives:
	NOT, AND, OR, XOR, IMPLICATION, EQUIVALENCE,
	// standard past time operators:
	HISTORICALLY, ONCE, PREVIOUSLY, WEAK_PREVIOUSLY, SINCE, WEAK_SINCE, TRIGGER,
	// monitoring operators (ptLTL):
	WEAK_INTERVAL, INTERVAL, START, END,
	// standard future time operators:
	GLOBALLY, FINALLY, NEXT, UNTIL, WEAK_UNTIL, RELEASE
}
