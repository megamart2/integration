package business;

/**
 * Business class of the microwave oven. A microwave has a light that can be on or off, 
 * a door that can be open or closed and a magnetron that is running when baking.
 * @author Eric
 */
public class MicrowaveBusiness {
    
    private boolean lightOn = false;
    
    private boolean doorOpen = false;
    
    private boolean magnetronOn = false;
    
    /**
     * Stop the microwave: the light and the magnetron are off 
     */
    public void stop() {
        lightOn = false;
        magnetronOn = false;
    }
    
    /** 
     * Make the microwave cooking: the magnetron and light are on
     */
    public void heat() {
        lightOn = true;
        magnetronOn = true;
    }
    
    /**
     * Pause the microwave: the light remains on but the magnetron is stopped
     */
    public void pause() {
        magnetronOn = false;
        lightOn = true;
    }
    
    /**
     * Open the door 
     */
    public void openDoor() {
        doorOpen = true;
    }
    
    /**
     * Close the door
     */
    public void closeDoor() {
        doorOpen = false;
    }
    
    @Override
    public String toString() {
        return "[Light on: "+lightOn+", magnetron on: "+magnetronOn+", door open: "+doorOpen+ "]";
    }
}
