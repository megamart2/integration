package fi.hut.ics.lime.aspectmonitor;

import java.util.HashMap;

/**
 * @author sliedes
 * This class can be used to override the kind of exception thrown on
 * specification violation.
 * 
 * This is useful for example for instrumentation or automated testing of
 * interfaces.
 * 
 * This class should not (and cannot) be instantiated.
 */
public class ExceptionOverride {
	private ExceptionOverride() {} // forbid instantiation
	
	static private HashMap<Object,Class<? extends RuntimeException>> callExceptionOverrides =
		new HashMap<Object, Class<? extends RuntimeException>>();
	static private HashMap<Object,Class<? extends RuntimeException>> returnExceptionOverrides =
		new HashMap<Object, Class<? extends RuntimeException>>();
	
	/**
	 * Set the exception to be thrown on a call specification violation by
	 * an object.
	 */
	public static void setCallException(Object obj, Class<? extends RuntimeException> cls) {
		callExceptionOverrides.put(obj, cls);
	}

	/**
	 * Set the exception to be thrown on a return specification violation by
	 * an object.
	 */
	public static void setReturnException(Object obj, Class<? extends RuntimeException> cls) {
		returnExceptionOverrides.put(obj, cls);
	}

	/**
	 * Get the exception previously set for an object by setCallException(). 
	 */
	public static Class<? extends RuntimeException> getCallException(Object obj) {
		return callExceptionOverrides.get(obj);
	}
	
	/**
	 * Get the exception previously set for an object by setReturnException(). 
	 */
	public static Class<? extends RuntimeException> getReturnException(Object obj) {
		return returnExceptionOverrides.get(obj);
	}
}
