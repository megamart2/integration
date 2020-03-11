package fi.hut.ics.lime.common.logic.ast.node;

public enum PastTimeTemporalOperatorType {
	// unary:
	PREVIOUSLY, WEAK_PREVIOUSLY, ONCE, HISTORICALLY, START, END,
	// binary:
	SINCE, WEAK_SINCE, TRIGGER, INTERVAL, WEAK_INTERVAL
}
