package fi.hut.ics.lime.ljut.drivergen;

/**
 * The known driver types.
 * 
 * @author osaariki
 */
public enum DriverType {

	/**
	 * Implemented by {@link SimpleDriver}.
	 */
	SIMPLE("simple"),
	/**
	 * Implemented by {@link InterfaceDriver}.
	 */
	INTERFACE("interface");

	DriverType(String name) {
		this.name = name;
	}

	/**
	 * @return the name of this driver type.
	 */
	public String getName() {
		return name;
	}

	private final String name;
}
