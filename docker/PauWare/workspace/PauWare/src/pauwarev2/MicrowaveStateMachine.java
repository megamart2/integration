package pauwarev2;

import business.MicrowaveBusiness;

import com.pauware.pauware_engine._Core.*;
import com.pauware.pauware_engine._Exception.*;

import java.io.IOException;
import java.util.Scanner;

/**
 * The state machine of the microwave oven. It has two main composite states: when the door is open
 * and when the door is closed. Door closed, there are two sub-states: either the microwave is
 * off or baking. Door open, there are also two sub-states: either the microwave is off or in pause.
 * @author Eric
 */
public class MicrowaveStateMachine {

    // The states of the microwave state machine, first, the composite states
    protected AbstractStatechart open;
    protected AbstractStatechart closed;
    
    // The primitive states embedded in the composite states
    protected AbstractStatechart offOpen;
    protected AbstractStatechart offClosed;
    protected AbstractStatechart baking;
    protected AbstractStatechart paused;

    // The state machine
    protected AbstractStatechart_monitor stateMachine = null;
    
    // The business object associated with the state machine
    protected MicrowaveBusiness mwb;
     
   /**
    * Build the state machine (its states and transitions) and launch it.
    * @throws Statechart_exception in case of problem with the definition of the state machine
    * @throws java.io.IOException
    */
    public void buildAndStartMicrowave() throws Statechart_exception, IOException {
             
       IPauWare pw = PauWareFactory.getPauWareManager(JavaPlatform.JavaEE);
       Observable trace = new FileTrace("log.txt");
       pw.setTrace(trace);

       // The state off (of open) executes the "stop" method and is the input state of its composite
       offOpen = pw.createStatechart("Off");
       offOpen.set_entryAction(mwb, "stop");
       offOpen.inputState();

       // The state off (of closed) executes the "stop" method and is the input state of its composite.
       // The "." in the state name is simply for avoiding a bug in the Pauware viewer due to PlantUML that
       // has problems to manage two states with the same name but one can have with Pauware two states 
       // with the same name in two different composite states.
       offClosed = pw.createStatechart("Off.");
       offClosed.set_entryAction(mwb, "stop");
       offClosed.inputState();

       // The baking state executes the "heat" method
       baking = pw.createStatechart("Baking");
       baking.set_entryAction(mwb, "heat");
       
       // The paused state executes the "pause" method
       paused = pw.createStatechart("Paused");
       paused.set_entryAction(mwb, "pause");

       // The closed state is a composite containing the off and baking states,
       // has a deep history pseudo state and is the input state of its composite
       // (the state machine)
       closed = offClosed.xor(baking).name("Closed");
       closed.deep_history();
       closed.inputState();

       // The open state is a composite containing the off and paused states
       open = offOpen.xor(paused).name("Open");
       
       AbstractStatechart_monitor_listener pv = null;
       // If you want to use the Pauware viewer, uncomment the next line:
       //pv = new com.pauware.pauware_view.PauWare_view();
        
       // Build the global state machine as being composed of the open and closed states.
       // If you do not want to see the Pauware execution traces, replace the "true" parameter by "false"
       stateMachine = pw.createStateMachine(closed.xor(open),"Microwave", true, pv);
       
       
       // Definition of the transitions of the state machine:
       // - from closed to open for the "DoorOpen" event with call of the "openDoor" method
       // - from baking to paused for the "DoorOpen" event with call of the "openDoor" method
       // - from open to closed for the "DoorClosed" event with call of the "closeDoor" method 
       //   (as the closed state has an history state, its last active state will be the  
       //    concrete target of the transition)
       // - from off of closed to baking for the "Power" event
       // - from baking to off of closed for the "Power" event    
       
       //Replace: stateMachine.fires("DoorOpen", closed, open, true, mwb, "openDoor");
       Transition t1 = new Transition("DoorOpen", closed, open);
       t1.setBusinessObject(mwb);
       t1.setBusinessMethodName("openDoor");
       stateMachine.setTransition(t1);
       
       //Replace: stateMachine.fires("DoorOpen", baking, paused, true, mwb, "openDoor");
       Transition t2 = new Transition("DoorOpen", baking, paused);
       t2.setBusinessObject(mwb);
       t2.setBusinessMethodName("openDoor");
       stateMachine.setTransition(t2);
       
       //Replace: stateMachine.fires("DoorClosed", open, closed, true, mwb, "closeDoor");
       Transition t3 = new Transition("DoorClosed", open, closed);
       t3.setBusinessObject(mwb);
       t3.setBusinessMethodName("closeDoor");
       stateMachine.setTransition(t3);
       
       //Replace: stateMachine.fires("Power", offClosed, baking);
       Transition t4 = new Transition("Power", offClosed, baking);
       t4.setBusinessObject(mwb);
       stateMachine.setTransition(t4);
       
       //Replace: stateMachine.fires("Power", baking, offClosed);
       Transition t5 = new Transition("Power", baking, offClosed);
       t5.setBusinessObject(mwb);
       stateMachine.setTransition(t5);
      
       // set the state machine if needed by the trace
       trace.setStateMachine(stateMachine);
       
       // Launch the state machine, now events can be processed by the Pauware execution engine
       stateMachine.start(); 
    }
    
    // Stop the state machine
    public void stopMicrowave() throws Statechart_exception {
        stateMachine.stop();
    }
    
    /** 
     * Process an event and print on the console the new values of the business object
     * @param eventName the name of the event to process
     * @throws java.lang.Exception 
     */
    public void runEvent(String eventName) throws Exception  {
        // The "run_to_completion" method searchs triggerable transitions and 
        // executes the required business methods for a given event
        stateMachine.run_to_completion(eventName);
        System.out.println("Business values after the "+eventName+" event: "+mwb+ " in state "+stateMachine.current_state());
    }
    
    /**
     * Create a microwave state machine object
     * @param mwb the business object that will be associated with the state machine
     */
    public MicrowaveStateMachine(MicrowaveBusiness mwb) {
        this.mwb = mwb;
    }
       
    public static void main(String argv[]) {
        try {
            // Instantiate and start the state machine with its business object
            MicrowaveBusiness business = new MicrowaveBusiness();
            MicrowaveStateMachine sm = new MicrowaveStateMachine(business);
            sm.buildAndStartMicrowave();
            
          
            Scanner scan = new Scanner(System.in);
            String event = "";
            
            // Events are entered by the user
            while (!event.equals("end")) {
                System.out.print("Enter an event name (\"end\" to finish): ");
                event = scan.nextLine();
                if (!event.equals("end")) sm.runEvent(event);
            }
            // Stop the state machine. Note: if a viewer is running, it will
            // continue to run and the program will not finish
            sm.stopMicrowave();
        }
        catch(Exception e) {
            System.err.println("Problem: "+e);
            e.printStackTrace();
        }
    }
}
