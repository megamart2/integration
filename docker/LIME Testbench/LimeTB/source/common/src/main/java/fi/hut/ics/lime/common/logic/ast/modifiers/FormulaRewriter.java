package fi.hut.ics.lime.common.logic.ast.modifiers;

import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;
/**
 * This visitor rewrites the operators without a dual
 * operator to ones that do have.
 * @author jalampin
 *
 */
public class FormulaRewriter extends AbstractTreeModifier {
	
	public FormulaRewriter() {
		super(ProcessingStrategy.POSTORDER);
	}
	
	/**
	 * Rewrites future formula 'weak until'
	 * p Uw q <=> (p U q) || G p
	 */
	@Override
	public BooleanExpression visitFutureTimeTemporalFormula(FutureTimeTemporalOperator futureTimeTemporalOperator) {
		PropositionalConnective or;
		FutureTimeTemporalOperator strongUntil, globally;
		
		// p Uw q <=> (p U q) || G p
		if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.WEAK_UNTIL) {
			or = new PropositionalConnective(PropositionalConnectiveType.OR);
			strongUntil = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.STRONG_UNTIL);
			globally = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.GLOBALLY);
			or.setNth(1,strongUntil);
			or.setNth(2,globally);
			strongUntil.setNth(1,futureTimeTemporalOperator.getNth(1));
			strongUntil.setNth(2,futureTimeTemporalOperator.getNth(2));
			globally.setNth(1,futureTimeTemporalOperator.getNth(1));
			return or;
		}
		
		return futureTimeTemporalOperator;
	}
	
	/**
	 * Rewrites past time formulas: 'strong interval', 'end', start', 'weak since'
	 * and 'weak interval'.
	 * [f, g)s <=> !g && ((Y !g) S f)
	 * end(f) <=> !f && Y f
	 * start(f) <=> f && !Y f
	 * f Sw g <=> (H f) || (f S g)
	 * [f, g)w <=> (H !G) || [f, g)s
	 */
	@Override
	public BooleanExpression visitPastTimeTemporalFormula(PastTimeTemporalOperator pastTimeTemporalOperator) {
		PropositionalConnective and, not1, not2, or;
		PastTimeTemporalOperator since, historically, previously;
		
		or = new PropositionalConnective(PropositionalConnectiveType.OR);
		and = new PropositionalConnective(PropositionalConnectiveType.AND);
		not1 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		not2 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		since = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.SINCE);
		previously = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.PREVIOUSLY);
		historically = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.HISTORICALLY);
		
		switch(pastTimeTemporalOperator.getType()) {
		// [f, g)s <=> !g && ((Y !g) S f)
		case INTERVAL : 			
			and.setNth(1,not1);
			and.setNth(2,since);
			not1.setNth(1,pastTimeTemporalOperator.getNth(2).clone());
			since.setNth(1,previously);
			previously.setNth(1,not2);
			not2.setNth(1,pastTimeTemporalOperator.getNth(2));
			since.setNth(2,pastTimeTemporalOperator.getNth(1));
			
			return and;
		// end(f) <=> !f && Y f
		case END: 
			and.setNth(1,not1);
			and.setNth(2,previously);
			not1.setNth(1,pastTimeTemporalOperator.getNth(1).clone());
			previously.setNth(1,pastTimeTemporalOperator.getNth(1));
			return and;
		// start(f) <=> f && !(Y f)
		case START:
			and.setNth(1,pastTimeTemporalOperator.getNth(1).clone());
			and.setNth(2,not1);
			not1.setNth(1,previously);
			previously.setNth(1,pastTimeTemporalOperator.getNth(1));
			return and;
		// f Sw g <=> (H f) || (f S g)
		case WEAK_SINCE:
			or.setNth(1,historically);
			or.setNth(2,since);
			historically.setNth(1,pastTimeTemporalOperator.getNth(1).clone());
			since.setNth(1,pastTimeTemporalOperator.getNth(1));
			since.setNth(2,pastTimeTemporalOperator.getNth(2));
			return or;
		// [f, g)w <=> (H !G) || [f, g)s
		case WEAK_INTERVAL:
			or.setNth(1,historically);
			historically.setNth(1,not1);
			not1.setNth(1,pastTimeTemporalOperator.getNth(2).clone());
			PastTimeTemporalOperator interval;
			interval = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.INTERVAL);
			interval.setNth(1,pastTimeTemporalOperator.getNth(1));
			interval.setNth(2,pastTimeTemporalOperator.getNth(2));
			or.setNth(2,this.visitPastTimeTemporalFormula(interval));
			return or;
		case HISTORICALLY:
		case ONCE:
		case PREVIOUSLY:
		case SINCE:
		case TRIGGER:
		case WEAK_PREVIOUSLY:
			/* no op */
		}
		return pastTimeTemporalOperator;
	}
}
