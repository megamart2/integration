package fi.hut.ics.lime.common.utils;

/**
 * A debug printer class
 *
 * @author sliedes
 */
public class Debug {
	private static boolean enabled = false;
	
	public static void println(String str) {
		if (enabled)
			System.err.println(str);
	}
	
	public static void enable() {
		enabled = true;
	}
	
	public static void disable() {
		enabled = false;
	}
	
}
