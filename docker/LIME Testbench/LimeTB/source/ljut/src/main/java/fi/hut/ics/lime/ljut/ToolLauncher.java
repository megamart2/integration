package fi.hut.ics.lime.ljut;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.EnumSet;

/**
 * Launches the applications in ljut based on a user supplied tool name. Primarily meant for use in a executable jar
 * file.
 * 
 * @author osaariki
 */
public class ToolLauncher {

	private enum Tool {

		SIMPLE(SimpleDriverGen.class, "simple", "the simple driver (one class, one method) generator"),
		INTERFACE(InterfaceDriverGen.class, "interface", "the interface driver generator"),
		JUNIT(JUnitGen.class, "junit", "the junit test generator");

		Tool(Class<?> toolClass, String command, String description) {
			this.toolClass = toolClass;
			this.command = command;
			this.description = description;
		}

		Method getMainMethod() throws NoSuchMethodException {
			return toolClass.getMethod("main", String[].class);
		}

		String getCommand() {
			return command;
		}

		String getDescription() {
			return description;
		}

		private Class<?> toolClass;
		private String command;
		private String description;
	}

	/**
	 * @param args
	 *            the command line arguments.
	 */
	public static void main(String[] args) {
		String subcommand = null;
		if (args.length >= 1)
			subcommand = args[0];
		else
			exitWithUsage();
		assert (subcommand != null);

		Method mainMethod = null;
		for (Tool tool : EnumSet.allOf(Tool.class))
			if (tool.getCommand().equals(subcommand))
				try {
					mainMethod = tool.getMainMethod();
				} catch (NoSuchMethodException e) {
					exit("Error: Found subcommand " + subcommand
							+ " but corresponding class does not declare a main method.", 1);
				}

		if (mainMethod != null) {
			String[] subcommandArgs = Arrays.copyOfRange(args, 1, args.length);
			try {
				mainMethod.invoke(null, (Object) subcommandArgs);
			} catch (InvocationTargetException e) {
				e.printStackTrace();
				exit(1);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
				exit(1);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
				exit(1);
			}
		} else {
			System.out.println("Subcommand " + subcommand + " doesn't exist.");
			System.out.println();
			exitWithUsage();
		}
	}

	private static void exitWithUsage() {
		System.out.println("Usage: command <subcommand>");
		System.out.println();
		System.out.println("Subcommands");
		System.out.println("-----------");
		for (Tool tool : EnumSet.allOf(Tool.class))
			System.out.println(tool.command + " - " + tool.getDescription());
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
