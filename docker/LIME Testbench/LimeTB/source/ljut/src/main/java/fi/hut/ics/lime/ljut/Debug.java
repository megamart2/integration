package fi.hut.ics.lime.ljut;

import java.io.PrintStream;

/**
 * This class contains static methods to support debug message printouts. The verbosity used determines which messages
 * actually get printed to the current {@link PrintStream}.
 * 
 * @author osaariki
 */
public class Debug {

	/**
	 * Possible verbosity levels.
	 * 
	 * @author osaariki
	 */
	public enum Verbosity {
		/**
		 * No debug messages are printed.
		 */
		OFF,
		/**
		 * Only messages about general stages of processing are printed.
		 */
		STAGES,
		/**
		 * All debug messages are printed.
		 */
		DETAILS;
	}

	/**
	 * @param verbosity
	 *            the new verbosity level to use.
	 */
	public static void setVerbosity(Verbosity verbosity) {
		Debug.verbosity = verbosity;
	}

	/**
	 * @param ps
	 *            the {@link PrintStream} to use.
	 */
	public static void setPrintStream(PrintStream ps) {
		Debug.ps = ps;
	}

	/**
	 * Prints a message informing of a general stage of processing, e.g. "Parsing testing parameters".
	 * 
	 * @param s
	 *            the message.
	 */
	public static void printStage(String s) {
		if (verbosity == Verbosity.STAGES || verbosity == Verbosity.DETAILS)
			ps.println(prefix + s);
	}

	/**
	 * Prints a message informing of a detail of processing, e.g. "Tokenizing line 24".
	 * 
	 * @param s
	 *            the message.
	 */
	public static void printDetail(String s) {
		if (verbosity == Verbosity.DETAILS)
			ps.println(prefix + s);
	}

	/**
	 * @return the prefix.
	 */
	public static String getPrefix() {
		return prefix;
	}

	/**
	 * Sets a prefix string to be added to all printed lines.
	 * 
	 * @param prefix the prefix to use.
	 */
	public static void setPrefix(String prefix) {
		Debug.prefix = prefix;
	}

	private Debug() {
	}

	private static PrintStream ps = System.out;
	private static Verbosity verbosity = Verbosity.OFF;
	private static String prefix = "";
}
