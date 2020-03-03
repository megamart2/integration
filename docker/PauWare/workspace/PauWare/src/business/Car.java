package business;

/**
 *
 * @author Eric
 */
public class Car {
 
    private int carSpeed;

    private WiperSpeed wiperSpeed;
    
    public int getSpeed() {
        return this.carSpeed;
    }

    public String getWiperSpeed() {
        return this.wiperSpeed.toString();
    }
  
    public void setWiperSpeed(WiperSpeed speed) {
        this.wiperSpeed = speed;
    }
    
    public void accelerate() {
        // accelerate only if the car has not reached its maximum speed
        if (this.carSpeed < 100) this.carSpeed += 10;
        // to test the invariant associated with the Car state, replace 
        // the previous line by the above commented one 
        // this.carSpeed += 10;
    }
    
    public void decelerate() {
        if (carSpeed > 0) this.carSpeed -= 10;
    }
    
    public void upWiperSpeed() {
        System.out.println(" ***** Appel de UP");
        if (wiperSpeed.equals(WiperSpeed.NORMAL)) wiperSpeed = WiperSpeed.HIGH;
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT3)) wiperSpeed = WiperSpeed.NORMAL;
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT2)) wiperSpeed = WiperSpeed.INTERMITTENT3;
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT1)) wiperSpeed = WiperSpeed.INTERMITTENT2;
        if (wiperSpeed.equals(WiperSpeed.OFF)) wiperSpeed = WiperSpeed.INTERMITTENT2;
    }
    
    public void downWiperSpeed() {
        System.out.println(" ***** Appel de DOWN");
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT1)) wiperSpeed = WiperSpeed.OFF;
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT2)) wiperSpeed = WiperSpeed.INTERMITTENT1;
        if (wiperSpeed.equals(WiperSpeed.INTERMITTENT3)) wiperSpeed = WiperSpeed.INTERMITTENT2;
        if (wiperSpeed.equals(WiperSpeed.NORMAL)) wiperSpeed = WiperSpeed.INTERMITTENT3;
        if (wiperSpeed.equals(WiperSpeed.HIGH)) wiperSpeed = WiperSpeed.NORMAL;
    }    
    
    public void stopWiper() {
        this.wiperSpeed = WiperSpeed.OFF;
    }
    
    public void stopCar() {
        this.carSpeed = 0;
    }
    
    public boolean validSpeed() {
        return (this.carSpeed >= 0 && this.carSpeed <= 100);
    }
    
    @Override
    public String toString() {
        return "car: "+this.carSpeed+" wiper: "+this.wiperSpeed.toString();
    }
    
    public Car() {
        this.carSpeed = 0;
        this.wiperSpeed = WiperSpeed.OFF;
    }
    
}
