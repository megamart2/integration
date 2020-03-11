package fi.hut.ics.lime.common.logic.ast.node;

public enum FutureTimeTemporalOperatorType {
	// unary:
	NEXT, FINALLY, GLOBALLY, 
	// binary:
	STRONG_UNTIL, WEAK_UNTIL, RELEASE
}
