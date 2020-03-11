/**
 * Represents all the command-line settings that define how the program
 * should behave, e.g. whether to print output or operate silently.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec;

public class Settings {

	// Output info to stdout if true, otherwise only print errors
	private static boolean verbose = true;
	
	public static boolean isVerbose() {
		return verbose;
	}
	
	public static void setVerbose(boolean isVerbose) {
		verbose = isVerbose;
	}
	
}
