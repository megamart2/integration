package fi.hut.ics.lime.ljut;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import joptsimple.OptionException;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;
import fi.hut.ics.lime.ljut.drivergen.CommonSettings;
import fi.hut.ics.lime.ljut.drivergen.DriverProperties;
import fi.hut.ics.lime.ljut.drivergen.DriverType;
import fi.hut.ics.lime.ljut.drivergen.InterfaceDriverSettings;
import fi.hut.ics.lime.ljut.drivergen.PropertyParsingException;
import fi.hut.ics.lime.ljut.drivergen.SimpleDriverSettings;
import fi.hut.ics.lime.ljut.junitgen.InterfaceTestMethod;
import fi.hut.ics.lime.ljut.junitgen.SimpleTestMethod;
import fi.hut.ics.lime.ljut.junitgen.TestClass;
import fi.hut.ics.lime.ljut.junitgen.parser.ParameterParser;
import fi.hut.ics.lime.ljut.junitgen.parser.ParameterParsingException;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.ParameterStringTokenizer;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.Token;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.TokenizingException;

/**
 * {@link JUnitGen} is the command line program for generating JUnit test cases from a driver .properties file and it's
 * accompanying .parameters (created by the LCT server) file.
 * 
 * @author osaariki
 */
public class JUnitGen {

	private static OptionSpec<Void> helpOption;
	private static OptionSpec<String> testClassNameOption;
	private static OptionSpec<File> parametersFileOption;
	private static OptionSpec<Void> overrideExceptionsOption;
	private static OptionSpec<Void> verboseOption;
	private static OptionSpec<Void> debugOption;

	private static OptionParser parser = new OptionParser() {
		{
			helpOption = accepts("help", "print this usage message");
			testClassNameOption = accepts(
					"test-class-name",
					"the desired fully qualified name of the test class, e.g. com.example.MyClass. Defaults to <driver name>TestCase in the default package.").withRequiredArg().ofType(
					String.class);
			parametersFileOption = accepts("parameters-file",
					"path to testing parameters file. This option overrides the path defined in the .properties file.").withRequiredArg().ofType(
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
			String driverPropertiesPath = null;
			if (mainArguments.size() == 1) {
				driverPropertiesPath = mainArguments.get(0);
			} else {
				exitWithUsage();
			}
			assert (driverPropertiesPath != null);

			Debug.printStage("Loading driver properties...");
			DriverProperties driverProperties = new DriverProperties();
			driverProperties.load(new FileInputStream(driverPropertiesPath));

			CommonSettings commonSettings = CommonSettings.parse(driverProperties);

			String testClassName;
			String packageName = null;
			if (options.has(testClassNameOption)) {
				QualifiedName testName = QualifiedName.parseQualifiedName(options.valueOf(testClassNameOption));
				testClassName = testName.getClassName();
				packageName = testName.getPackageName();
			} else
				testClassName = commonSettings.getDriverName() + "TestCase";

			TestClass testClass = new TestClass(testClassName, packageName);

			File parametersFile;
			if (options.has(parametersFileOption))
				parametersFile = options.valueOf(parametersFileOption);
			else
				parametersFile = commonSettings.getParametersFile();
			List<List<Token>> tokensList = tokenizeParameterStrings(loadParameterStrings(new FileInputStream(
					parametersFile)));

			DriverType driverType = driverProperties.getDriverType();

			if (driverType == DriverType.SIMPLE) {
				Debug.printStage("Driver type is \"" + driverType.getName() + "\". Parsing driver settings...");
				SimpleDriverSettings driverSettings = SimpleDriverSettings.parse(driverProperties);

				Constructor<?> constructor = driverSettings.getConstructor();
				Method method = driverSettings.getMethod();

				Debug.printStage("Parsing parameter tokens...");
				if (tokensList.size() > 1) {
					int num = 1;
					for (List<Token> tokens : tokensList) {
						Debug.printDetail("Parsing line " + num + ":");
						Debug.setPrefix("  ");

						SimpleTestMethod test = ParameterParser.parseAsSimpleTestMethod(constructor, method, tokens);
						test.setOverrideExceptions(options.has(overrideExceptionsOption));
						// Append a running number to the method name to avoid duplicate names
						test.setName(test.getName() + num);
						testClass.addTestMethod(test);
						++num;

						Debug.setPrefix("");
					}
				} else if (tokensList.size() == 1) {
					SimpleTestMethod test = ParameterParser.parseAsSimpleTestMethod(constructor, method,
							tokensList.get(0));
					test.setOverrideExceptions(options.has(overrideExceptionsOption));
					testClass.addTestMethod(test);
				} else
					exit(parametersFile.getName() + " does not contain any test parameters.", 1);

			} else if (driverType == DriverType.INTERFACE) {
				Debug.printStage("Driver type is \"" + driverType.getName() + "\". Parsing driver settings...");
				InterfaceDriverSettings driverSettings = InterfaceDriverSettings.parse(driverProperties);

				Class<?> interfaceClass = driverSettings.getInterfaceClass();
				Constructor<?> constructor = driverSettings.getConstructor();
				List<Method> methods = driverSettings.getMethods();
				int iterations = driverSettings.getIterations();

				Debug.printStage("Parsing parameter tokens...");
				if (tokensList.size() > 1) {
					int num = 1;
					for (List<Token> tokens : tokensList) {
						Debug.printDetail("Parsing line " + num + ":");
						Debug.setPrefix("  ");

						InterfaceTestMethod test = ParameterParser.parseAsInterfaceTestMethod(interfaceClass,
								constructor, methods, iterations, tokens);
						test.setOverrideExceptions(options.has(overrideExceptionsOption));
						// Append a running number to the method name to avoid duplicate names
						test.setName(test.getName() + num);
						testClass.addTestMethod(test);
						++num;

						Debug.setPrefix("");
					}
				} else if (tokensList.size() == 1) {
					InterfaceTestMethod test = ParameterParser.parseAsInterfaceTestMethod(interfaceClass, constructor,
							methods, iterations, tokensList.get(0));
					test.setOverrideExceptions(options.has(overrideExceptionsOption));
					testClass.addTestMethod(test);
				} else
					exit(parametersFile.getName() + ".parameters does not contain any test parameters.", 1);

			} else {
				exit("Unknown driver type: " + driverType.getName(), 1);
			}

			Debug.printStage("Writing test class...");
			OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(testClassName + ".java"));
			testClass.writeTo(out);
			out.close();
		} catch (ClassNotFoundException e) {
			exit("No class by name " + e.getMessage() + " found.", 1);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			exit(1);
		} catch (FileNotFoundException e) {
			exit("File " + e.getMessage() + " not found.", 1);
		} catch (IOException e) {
			e.printStackTrace();
			exit(1);
		} catch (PropertyParsingException e) {
			e.printStackTrace();
			exit(1);
		} catch (ParameterParsingException e) {
			e.printStackTrace();
			exit(1);
		} catch (TokenizingException e) {
			e.printStackTrace();
			exit(1);
		} catch (SignatureParsingException e) {
			e.printStackTrace();
			exit(1);
		} catch (OptionException e) {
			exitWithUsage();
		}
		Debug.printStage("Finished.");
	}

	private static List<List<Token>> tokenizeParameterStrings(List<String> parameterStrings) throws TokenizingException {
		Debug.printStage("Tokenizing testing parameters...");
		List<List<Token>> tokenLists = new ArrayList<List<Token>>();
		int i = 0;
		for (String parameterString : parameterStrings) {
			Debug.printDetail("Tokenizing line " + ++i + ":");
			Debug.setPrefix("  ");
			tokenLists.add(ParameterStringTokenizer.tokenize(parameterString));
			Debug.setPrefix("");
		}
		return tokenLists;
	}

	private static List<String> loadParameterStrings(InputStream is) throws IOException {
		Debug.printStage("Loading testing parameters...");
		List<String> parameterStrings = new ArrayList<String>();

		BufferedReader r = new BufferedReader(new InputStreamReader(is));
		String line;
		while ((line = r.readLine()) != null && !line.equals("")) {
			parameterStrings.add(line);
		}

		return parameterStrings;
	}

	private static void exitWithUsage() {
		try {
			System.out.println("Usage: command [options...] <driver properties>");
			System.out.println();
			System.out.println("<driver properties> is the driver properties file to process.");
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
