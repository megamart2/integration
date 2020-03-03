package business;

/**
 * @author Eric
 */
public enum WiperSpeed {

    HIGH("High"),
    NORMAL("Normal"),
    INTERMITTENT3("Intermittent 3"),
    INTERMITTENT2("Intermittent 2"),
    INTERMITTENT1("Intermittent 1"),
    OFF("None");

    private String speed;

    WiperSpeed(String speed) {
        this.speed = speed;
    }

    @Override
    public String toString() {
        return speed;
    }
}
