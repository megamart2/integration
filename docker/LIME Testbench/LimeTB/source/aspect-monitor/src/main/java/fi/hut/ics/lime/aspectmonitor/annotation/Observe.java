package fi.hut.ics.lime.aspectmonitor.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * This annotation forces the named specs to be enforced
 * in the annotated method.
 * @author jalampin
 *
 */
@Retention(value = RetentionPolicy.SOURCE)
@Target(value = { ElementType.METHOD })
public @interface Observe {
	/**
	 * Specs to be enforced in the annotated method.
	 */
	String[] specs() default {};
	
	/**
	 * The exception to be thrown on an call specification violation.
	 */
	Class<? extends Exception> callException()
		default ObserveWrapper.DummyDefaultException.class;
	
	/**
	 * The exception to be thrown on a return specification violation.
	 */
	Class<? extends Exception> returnException()
		default ObserveWrapper.DummyDefaultException.class;
}
