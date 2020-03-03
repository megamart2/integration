package pauwarev1;

import com.pauware.pauware_engine._Core.*;
import com.pauware.pauware_engine._Exception.*;
import com.pauware.pauware_engine._Java_EE.*;

public class StackSM {
    
    // The states of the state machine
    protected AbstractStatechart empty;
    protected AbstractStatechart notEmpty;
    protected AbstractStatechart_monitor stateMachine;
    
    /**
     * The stack (the business object)
     */
    protected java.util.Stack<String> stack;
    
    /*********************************************
     *               Invariants
     *********************************************/
    
    /**
     * The invariant for the not empty state 
     * @return true if the stack is not empty
     */
    public boolean stackNotEmpty() {
        return ! stack.isEmpty();
    }
    
    /**
     * The invariant for the empty state 
     * @return true if the stack is empty
     */
    public boolean stackEmpty() {
        return stack.isEmpty();
    }
    
     /*********************************************
     *               Guards
     **********************************************/
    
    /**
     * @return true if there is only one element in the stack 
     */
    public boolean onlyOne() {
        System.out.println("** Only one guard call: "+stack.size()+" element(s)");
        return stack.size() == 1;
    }
    /**
     * @return true if there is more than one element in the stack 
     */
    public boolean moreThanOne() {
        System.out.println("** More than one guard call: "+stack.size()+" element(s)");
        return stack.size() > 1;
    }
    
    /*********************************************
     *               Business operations
     *********************************************/
    
    /**
     * For a push on the stack
     * @param value the value to push
     */
    public void actionPush(String value) {
        System.out.println("--> push: "+value);
        stack.push(value);
    }
    
    /**
     * For a pop on the stack
     */
    public void actionPop() {
        String value = stack.pop();
        // Uncomment the following line to pop twice an element
        // It will lead to a violation of the invariants
        // stack.pop();
        System.out.println("--> pop: "+value);
    }
    
    /*********************************************
     *               Events
     *********************************************/
    
    /**
     * The process of the push event
     * @param value the value associated with the event
     * @throws Statechart_transition_based_exception
     * @throws Statechart_exception 
     */
    public void pushEvent(String value) throws Statechart_transition_based_exception, Statechart_exception {
        // The transitions are redefined for putting the value as parameter when calling
        // the "actionPush" method
        stateMachine.fires("push", empty, notEmpty, true, this, "actionPush", new Object[] { value });
        stateMachine.fires("push", notEmpty, notEmpty, true, this, "actionPush", new Object[] { value });
        stateMachine.run_to_completion("push", AbstractStatechart_monitor.Compute_invariants);
    }
    
    /**
     * The process of the pop event
     * @throws Statechart_exception 
     */
    public void popEvent() throws Statechart_exception {
        stateMachine.run_to_completion("pop", AbstractStatechart_monitor.Compute_invariants);
    }
    
    /**
     * Build and launch the state machine
     * @throws Statechart_exception 
     */
    public void buildStateMachine() throws Statechart_exception {
        // creation of the two states "empty" and "not empty" with their invariant
        notEmpty = new Statechart("Not Empty");
        notEmpty.stateInvariant(this,"stackNotEmpty");
        
        empty = new Statechart("Empty");
        empty.stateInvariant(this, "stackEmpty");
        empty.inputState();
        
        AbstractStatechart_monitor_listener pv = null;
        // If you want to use the Pauware viewer, uncomment the next line:
        //pv = new com.pauware.pauware_view.PauWare_view();
        
        // Build the global state machine
        // If you do not want to see the Pauware execution traces, replace the "true" parameter by "false"
        stateMachine = new Statechart_monitor(empty.xor(notEmpty), "Stack SM", true, pv);
        
        // Transition for the "push" event that will call the "actionPush". The String instances in
        // parameters are empty: they are juste here to precise the signature of the method
        stateMachine.fires("push", empty, notEmpty, true, this, "actionPush", new Object[] {new String()});
        stateMachine.fires("push", notEmpty, notEmpty, true, this, "actionPush", new Object[] {new String()});
        
        // Transitions for the "pop" event with guards: if there more than one element in
        // the stack, the target is the "not empty" state, else, if there is only one 
        // element, the target is the "empty" state
        stateMachine.fires("pop", notEmpty, empty, this, "onlyOne", this, "actionPop");
        stateMachine.fires("pop", notEmpty, notEmpty, this, "moreThanOne", this, "actionPop");
        
        stateMachine.start();
    }
        
    public void stopStateMachine() throws Statechart_exception {
        stateMachine.stop();
    }
    
    public StackSM() {
        stack = new java.util.Stack();
    }
    
    
    public static void main(String argv[])  {

        try {
            StackSM sm = new StackSM();
            sm.buildStateMachine();
            sm.pushEvent("Foo");
            sm.pushEvent("Bar");
            sm.popEvent();
            sm.popEvent();
            sm.stopStateMachine();
        }
        catch (Statechart_exception ex) {
            System.err.println("Error: "+ex);
        }
            
    }
}
