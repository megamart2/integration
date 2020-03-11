package fi.hut.ics.lime.ljut;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import joptsimple.OptionException;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;
import fi.hut.ics.lime.ljut.drivergen.CommonSettings;
import fi.hut.ics.lime.ljut.drivergen.DriverProperties;
import fi.hut.ics.lime.ljut.drivergen.InterfaceDriver;
import fi.hut.ics.lime.ljut.drivergen.InterfaceDriverSettings;

/**
 * {@link InterfaceDriverGen} is the command line program for generating LCT test drivers for an interface and its
 * implementation.
 * 
 * @author osaariki
 */
public class InterfaceDriverGen {

	private static OptionSpec<Void> helpOption;
	private static OptionSpec<String> driverNameOption;
	private static OptionSpec<String> methodsOption;
	private static OptionSpec<File> propertiesFileOption;
	private static OptionSpec<File> parametersFileOption;
	private static OptionSpec<Void> overrideExceptionsOption;
	private static OptionSpec<Void> verboseOption;
	private static OptionSpec<Void> debugOption;

	private static OptionParser parser = new OptionParser() {
		{
			helpOption = accepts("help", "print this usage message");
			driverNameOption = accepts(
					"driver-name",
					"the desired fully qualified name of the driver, e.g. com.example.MyClass. Defaults to <test class name>LCTDriver in the default package.").withRequiredArg().ofType(
					String.class);
			methodsOption = accepts(
					"methods",
					"optional semicolon separated list of method signatures of the form <qualified name> or <qualified name>(<parameters>), where <parameters> is a comma separated list of parameter class names, e.g. foo(int);foo(int,java.lang.String);bar").withRequiredArg().ofType(
					String.class);
			propertiesFileOption = accepts("properties-file",
					"path to file where the driver properties will be written. Defaults to <driver class name>.properties.").withRequiredArg().ofType(
					File.class);
			parametersFileOption = accepts(
					"parameters-file",
					"path to file where the testing parameters will be found in the JUnit test generation phase. Defaults to <driver class name>.parameters.").withRequiredArg().ofType(
					File.class);
			overrideExceptionsOption = accepts("override-exceptions",
					"override exceptions from call specification violations so that inconclusive tests do not fail");
			verboseOption = accepts("verbose", "notify of processing stages");
			debugOption = accepts("debug", "notify of processing details");
		}
	};

	/**
	 * @param args
	 *            the command line arguments.
	 */
	public static void main(String[] args) {
		try {
			OptionSet options = parser.parse(args);

			if (options.has(helpOption))
				exitWithUsage();

			if (options.has(debugOption))
				Debug.setVerbosity(Debug.Verbosity.DETAILS);
			else if (options.has(verboseOption))
				Debug.setVerbosity(Debug.Verbosity.STAGES);
			else
				Debug.setVerbosity(Debug.Verbosity.OFF);

			List<String> mainArguments = options.nonOptionArguments();
			String interfaceName = null, constructor = null;
			int iterations = 0;
			if (mainArguments.size() == 3) {
				interfaceName = mainArguments.get(0);
				constructor = mainArguments.get(1);
				iterations = Integer.parseInt(mainArguments.get(2));
			} else {
				exitWithUsage();
			}
			assert (interfaceName != null && constructor != null);

			Debug.printStage("Parsing driver settings...");
			InterfaceDriverSettings driverSettings;
			if (options.has(methodsOption))
				driverSettings = InterfaceDriverSettings.parse(interfaceName, constructor,
						options.valueOf(methodsOption), iterations);
			else
				driverSettings = InterfaceDriverSettings.parse(interfaceName, constructor, iterations);

			if (!driverSettings.getInterfaceClass().isAssignableFrom(
					driverSettings.getConstructor().getDeclaringClass()))
				exit("The given constructor must be one for a class implementing or subclassing the given "
						+ "interface class.", 1);

			String driverClassName;
			String driverPackageName = null;
			if (options.has(driverNameOption)) {
				QualifiedName driverName = QualifiedName.parseQualifiedName(options.valueOf(driverNameOption));
				driverClassName = driverName.getClassName();
				driverPackageName = driverName.getPackageName();
			} else
				driverClassName = driverSettings.getConstructor().getDeclaringClass().getSimpleName() + "LCTDriver";

			File parametersFile;
			if (options.has(parametersFileOption))
				parametersFile = options.valueOf(parametersFileOption);
			else
				parametersFile = new File(driverClassName + ".parameters");

			Debug.printStage("Creating driver instance...");
			InterfaceDriver driver = new InterfaceDriver(driverPackageName, driverClassName,
					driverSettings.getInterfaceClass(), driverSettings.getConstructor(), driverSettings.getMethods(),
					driverSettings.getIterations(), options.has(overrideExceptionsOption));
			CommonSettings commonSettings = new CommonSettings(driverClassName, parametersFile);

			Debug.printStage("Writing driver source...");
			OutputStreamWriter sourceOut = new OutputStreamWriter(new FileOutputStream(driverClassName + ".java"));
			try {
				driver.writeTo(sourceOut);
			} finally {
				sourceOut.close();
			}

			Debug.printStage("Writing driver properties...");
			DriverProperties driverProperties = new DriverProperties();
			commonSettings.writeTo(driverProperties);
			driver.getDriverSettings().writeTo(driverProperties);

			OutputStream propertiesOut;
			if (options.has(propertiesFileOption))
				propertiesOut = new FileOutputStream(options.valueOf(propertiesFileOption));
			else
				propertiesOut = new FileOutputStream(driverClassName + ".properties");

			try {
				driverProperties.store(propertiesOut, "Generated by " + InterfaceDriverGen.class.getCanonicalName());
			} finally {
				propertiesOut.close();
			}

		} catch (FileNotFoundException e) {
			exit("File " + e.getMessage() + " not found.", 1);
		} catch (ClassNotFoundException e) {
			exit("No class by name " + e.getMessage() + " found.", 1);
		} catch (IOException e) {
			e.printStackTrace();
			exit(1);
		} catch (SignatureParsingException e) {
			exit(e.getMessage(), 1);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			exit(1);
		} catch (OptionException e) {
			exitWithUsage();
		}
		Debug.printStage("Finished.");
	}

	private static void exitWithUsage() {
		try {
			System.out.println("Usage: command [options...] <interface> <constructor signature> <iterations>");
			System.out.println();
			System.out.println("<interface> is a fully qualified name of an interface.");
			System.out.println();
			System.out.println("<constructor signature> if of the form <qualified name> or \n"
					+ "<qualified name>(<parameters>), where <parameters> is a comma separated list \n"
					+ "of qualified parameter class names, e.g. \"java.lang.Integer(int)\" or \n"
					+ "\"java.lang.String\".");
			System.out.println();
			System.out.println("<iterations> is the number of methods to call on each testing pass.");
			System.out.println();
			parser.printHelpOn(System.out);
		} catch (IOException e) {
			e.printStackTrace();
		}
		exit(1);
	}

	private static void exit(String message, int status) {
		if (status == 0)
			System.out.println(message);
		else
			System.err.println(message);
		exit(status);
	}

	private static void exit(int status) {
		System.exit(status);
	}
}
