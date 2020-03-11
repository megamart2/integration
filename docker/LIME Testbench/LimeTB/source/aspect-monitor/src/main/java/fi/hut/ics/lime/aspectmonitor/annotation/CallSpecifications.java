package fi.hut.ics.lime.aspectmonitor.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import fi.hut.ics.lime.aspectmonitor.CallSpecificationException;
/**
 * The annotation for declaring call specifications.
 * @author jalampin
 */
@Retention(value = RetentionPolicy.SOURCE)
@Target(value = ElementType.TYPE)
public @interface CallSpecifications {
	/**
	 * Value propositions are named native code propositions with boolean values.
	 */
	String[] valuePropositions() default {};

	/**
	 * Call propositions are named propositions that correspond to method calls.
	 */
	String[] callPropositions() default {};
	
	/**
	 * PLTL specs are declarations about proper behavior in LTL.
	 */
	String[] pltl() default {};
	
	/**
	 * Regexp specs are declarations about proper behavior using regular expressions. 
	 * @return
	 */
	String[] regexp() default {};
	
	/**
	 * NFA specs are always_nfa declarations about proper behavior.
	 * They are most useful for automatic generation of such declarations. 
	 */
	String[] nfa() default {};
	
	/**
	 * The exception to be thrown by default on violation of this spec.
	 * It can be overridden in the Observe annotation.
	 */
	Class<? extends Exception> exception() default CallSpecificationException.class; 
}
