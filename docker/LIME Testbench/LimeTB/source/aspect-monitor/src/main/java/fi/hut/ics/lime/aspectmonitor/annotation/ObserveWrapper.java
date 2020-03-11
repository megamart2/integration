package fi.hut.ics.lime.aspectmonitor.annotation;

import spoon.reflect.declaration.CtMethod;

/**
 * A wrapper for Observe, needed because Java annotations cannot
 * have null default values. 
 * @author sliedes
 */
public class ObserveWrapper {
	private Observe annotation;

	/**
	 * A "default exception" which takes the place of null values.
	 */
	class DummyDefaultException extends Exception {
		private static final long serialVersionUID = -4092312578313475673L;
	}
	
	/**
	 * Get the Observes of a method.
	 * @param method the method to get Observes for
	 */
	public ObserveWrapper(CtMethod<?> method) {
		annotation = method.getAnnotation(Observe.class);
	}
	
	/**
	 * The specs to associate with this method.
	 * @return an array of names of specs
	 */
	public String[] specs() {
		return annotation.specs();
	}
	
	/**
	 * @return the exception to throw on violation of call specification
	 */
	public Class<? extends Exception> callSpecificationException() {
		if (annotation.callException() == DummyDefaultException.class)
			return null;
		return annotation.callException();
	}

	/**
	 * @return the exception to throw on violation of return specification
	 */
	public Class<? extends Exception> returnSpecificationException() {
		if (annotation.returnException() == DummyDefaultException.class)
			return null;
		return annotation.returnException();
	}

	/**
	 * @return true if a Observe annotation is associated with the method the 
	 * wrapper was constructed with.
	 */
	public boolean hasObserve() {
		return (annotation != null);
	}

}
