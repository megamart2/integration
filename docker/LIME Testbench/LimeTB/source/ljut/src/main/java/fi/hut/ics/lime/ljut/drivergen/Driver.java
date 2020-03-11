package fi.hut.ics.lime.ljut.drivergen;

import java.io.IOException;
import java.io.Writer;

/**
 * Abstract base class for all test driver implementations.
 * 
 * @author osaariki
 */
public abstract class Driver {

	/**
	 * @return the settings for this driver.
	 */
	public abstract DriverSettings getDriverSettings();

	/**
	 * Writes the driver source.
	 * 
	 * @param out the {@link Writer} to write to.
	 * @throws IOException passthrough from the {@link Writer}.
	 */
	public abstract void writeTo(Writer out) throws IOException;
}
