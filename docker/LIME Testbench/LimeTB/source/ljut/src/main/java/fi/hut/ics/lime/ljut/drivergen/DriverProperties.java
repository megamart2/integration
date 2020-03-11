package fi.hut.ics.lime.ljut.drivergen;

import java.util.EnumSet;
import java.util.Properties;

/**
 * Extends {@link Properties} to support parsing the driver type.
 * 
 * @author osaariki
 */
public class DriverProperties extends Properties {

	private static final long serialVersionUID = 1L;
	private static final String DRIVER_TYPE_KEY = "driverType";

	/**
	 * Initializes a new instance with no properties set.
	 */
	public DriverProperties() {

	}

	/**
	 * Initializes a new instance with the given driver type.
	 * 
	 * @param driverType
	 *            the driver type.
	 */
	public DriverProperties(DriverType driverType) {
		setDriverType(driverType);
	}

	/**
	 * Parses the driver type property into one of the known driver types in {@link DriverType}.
	 * 
	 * @return the driver type.
	 * @throws PropertyParsingException
	 *             if the driver type is not recognized.
	 */
	public DriverType getDriverType() throws PropertyParsingException {
		String driverTypeName = getProperty(DRIVER_TYPE_KEY);
		DriverType driverType = null;
		for (DriverType current : EnumSet.allOf(DriverType.class)) {
			if (current.getName().equals(driverTypeName)) {
				driverType = current;
				break;
			}
		}
		if (driverType != null)
			return driverType;
		else
			throw new PropertyParsingException("Invalid value of property driverType: " + driverTypeName);
	}

	/**
	 * @param driverType
	 *            the new driver type.
	 */
	public void setDriverType(DriverType driverType) {
		setProperty(DRIVER_TYPE_KEY, driverType.getName());
	}
}
