package fi.hut.ics.lime.common.logic.ast.modifiers;

import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.FutureTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;

/**
 * This class is a TreeModifier that will do the following substitutions to a tree, which
 * contains Nodes of logic formulas:
 *
 * <ul>
 * <li>[] FALSE == FALSE</li>
 * <li>[] TRUE == TRUE</li>
 * <li>[][] p == [] p</li>
 * <li>[] (p V q) == [] q</li>
 * <li>X TRUE == TRUE</li>
 * <li><> FALSE == FALSE</li>
 * <li><> TRUE == TRUE</li>
 * <li><><> p == <> p</li>
 * <li><> (p U q) == <> q</li>
 * <li>(FALSE U p) == p</li>
 * <li>(p U FALSE) == FALSE</li>
 * <li>(p U TRUE) == TRUE</li>
 * <li>p U p == p</li>
 * <li>(p U q) U p == (q U p)</li>
 * <li>X p U X q == X (p U q)</li>
 * <li>p U (T U q)  = (T U q)</li>
 * <li>p V p == p</li>
 * <li>(TRUE V p) == p</li>
 * <li>(p V FALSE) == FALSE</li>
 * <li>(p V TRUE) == TRUE</li> 
 * <li>F V (p V q) == F V q</li>
 * <li>p V (F V q) == F V q</li>
 * <li>p && (q U p) == p</li>
 * <li>(p U q) && (r U q) = (p && r) U q</li>
 * <li>p && (q V p) == q V p</li>
 * <li>(p V q) && (p V r) = p V (q && r)</li>
 * </ul>
 * 
 * @author jalampin
 *
 */
public class FutureTimeFormulaSimplifyingModifier extends AbstractTreeModifier {
	private static final Literal TRUE = new Literal(true);
	private static final Literal FALSE = new Literal(false);
	private BooleanExpression simplifiedCode;
	
	/** 
	 * Construct a new FutureTimeFormulaSimplifyingModifier.
	 * @param node the future time formula to simplify
	 */
	public FutureTimeFormulaSimplifyingModifier(BooleanExpression node) {
		super(ProcessingStrategy.POSTORDER);
		simplifiedCode = node.accept(this);
	}

	/**
	 * Get the simplified code.
	 * @return the simplified code
	 */
	public BooleanExpression getSimplifiedCode() {
		return simplifiedCode;
	}

	/**
	 * Simplify method for future time temporal formulas, called by the modifier
	 * (this class).
	 * @return simplified subtree
	 */
	@Override
	public BooleanExpression visitFutureTimeTemporalFormula(FutureTimeTemporalOperator futureTimeTemporalOperator) {
		FutureTimeTemporalOperator firstLtlSubformula, secondLtlSubformula;
		BooleanExpression first = futureTimeTemporalOperator.getNth(1);
		BooleanExpression second;
		
		// Globally:
		if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.GLOBALLY) {
			if(first.equals(FALSE)) {
				return new Literal(false); // [] FALSE == FALSE
			}
			if(first.equals(TRUE)) {
				return new Literal(true); // [] TRUE == TRUE
			}
			if(first instanceof FutureTimeTemporalOperator) {
				firstLtlSubformula = (FutureTimeTemporalOperator) first;
				if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.GLOBALLY)
					return firstLtlSubformula; // [][] p == [] p
				if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.RELEASE) {
					futureTimeTemporalOperator.setNth(1,firstLtlSubformula.getNth(2));
					return futureTimeTemporalOperator; // [] (p V q) == [] q
				}
			}
		// Next:
		} else if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.NEXT) {
			if(first.equals(TRUE)) {
				return new Literal(true); // X TRUE == TRUE
			}
		// Finally:
		} else if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.FINALLY) {
			if(first.equals(FALSE)) {
				return new Literal(false); // <> FALSE == FALSE
			}
			if(first.equals(TRUE)) {
				return new Literal(true); // <> TRUE == TRUE
			}
			if(first instanceof FutureTimeTemporalOperator) {
				firstLtlSubformula = (FutureTimeTemporalOperator) first;
				if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.FINALLY) {
					return firstLtlSubformula; // <><> p == <> p
				}
				if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL) {
					futureTimeTemporalOperator.setNth(1,firstLtlSubformula.getNth(2));
					return futureTimeTemporalOperator; // <> (p U q) == <> q
				}
			}
		// Strong until:
		} else if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL) {
			second = futureTimeTemporalOperator.getNth(2);
			if(first.equals(FALSE) || second.equals(FALSE) || second.equals(TRUE)) {
				return second;
			}
			if(first.equals(second)) {
				return first; // p U p == p
			}
			if(first instanceof FutureTimeTemporalOperator) {
				firstLtlSubformula = (FutureTimeTemporalOperator) first;
				if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL && 
						firstLtlSubformula.getNth(1).equals(second)) {
						futureTimeTemporalOperator.setNth(1,firstLtlSubformula.getNth(2));
						futureTimeTemporalOperator.setNth(2,firstLtlSubformula.getNth(1));
						return futureTimeTemporalOperator; // (p U q) U p == (q U p)
				}
				if(second instanceof FutureTimeTemporalOperator) {
					secondLtlSubformula = (FutureTimeTemporalOperator) second;
					if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.NEXT &&
							secondLtlSubformula.getType() == FutureTimeTemporalOperatorType.NEXT) {
						futureTimeTemporalOperator = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.NEXT);
						firstLtlSubformula = new FutureTimeTemporalOperator(FutureTimeTemporalOperatorType.STRONG_UNTIL);
						firstLtlSubformula.setNth(1,first.getNth(1));
						firstLtlSubformula.setNth(2,second.getNth(1));
						futureTimeTemporalOperator.setNth(1,firstLtlSubformula);
						return futureTimeTemporalOperator; //X p U X q == X (p U q)
					}
				}
			}
			if(second instanceof FutureTimeTemporalOperator) {
				secondLtlSubformula = (FutureTimeTemporalOperator) second;
				if(secondLtlSubformula.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL &&
					secondLtlSubformula.getNth(1).equals(TRUE)) {
						return secondLtlSubformula; // p U (T U q)  = (T U q)
				}
			}
		// Release:
		} else if(futureTimeTemporalOperator.getType() == FutureTimeTemporalOperatorType.RELEASE) {
			second = futureTimeTemporalOperator.getNth(2);
			if(first.equals(second)) {
				return first; // p V p == p
			} 
			if(first.equals(TRUE) || second.equals(FALSE) || second.equals(TRUE)) {
				return second;
			}
			if(second instanceof FutureTimeTemporalOperator) {
				secondLtlSubformula = (FutureTimeTemporalOperator) second;
				if(secondLtlSubformula.getType() == FutureTimeTemporalOperatorType.RELEASE) {
					if(first.equals(FALSE)) {
						secondLtlSubformula.setNth(1,new Literal(false));
						return secondLtlSubformula; // F V (p V q) == F V q
					}
					if(secondLtlSubformula.getNth(1).equals(FALSE)) {
						secondLtlSubformula.setNth(1,new Literal(false));
						return secondLtlSubformula; // p V (F V q) == F V q
					}
				}
			}
		}
		return futureTimeTemporalOperator;
	}
	
	/**
	 * Simplify method for propositional connectives, called by the modifier
	 * (this class).
	 * @return simplified subtree
	 */
	@Override
	public BooleanExpression visitPropositionalConnective(PropositionalConnective connective) {
		FutureTimeTemporalOperator firstLtlSubformula, secondLtlSubformula;
		BooleanExpression first = connective.getNth(1); 
		BooleanExpression second;
		
		if(!connective.isUnaryOperator()) {
			second = connective.getNth(2);
		} else {
			second = null;
		}
		
		// And:
		if(connective.getType() == PropositionalConnectiveType.AND) {
			if(second instanceof FutureTimeTemporalOperator) {
				secondLtlSubformula = (FutureTimeTemporalOperator) second;
				if(secondLtlSubformula.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL) {
					if(first.equals(second.getNth(2))) {
						return first; // p && (q U p) == p
					}
					if(first instanceof FutureTimeTemporalOperator) {
						firstLtlSubformula = (FutureTimeTemporalOperator) first;
						if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.STRONG_UNTIL) {
							if(first.getNth(2).equals(second.getNth(2))) {
								connective.setNth(1,first.getNth(1));
								connective.setNth(2,second.getNth(1));
								firstLtlSubformula.setNth(1,connective);
								return firstLtlSubformula; // (p U q) && (r U q) = (p && r) U q
							}
						}
					}
				} 
				if(secondLtlSubformula.getType() == FutureTimeTemporalOperatorType.RELEASE) {
					if(first.equals(second.getNth(2))) {
						return second; // p && (q V p) == q V p
					} 
					if(first instanceof FutureTimeTemporalOperator) {
						firstLtlSubformula = (FutureTimeTemporalOperator) first;
						if(firstLtlSubformula.getType() == FutureTimeTemporalOperatorType.RELEASE) {
							if(first.getNth(1).equals(second.getNth(1))) {
								connective.setNth(1,first.getNth(2));
								connective.setNth(2,second.getNth(2));
								firstLtlSubformula.setNth(2,connective);
								return firstLtlSubformula; // (p V q) && (p V r) = p V (q && r)
							}
						}
					}
				}
			}
		}
		return connective;
	} 
}
