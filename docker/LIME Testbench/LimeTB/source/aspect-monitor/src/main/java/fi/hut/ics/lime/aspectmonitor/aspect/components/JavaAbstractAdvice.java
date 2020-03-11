/**
 * Java-specific AbstractAdvice. 'this' is a reasonable expression on the
 * Java side, while it has no meaning on the C side. This class ties the
 * word 'this' to a specific class. It also contains information on possible
 * exceptions thrown by the advice.
 */
package fi.hut.ics.lime.aspectmonitor.aspect.components;

import java.util.HashSet;
import java.util.Set;

import fi.hut.ics.lime.common.aspect.components.AbstractAdvice;

public abstract class JavaAbstractAdvice extends AbstractAdvice {

	/** Whether this advice references the target class. */
	protected Boolean referencesTarget = false;
	/** The target class this advice references, if any. */
	protected String target;
	/* The exceptions thrown by this advice, if any */
	private Set<Class<? extends Exception>> thrownExceptions =
				new HashSet<Class<? extends Exception>>();
	
	public void setTarget(String class1) {
		target = class1;
	}
				
	/**
	 * Set the target of this advice and specify that the advice references it.  
	 * @param class1 the target, referenced by this advice
	 * @author jalampin
	 */
	public void referencesTarget(String class1) {
		referencesTarget = true;
		target = class1;
	}
	
	/**
	 * Add an exception that may be thrown by this advice.
	 * @param e the exception to add
	 */
	public void addThrownException(Class<? extends Exception> e) {
		thrownExceptions.add(e);
	}
	
	/**
	 * Get the set of exceptions that may be thrown by this advice.
	 * @return a set of exceptions
	 */
	public Set<Class<? extends Exception>> getThrownExceptions() {
		return thrownExceptions;
	}
	
	/**
	 * Set the entire set of exceptions that may be thrown by this advice.
	 * @param thrownExceptions the entire set of exceptions that may be thrown
	 */
	public void setThrownExceptions(Set<Class<? extends Exception>> thrownExceptions) {
		this.thrownExceptions = thrownExceptions;
	}
	
}
