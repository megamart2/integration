package fi.hut.ics.lime.ljut.drivergen;

import java.io.File;

/**
 * Settings common to all test drivers.
 * 
 * @author osaariki
 */
public class CommonSettings extends DriverSettings {

	private static final String DRIVER_NAME_KEY = "driverName";
	private static final String PARAMETERS_FILE_KEY = "parametersFile";

	/**
	 * Initializes a new instance.
	 * 
	 * @param driverName
	 *            the driver name.
	 * @param parametersFile
	 *            the parameters file.
	 */
	public CommonSettings(String driverName, File parametersFile) {
		this.driverName = driverName;
		this.parametersFile = parametersFile;
	}

	/**
	 * Parses settings from the given {@link DriverProperties}.
	 * 
	 * @param properties
	 *            the properties to parse.
	 * @return the parsed settings.
	 */
	public static CommonSettings parse(DriverProperties properties) {
		return new CommonSettings(properties.getProperty(DRIVER_NAME_KEY), new File(
				properties.getProperty(PARAMETERS_FILE_KEY)));
	}

	@Override
	public void writeTo(DriverProperties properties) {
		properties.setProperty(DRIVER_NAME_KEY, driverName);
		properties.setProperty(PARAMETERS_FILE_KEY, parametersFile.getPath());
	}
	
	/**
	 * @return the driver name.
	 */
	public String getDriverName() {
		return driverName;
	}

	/**
	 * @return the parameters file.
	 */
	public File getParametersFile() {
		return parametersFile;
	}

	private String driverName;
	private File parametersFile;
}
