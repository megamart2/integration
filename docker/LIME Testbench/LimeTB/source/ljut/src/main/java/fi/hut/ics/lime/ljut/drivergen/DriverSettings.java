package fi.hut.ics.lime.ljut.drivergen;

/**
 * Abstract base class for all driver settings implementations.
 * 
 * @author osaariki
 */
public abstract class DriverSettings {

	/**
	 * Writes the driver settings into a provided {@link DriverProperties} instance overwriting any existing keys.
	 * 
	 * @param properties
	 *            the properties to write to.
	 */
	public abstract void writeTo(DriverProperties properties);
}
