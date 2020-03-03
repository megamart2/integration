
package pauwarev2;

import com.pauware.pauware_engine._Core.AbstractAction;
import com.pauware.pauware_engine._Core.AbstractGuard;
import com.pauware.pauware_engine._Core.AbstractStatechart;
import com.pauware.pauware_engine._Core.AbstractStatechart_monitor;
import com.pauware.pauware_engine._Core.Observable;
import com.pauware.pauware_engine._Core.Transition;
import com.pauware.pauware_engine._Exception.Statechart_exception;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lea, eric
 */
public class FileTrace implements Observable {

    private final FileWriter fw;
    
    private AbstractStatechart_monitor stateMachine = null;
       
    private String writeTransition(Transition transition) {
        return "from "+transition.getFrom().getName()+" to "+transition.getTo().getName()+" for "+transition.getEvent();
    }
    
    private String writeAction(AbstractAction action) {
        String val = action.getAction()+" on "+action.getObject().getClass().getName();
        Object params[] = action.getArgs();
        if (params != null) {
           val+= " with ";
            for (int i=0; i<params.length; i++)
                val+=params[i];
        }
        val += " return "+action.getResult();
        return val;
    }
    
    
    public FileTrace(String filename) throws IOException {
        fw = new FileWriter(new File(filename));
    }
    
    public void closeTrace() throws IOException {
        fw.close();
    }
    
    @Override
    public void onStateEntry(AbstractStatechart state) {
        try {
            fw.write("StateActivation["+state.getName()+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void onStateExit(AbstractStatechart state) {
        try {
            fw.write("StateDesactivation["+state.name()+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void onEntryAction(AbstractStatechart state, AbstractAction action) {
        try {
            fw.write("EntryAction[on "+state.getName() +" { "+this.writeAction(action)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }

    @Override
    public void onExitAction(AbstractStatechart state, AbstractAction action) {
        try {
            fw.write("ExitAction[on "+state.getName() +" { "+this.writeAction(action)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }

    @Override
    public void onDoActivity(AbstractStatechart state, AbstractAction action) {
        try {
            fw.write("DoActivity[on "+state.getName() +" { "+this.writeAction(action)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }

    @Override
    public void onAllowedEvent(AbstractStatechart state, AbstractAction action) {
        try {
            fw.write("AllowedEvent[on "+state.getName() +" { "+this.writeAction(action)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

    @Override
    public void onViolatedInvariant(AbstractStatechart state, AbstractAction invariant) {
        try {
            fw.write("ViolatedInvariant[on "+state.getName() +" { "+this.writeAction(invariant)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

    @Override
    public void onVerifiedInvariant(AbstractStatechart state, AbstractAction invariant) {
        try {
            fw.write("InvariantVerified[on "+state.getName() +" { "+this.writeAction(invariant)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

    @Override
    public void onStateMachineStart(AbstractStatechart stateMachine) {
        try {
            fw.write("StartStateMachineExecution["+stateMachine.getName()+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void onStateMachineStop(AbstractStatechart stateMachine) {
        try {
            fw.write("EndStateMachineExecution["+stateMachine.getName()+"]\n");
            closeTrace();
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void onGuardValid(Transition transition, AbstractGuard guard) {
        try {
            fw.write("GuardValid[on "+ writeTransition(transition) +" { "+writeAction(guard.getAction())+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

    @Override
    public void onGuardUnvalid(Transition transition, AbstractGuard guard) {
        try {
            fw.write("GuardUnvalid[on "+ writeTransition(transition) +" { "+writeAction(guard.getAction())+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

    @Override
    public void onTransitionOperation(Transition transition, AbstractAction action) {
        try {
            fw.write("TransitionOperation["+this.writeTransition(transition) +" { "+this.writeAction(action)+"}]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public void onFiredTransition(Transition transition) {
        try {
            fw.write("Transition["+this.writeTransition(transition)+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }

    @Override
    public void startCompletionCycle(String event) {
        try {
            fw.write("StartEventCompletionCycle["+event+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }

    @Override
    public void endCompletionCycle(String event) {
        try {
            fw.write("EndEventCompletionCycle["+event+"]\n");
            if (stateMachine != null) fw.write("CurrentState["+stateMachine.current_state()+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }

    
    @Override
    public void onError(Statechart_exception err) {
        try {
            fw.write("ERROR["+err+"]\n");
        } catch (IOException ex) {
            Logger.getLogger(FileTrace.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }

    @Override
    public void setStateMachine(AbstractStatechart_monitor sm) {
        this.stateMachine = sm;
    }
    
}
