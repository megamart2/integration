package fi.hut.ics.lime.common.logic.ast.modifiers;

import fi.hut.ics.lime.common.logic.ast.modifiers.NegativeNormalFormModifier;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperatorType;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnective;
import fi.hut.ics.lime.common.logic.ast.node.PropositionalConnectiveType;
import fi.hut.ics.lime.common.logic.ast.visitors.PrettyPrinter;
import junit.framework.TestCase;

/**
 * Tester for the NegativeNormalFormModifier class.
 * @author jalampin
 * */
public class NegativeNormalModifierTest extends TestCase {
	private PropositionalConnective not1, not2, not3;
	private PropositionNode proposition1, proposition2;
	private NegativeNormalFormModifier modifier;
	private PastTimeTemporalOperator previously, weakPreviously, historically;
	private PastTimeTemporalOperator once, since, trigger;
	private BooleanExpression node;

	/**
	 * Set up the test.
	 */
	@Override
	public void setUp() {
		node = null;
		not1 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		not2 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		not3 = new PropositionalConnective(PropositionalConnectiveType.NOT);
		proposition1 = new PropositionNode("p");
		proposition2 = new PropositionNode("q");
		modifier = new NegativeNormalFormModifier();
		historically = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.HISTORICALLY);
		once = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.ONCE);
		previously = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.PREVIOUSLY);
		weakPreviously = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.WEAK_PREVIOUSLY);
		since = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.SINCE);
		trigger = new PastTimeTemporalOperator(PastTimeTemporalOperatorType.TRIGGER);
	}
	
	/**
	 * ! [*] p <=> <*> ! p
	 *
	 */
	public void testNotHistoricallyP() {
		historically.setNth(1,proposition1);
		not1.setNth(1,historically);
		
		
		node = not1.accept(modifier);
		
		once.setNth(1,not2);
		not2.setNth(1,proposition1);
		assertTrue("! [*] p <=> <*> ! p does not hold, got: ! [*] p <=> "+
				prettyPrint(node), node.equals(once));
	}
    /** 
     * ! <*> p <=> [*] ! p
     * 
     */
	public void testNotOnceP() {
		once.setNth(1,proposition1);
		not1.setNth(1,once);
		
		node = not1.accept(modifier);
		
		historically.setNth(1,not2);
		not2.setNth(1,proposition1);
		
		assertTrue("! <*> p <=> [*] ! p does not hold, got: ! <*> p <=> "+
				prettyPrint(node), node.equals(historically));
	}
	/**
	 * ! Y p <=> Z ! p
	 *
	 */
	public void testNotPreviouslyP() {		
		previously.setNth(1,proposition1);
		not1.setNth(1,previously);
		
		node = not1.accept(modifier);
		
		weakPreviously.setNth(1,not2);
		not2.setNth(1,proposition1);
		
		assertTrue("! Y p <=> Z ! p does not hold, got: ! Y p <=> "+
				prettyPrint(node), node.equals(weakPreviously));
	}
	
	/**
	 * ! Z p <=> Y ! p
	 *
	 */
	public void testNotWeakPreviouslyP() {
		weakPreviously.setNth(1,proposition1);
		not1.setNth(1,weakPreviously);
		
		node = not1.accept(modifier);
		
		previously.setNth(1,not2);
		not2.setNth(1,proposition1);
		assertTrue("! Z p <=> Y ! p does not hold, got: ! Z p <=> "+
				prettyPrint(node), node.equals(previously));
	}
	
	/**	
	 *  ! (p S q) <=> (! p) T (! q)
	 *  
	 */
	public void testNotSincePQ() {
		since.setNth(1,proposition1);
		since.setNth(2,proposition2);
		not1.setNth(1,since);
		
		node = not1.accept(modifier);
		
		trigger.setNth(1,not2);
		trigger.setNth(2,not3);
		not2.setNth(1,proposition1);
		not3.setNth(1,proposition2);
		assertTrue("(!(p S q)) <=> ((! p) T (! q)) does not hold, got: "+prettyPrint(not1)+
				" <=> "+prettyPrint(node), node.equals(trigger));
	}
	/**
	 *  ! (p T q) <=> (!p S !q)
	 *
	 */
	public void testNotTriggerPQ() {
		trigger.setNth(1,proposition1);
		trigger.setNth(2,proposition2);
		not1.setNth(1,trigger);
		
		node = not1.accept(modifier);
		
		since.setNth(1,not2);
		since.setNth(2,not3);
		not2.setNth(1,proposition1);
		not3.setNth(1,proposition2);
		assertTrue("(!(p T q)) <=> ((! p) S (! q)) does not hold, got: "+prettyPrint(not1)+
				" <=> "+prettyPrint(node), node.equals(since));
		
	}
	private String prettyPrint(BooleanExpression node) {
		return new PrettyPrinter(node).getPrettyPrint();
	}
}
