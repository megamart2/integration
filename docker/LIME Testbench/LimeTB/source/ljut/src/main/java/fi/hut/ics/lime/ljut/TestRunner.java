package fi.hut.ics.lime.ljut;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import joptsimple.OptionException;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.ParameterStringTokenizer;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.Token;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.TokenizingException;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.ValueToken;
import fi.hut.ics.lime.tester.LCT;

public class TestRunner {

	private static OptionSpec<Void> helpOption;
	private static OptionSpec<String> testInputOption;
	private static OptionSpec<String> testTargetOption;
	private static OptionSpec<Void> verboseOption;
	private static OptionSpec<Void> debugOption;

	private static OptionParser parser = new OptionParser() {
		{
			helpOption = accepts("help", "print this usage message");
			testInputOption = accepts("input", "Test input string used in the test run to rerun").withRequiredArg().ofType(
					String.class);
			testTargetOption = accepts("target", "Name of the class with the main method to test").withRequiredArg().ofType(
					String.class);
			verboseOption = accepts("verbose", "notify of processing stages");
			debugOption = accepts("debug", "notify of processing details");
		}
	};

	/**
	 * @param args
	 *            the command line arguments.
	 * @throws Throwable
	 *             from the called test target.
	 */
	public static void main(String[] args) throws Throwable {
		String testInputString, testTargetName;
		List<String> passThroughOptions;
		try {
			OptionSet options = parser.parse(args);

			if (options.has(helpOption) || !options.has(testInputOption) || !options.has(testTargetOption))
				exitWithUsage();

			if (options.has(debugOption))
				Debug.setVerbosity(Debug.Verbosity.DETAILS);
			else if (options.has(verboseOption))
				Debug.setVerbosity(Debug.Verbosity.STAGES);
			else
				Debug.setVerbosity(Debug.Verbosity.OFF);

			testInputString = options.valueOf(testInputOption);
			testTargetName = options.valueOf(testTargetOption);

			passThroughOptions = options.nonOptionArguments();
		} catch (OptionException e) {
			exitWithUsage();
			return;
		}

		Class<?> targetClass;
		try {
			targetClass = Class.forName(testTargetName);
		} catch (ClassNotFoundException e) {
			exit("No class by name " + e.getMessage() + " found.", 1);
			return;
		}

		Method mainMethod;
		try {
			mainMethod = targetClass.getMethod("main", String[].class);
		} catch (NoSuchMethodException e) {
			exit("The target class does not contain a main method.", 1);
			return;
		}

		Debug.printStage("Parsing test input string...");
		List<Token> tokens;
		try {
			tokens = ParameterStringTokenizer.tokenize(testInputString);
		} catch (TokenizingException e) {
			exit(e.getMessage(), 1);
			return;
		}

		for (Token token : tokens)
			if (!(token instanceof ValueToken))
				exit("Non-value token encountered in test input. Only primitive type input is supported.", 1);
			else
				LCT.addInputValue(((ValueToken) token).getData());

		Debug.printStage("Calling test target...");

		try {
			mainMethod.invoke(null, (Object) passThroughOptions.toArray(new String[0]));
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			throw e.getCause();
		}

		Debug.printStage("Test target finished.");
	}

	private static void exitWithUsage() {
		try {
			System.out.println("Usage: command [options...] --input <input string> --target <class name>");
			System.out.println("\t<arguments to test target>");
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
