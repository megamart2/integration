package fi.hut.ics.lime.common.logic.ast.modifiers;

import fi.hut.ics.lime.common.logic.ast.AbstractTreeModifier;
import fi.hut.ics.lime.common.logic.ast.ProcessingStrategy;
import fi.hut.ics.lime.common.logic.ast.node.Literal;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;

/**
 * This class is a TreeModifier that will do the following substitutions to a tree, which
 * contains Nodes of logic formulas:
 * <ul>
 * <li>p && p == p</li>
 * <li>F && p == p && F == F</li>
 * <li>T && p == p</li>
 * <li>p && T == p</li>
 * <li>p && !p == F</li>
 * <li>p || !p == T</li>
 * <li>(p && r) || (p && s) == p && (r || s)</li>
 * <li>(p && r) || (s && p) == p && (r || s)</li>
 * <li>(r && p) || (s && p) == (r || s) && p</li>
 * <li>(r && p) || (p && s) == (r || s) && p</li>
 * <li>!(!p) == p</li>
 * </ul>
 *  
 * It is likely that all possible substitutions cannot be done in a single pass, so
 * several runs may be require to get the best result.
 * @author jalampin
 *
 */
public class PropositionalSimplifyingModifier extends AbstractTreeModifier {
	private static final Literal TRUE = new Literal(true);
	private static final Literal FALSE = new Literal(false);
	private BooleanExpression simplifiedCode;
	
	/**
	 * Creates a simplifying visitor:<br>
	 * \code
	 * PropositionalSimplifyingModifier modifier = new PropositionalConnective();
	 * node = node.accept(modifier); // to optimize an AST with node as root.
	 * \endcode
	 *
	 */
	public PropositionalSimplifyingModifier() {
		super(ProcessingStrategy.POSTORDER);
	}
	
	/**
	 * Simplify a propositional AST.
	 * @param node the propositional AST to simplify
	 */
	public PropositionalSimplifyingModifier(BooleanExpression node) {
		super(ProcessingStrategy.POSTORDER);
		simplifiedCode = node.accept(this);
	}
	
	/**
	 * Get the simplified code.
	 * @return the simplified code (an AST)
	 */
	public BooleanExpression getSimplifiedCode() {
		return simplifiedCode;
	}
	
	/**
	 * The visit function for propositional connectives, called by the modifier
	 * (this class).
	 */
	@Override
	public BooleanExpression visitPropositionalConnective(PropositionalConnective connective) {
		BooleanExpression first = connective.getNth(1);
		BooleanExpression second = (connective.isUnaryOperator() ? null : connective.getNth(2));
		PropositionalConnective firstSubConnective, secondSubConnective;
		PropositionalConnectiveType type = connective.getType();
		
		// AND:
		if(type == PropositionalConnectiveType.AND) {
			if(first.equals(second))
				return first; // (p && p) == p
			if(first.equals(FALSE) || second.equals(FALSE))
				return new Literal(false); // F && p == p && F == F
			if(first.equals(TRUE))
				return second; // T && p == p
			if(second.equals(TRUE))
				return first; // p && T == p
			if(areComplements(first, second))
				return new Literal(false); // p && !p == F
		}
		
		// OR:
		if(type == PropositionalConnectiveType.OR)
			if(areComplements(first, second))
				return new Literal(true); // p || !p == T
			if(first instanceof PropositionalConnective) {
				firstSubConnective = (PropositionalConnective) first;
				if (second instanceof PropositionalConnective) {
					secondSubConnective = (PropositionalConnective) second;
					if(firstSubConnective.getType() == PropositionalConnectiveType.AND) {
						if(secondSubConnective.getType() == PropositionalConnectiveType.AND) {
							if(first.getNth(1).equals(second.getNth(1))) {
								connective.setNth(1,first.getNth(2));
								connective.setNth(2,second.getNth(2));
								firstSubConnective.setNth(2,connective);
								return firstSubConnective; // (p && r) || (p && s) == p && (r || s)
							}
							if(first.getNth(1).equals(second.getNth(2))) {
								connective.setNth(1,first.getNth(2));
								connective.setNth(2,second.getNth(1));
								firstSubConnective.setNth(2,connective);
								return firstSubConnective; // (p && r) || (s && p) == p && (r || s)
							}
							if(first.getNth(2).equals(second.getNth(1))) {
								connective.setNth(1,first.getNth(1));
								connective.setNth(2,second.getNth(1));
								firstSubConnective.setNth(1,connective);
								return firstSubConnective; // (r && p) || (s && p) == (r || s) && p
							}
							if(first.getNth(2).equals(second.getNth(2))) {
								connective.setNth(1,first.getNth(1));
								connective.setNth(2,second.getNth(2));
								firstSubConnective.setNth(1,connective);
								return firstSubConnective; // (r && p) || (p && s) == (r || s) && p
							}
						}
					}
				}
			}
		if(type == PropositionalConnectiveType.NOT) {
			if(first instanceof PropositionalConnective) {
				firstSubConnective = (PropositionalConnective) first;
				if(firstSubConnective.getType() == PropositionalConnectiveType.NOT)
					return firstSubConnective.getNth(1); // !(!p) == p
			}
		}
		return connective;
	}
	
	private boolean areComplements(BooleanExpression first, BooleanExpression second) {
		BooleanExpression complement = new PropositionalConnective(PropositionalConnectiveType.NOT);
		complement.setNth(1,first);
		if(second.equals(complement))
			return true; 		
		complement.setNth(1,second);
		return first.equals(complement);
		
	}
}
