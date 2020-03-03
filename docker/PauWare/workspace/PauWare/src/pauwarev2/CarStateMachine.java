package pauwarev2;

import business.Car;
import business.WiperSpeed;

import com.pauware.pauware_engine._Core.*;
import com.pauware.pauware_engine._Exception.*;
import com.pauware.pauware_engine._Java_EE.*;

import java.io.IOException;

/**
 *
 * @author Eric
 */
public class CarStateMachine implements Manageable {

    private AbstractStatechart_monitor carSM;
    
    private AbstractStatechart wiperAndCar;
        
    private AbstractStatechart wiper;
    private AbstractStatechart wiperOff;
    private AbstractStatechart wiperIntermittent;
    private AbstractStatechart wiperIntermittent1;
    private AbstractStatechart wiperIntermittent2;       
    private AbstractStatechart wiperIntermittent3;
    private AbstractStatechart wiperNormal;
    private AbstractStatechart wiperHigh;
    
    private AbstractStatechart car;
    private AbstractStatechart carStopped;
    private AbstractStatechart carRunning;
    private AbstractStatechart lowSpeed;
    private AbstractStatechart normalSpeed;
    
    private boolean wiperOn = false;
    private boolean hasBeenDown = false;
    
    private Car carObject;
    
    private void initBusinessPart() {
        carObject = new Car();
    }
    
    public void downWiper() {
        if (wiperOn & !hasBeenDown) { 
            carObject.downWiperSpeed();
            hasBeenDown = true;
        }
    }
    
    public void upWiper() {
        if (wiperOn && hasBeenDown) { 
            carObject.upWiperSpeed();
            hasBeenDown = false;
        }
    }   

    public void wiperOn() {
        wiperOn = true;
    }
    
    public void wiperOff() {
        wiperOn = false;
    }
    
    private void buildStateMachine() throws Statechart_exception {
        
        this.wiperIntermittent1 = new Statechart("Intermittent 1");
        this.wiperIntermittent1.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.INTERMITTENT1 } );
        this.wiperIntermittent1.doActivity(this, "wiperOn");
        
        this.wiperIntermittent2 = new Statechart("Intermittent 2");
        this.wiperIntermittent2.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.INTERMITTENT2 } );
        this.wiperIntermittent2.doActivity(this, "wiperOn");

        this.wiperIntermittent3 = new Statechart("Intermittent 3");
        this.wiperIntermittent3.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.INTERMITTENT3 } );
        this.wiperIntermittent3.doActivity(this, "wiperOn");

        this.wiperIntermittent1.inputState();
        this.wiperIntermittent = this.wiperIntermittent1.xor(wiperIntermittent2).xor(wiperIntermittent3).name("Intermittent");
        this.wiperIntermittent.deep_history();
        
        this.wiperNormal = new Statechart("Normal");
        this.wiperNormal.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.NORMAL } );
        this.wiperNormal.doActivity(this, "wiperOn");
        
        this.wiperHigh = new Statechart("High");
        this.wiperHigh.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.HIGH } );
        this.wiperHigh.doActivity(this, "wiperOn");
        
        this.wiperOff = new Statechart("Off");
        this.wiperOff.set_entryAction(carObject, "setWiperSpeed", new Object[]{ WiperSpeed.OFF } );
        this.wiperHigh.doActivity(this, "wiperOff");
        this.wiperOff.inputState();
        
        this.wiper = wiperOff.xor(wiperIntermittent).xor(wiperNormal).xor(wiperHigh).name("Windscrenn Wiper");

        this.carStopped = new Statechart("Stopped");
        this.carStopped.set_entryAction(this, "downWiper");
        
        this.lowSpeed = new Statechart("Low Speed");
        this.lowSpeed.set_entryAction(this, "downWiper");
        
        this.normalSpeed = new Statechart("Normal Speed");
        this.normalSpeed.set_entryAction(this,"upWiper");
        
        this.carRunning = lowSpeed.xor(normalSpeed).name("Car Running");
        this.lowSpeed.inputState();
        this.carStopped.inputState();
        this.car = carStopped.xor(carRunning).name("Car");
        this.car.stateInvariant(carObject, "validSpeed");
        
        this.wiperAndCar = car.and(wiper);
        this.wiperAndCar.inputState();
               
        AbstractStatechart_monitor_listener pv = null;
        // If you want to use the Pauware viewer, uncomment the next line:
        //pv = new com.pauware.pauware_view.PauWare_view();
        this.carSM = new Statechart_monitor(this.wiperAndCar, "Car and Windscreen Wiper", AbstractStatechart_monitor.Show_on_system_out, null);

        this.carSM.fires("accelerate", carStopped, carRunning, true, carObject, "accelerate", null);
        this.carSM.fires("accelerate", lowSpeed, lowSpeed, this, "canGoToLowIfAccelerate", carObject, "accelerate", null);
        this.carSM.fires("accelerate", lowSpeed, normalSpeed, this, "canGoToNormalIfAccelerate", carObject, "accelerate", null);
        this.carSM.fires("accelerate", normalSpeed, normalSpeed, this, "canGoToNormalIfAccelerate", carObject, "accelerate", null);
        
        this.carSM.fires("decelerate", normalSpeed, normalSpeed, this, "canGoToNormalIfDecelerate", carObject, "decelerate", null);
        this.carSM.fires("decelerate", normalSpeed, lowSpeed, this, "canGoToLowIfDecelerate", carObject, "decelerate", null);
        this.carSM.fires("decelerate", lowSpeed, lowSpeed, this, "canGoToLowIfDecelerate", carObject, "decelerate", null);
        this.carSM.fires("decelerate", lowSpeed, carStopped, this, "isStoppedIfDecelerate", carObject, "stopCar", null);
        
        this.carSM.fires("upSwitch", wiperIntermittent1, wiperIntermittent2);
        this.carSM.fires("upSwitch", wiperIntermittent2, wiperIntermittent3);
        
        this.carSM.fires("downSwitch", wiperIntermittent2, wiperIntermittent1);
        this.carSM.fires("downSwitch", wiperIntermittent3, wiperIntermittent2);
        
        this.carSM.fires("goHighWiper", wiper, wiperHigh);
        this.carSM.fires("goNormalWiper", wiper, wiperNormal);
        this.carSM.fires("goIntermittentWiper", wiper, wiperIntermittent);
        this.carSM.fires("goOffWiper", wiper, wiperOff);
                       
        // start the state machine
        this.startSM();
    }
    
    public void startSM() throws Statechart_exception {
        // set the trace for the state machine
        try {
            Observable trace = new FileTrace("log.txt");
            PauWareManager.trace = trace;
            trace.setStateMachine(this.carSM);
        }
        catch (IOException e) {
            System.err.println("Problem with the trace: "+e);
        }
        // start the state machine
        this.carSM.start();
    }
    
    public void stopSM() throws Statechart_exception {
        this.carSM.stop();
    }
    
    public void raiseEvent(String evt) throws Statechart_exception {
        System.out.println(" *** "+evt+" ***");
        this.carSM.run_to_completion(evt,AbstractStatechart_monitor.Compute_invariants);
        try { Thread.sleep(100); } catch (Exception e) { }
        System.out.println(" --> "+this.carObject);
        System.out.println(" --> wiper on: "+wiperOn+ " has been downed: " +hasBeenDown);
    }
    public CarStateMachine() throws Statechart_exception {
        initBusinessPart();
        buildStateMachine();
    }
    
    
    //-------------------------
    // State machine management
    //-------------------------
    
    @Override
    public String async_current_state() {
        return this.carSM.async_current_state();
    }

    @Override
    public String current_state() {
        return this.carSM.current_state();
    }

    @Override
    public boolean in_state(String name) {
        return this.carSM.in_state(name);
    }

    @Override
    public void to_state(String name) throws Statechart_exception {
        this.carSM.to_state(name);
    }

    @Override
    public String name() {
        return this.carSM.name();
    }

    @Override
    public String verbose() {
        return this.carSM.verbose();
    }

    public void reset() throws Statechart_exception {
            this.carObject.stopCar();
            this.carObject.stopWiper();
            to_state("Wiper Off");
            to_state("Car Stopped");
    }

    
    //-------------------------
    // Guards for transitions
    //-------------------------
    
    public boolean canGoToLowIfAccelerate() {
        return this.carObject.getSpeed() < 20 ;
    }
                
    public boolean canGoToNormalIfAccelerate() {
        return this.carObject.getSpeed() >= 20; 
    }
    
    public boolean canGoToLowIfDecelerate() {
        return ((this.carObject.getSpeed() >= 20) && (this.carObject.getSpeed() <= 30));
    }
    
    public boolean canGoToNormalIfDecelerate() {
        return this.carObject.getSpeed() > 30;
    }
    
    public boolean isStoppedIfDecelerate() {
        return this.carObject.getSpeed() <= 10;
    }
    
    
    public static void main(String argv[]) {
        CarStateMachine carSM = null;
        try {
            carSM = new CarStateMachine();
        } catch (Statechart_exception ex) {
            System.err.println(" Error while launching the state machine: " + ex);
        }
        char c;
        try {
            do { 
                System.out.println("[a] accelerate, [q] decelerate | [u] off, [i] intermittent, [o] normal, [p] high | [k] down, [l] up | [x] to quit");
                c = (char) System.in.read();
                if (c == 'x') break;
                if (c == 'a') carSM.raiseEvent("accelerate");
                if (c == 'q') carSM.raiseEvent("decelerate");
                if (c == 'u') carSM.raiseEvent("goOffWiper");
                if (c == 'i') carSM.raiseEvent("goIntermittentWiper");
                if (c == 'o') carSM.raiseEvent("goNormalWiper");
                if (c == 'p') carSM.raiseEvent("goHighWiper");
                if (c == 'k') carSM.raiseEvent("downSwitch");
                if (c == 'l') carSM.raiseEvent("upSwitch");
            }
            while (c != 'x'); 
                    
        } catch (Exception e) {
            System.err.println(" Error: " + e);
        }
        if (carSM != null) try {
            carSM.stopSM();
        } catch (Statechart_exception ex) {
            // nothing to do
        }
    }
}

