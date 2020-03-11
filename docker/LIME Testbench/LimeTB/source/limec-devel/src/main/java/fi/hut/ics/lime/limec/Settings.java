package fi.hut.ics.lime.limec;

public class Settings {
	
	private static boolean conciseError = false;
	private static boolean exit = false;
	private static int observerLimit = -1; // -1 means the limit hasn't been set here
	private static String printFunction = null;
	
	public static void enableConciseError() {
		conciseError = true;
	}
	public static void disableConciseError() {
		conciseError = false;
	}
	public static boolean isConciseError() {
		return conciseError;
	}
	
	public static void enableExit() {
		exit = true;
	}
	public static void disableExit() {
		exit = false;
	}
	public static boolean isExit() {
		return exit;
	}
	
	public static void setObserverLimit(int limit) {
		observerLimit = limit;
	}
	public static boolean isObserverLimit() {
		return observerLimit > 0;
	}
	public static int getObserverLimit() {
		return observerLimit;
	}
	
}
