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
 * This is a visitor which converts ptLTL formulas in an abstract syntax
 * tree to negative normal form.
 * 
 * Firstly, the visitor will get rid of double negatives by doing the 
 * substitution !!p <=> p.
 * 
 * <ul>
 *  <li>! [*] p <=> <*> ! p</li>
 *  <li>! <*> p <=> [*] ! p</li>
 *  <li>! Y p <=> Z ! p</li>
 *  <li>! Z p <=> Y ! p</li>
 *  <li>! (p S q) <=> (!p T !q)</li>
 *  <li>! (p T q) <=> (!p S !q)</li> 
 * </ul>
 * 
 * @author jalampin
 *
 */

public class NegativeNormalFormModifier extends AbstractTreeModifier {
	public NegativeNormalFormModifier() {
		super(ProcessingStrategy.PREORDER);
	}
	/**
	 * 
	 */
	@Override
	public BooleanExpression visitPropositionalConnective(PropositionalConnective propositionalConnective) {
		PastTimeTemporalOperator oldPastTimeFormula, newPastTimeFormula;
		FutureTimeTemporalOperator oldFutureTimeFormula, newFutureTimeFormula;
		PropositionalConnective subConnective, subConnective2, not, not2;
		BooleanExpression subFormula, subFormula2;
		
		if(propositionalConnective.getType() != PropositionalConnectiveType.NOT)
			return propositionalConnective;
		if(propositionalConnective.getNth(1) instanceof PropositionalConnective) {
			subConnective = (PropositionalConnective) propositionalConnective.getNth(1);
			not = new PropositionalConnective(PropositionalConnectiveType.NOT);
			not2 = new PropositionalConnective(PropositionalConnectiveType.NOT);
			
			switch(subConnective.getType()) {
			// !!p <=> p
			case NOT: 
				return subConnective.getNth(1);
			// !(p && q) <=> (!p || !q)
			case AND:
				subConnective2 = new PropositionalConnective(PropositionalConnectiveType.OR);
				subConnective2.setNth(1,not);
				subConnective2.setNth(2,not2);
				not.setNth(1,subConnective.getNth(1));
				not2.setNth(1,subConnective.getNth(2));
				return subConnective2;
			// !(p <=> q) <=> (p ++ q)
			case EQUIVALENCE:
				subConnective2 = new PropositionalConnective(PropositionalConnectiveType.XOR);
				subConnective2.setNth(1,subConnective.getNth(1));
				subConnective2.setNth(2,subConnective.getNth(2));
				return subConnective2;
			// !(p -> q) <=> p && !q
			case IMPLICATION:
				subConnective2 = new PropositionalConnective(PropositionalConnectiveType.AND);
				subConnective2.setNth(1,subConnective.getNth(1));
				subConnective2.setNth(2,not);
				not.setNth(1,subConnective.getNth(1));
				return subConnective2;
			// !(p || q) <=> (!p && !q)
			case OR:
				subConnective2 = new PropositionalConnective(PropositionalConnectiveType.AND);
				subConnective2.setNth(1,not);
				subConnective2.setNth(2,not2);
				not.setNth(1,subConnective.getNth(1));
				not2.setNth(1,subConnective.getNth(2));
				return subConnective2;
			// !(p ++ q) <=> (p <=> q)
			case XOR:
				subConnective2 = new PropositionalConnective(PropositionalConnectiveType.EQUIVALENCE);
				subConnective2.setNth(1,subConnective.getNth(1));
				subConnective2.setNth(2,subConnective.getNth(2));
				return subConnective2;
			}
		}
		if(propositionalConnective.getNth(1) instanceof PastTimeTemporalOperator) {
			oldPastTimeFormula = (PastTimeTemporalOperator) propositionalConnective.getNth(1);
			
			subFormula = oldPastTimeFormula.getNth(1);
			subFormula2 = (oldPastTimeFormula.isBinaryOperator() ? oldPastTimeFormula.getNth(2) : null);

			switch(oldPastTimeFormula.getType()) {
			// ! [*] p <=> <*> ! p 
			case HISTORICALLY:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.ONCE);
				break;
				// ! <*> p <=> [*] ! p
			case ONCE:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.HISTORICALLY);
				break;
				// ! Z p <=> Y ! p
			case WEAK_PREVIOUSLY:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.PREVIOUSLY);
				break;
				// ! Y p <=> Z ! p
			case PREVIOUSLY:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.WEAK_PREVIOUSLY);
				break;
				// ! (p1 S p2) <=> (! p1) T (! p2)
			case SINCE:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.TRIGGER);
				break;
				// ! (p1 T p2) <=> (! p1) S (! p2)
			case TRIGGER:
				newPastTimeFormula = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.SINCE);
				break;
			default:
				throw new AssertionError("Operator does not have a dual operator.");
			}
			if(newPastTimeFormula.isUnaryOperator())
				return unarySubstitution(newPastTimeFormula, subFormula);
			else
				return binarySubstitution(newPastTimeFormula, subFormula, subFormula2);
		}
		if(propositionalConnective.getNth(1) instanceof FutureTimeTemporalOperator) {
			oldFutureTimeFormula = (FutureTimeTemporalOperator) propositionalConnective.getNth(1);
			subFormula = oldFutureTimeFormula.getNth(1);
			subFormula2 = (oldFutureTimeFormula.isBinaryOperator() ? oldFutureTimeFormula.getNth(2) : null);
			switch(oldFutureTimeFormula.getType()) {
			case FINALLY:
				newFutureTimeFormula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.GLOBALLY);
				break;
			case GLOBALLY: 
				newFutureTimeFormula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.FINALLY);
				break;
			case NEXT:
				newFutureTimeFormula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.NEXT);
				break;
			case RELEASE:
				newFutureTimeFormula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.STRONG_UNTIL);
				break;
			case STRONG_UNTIL:
				newFutureTimeFormula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.RELEASE);
				break;
			case WEAK_UNTIL:
				throw new AssertionError("Weak until has no dual operator.");
			default:
				throw new AssertionError("this code should never be reached");
			}
			if(newFutureTimeFormula.isUnaryOperator())
				return unarySubstitution(newFutureTimeFormula, subFormula);
			else
				return binarySubstitution(newFutureTimeFormula, subFormula, subFormula2);
		}
		return propositionalConnective;
	}
	private BooleanExpression unarySubstitution(BooleanExpression op, BooleanExpression subFormula) {
		PropositionalConnective not = new PropositionalConnective(PropositionalConnectiveType.NOT);
	
		not.setNth(1,subFormula);
		op.setNth(1,not);
		
		return op;
	}
	
	private BooleanExpression binarySubstitution(BooleanExpression op, BooleanExpression subFormula, BooleanExpression subFormula2) {
		PropositionalConnective not = new PropositionalConnective(PropositionalConnectiveType.NOT);
		PropositionalConnective not2 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		
		not.setNth(1,subFormula);
		not2.setNth(1,subFormula2);
		op.setNth(1,not);
		op.setNth(2,not2);
		
		return op;
	}
}
