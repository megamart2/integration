package fi.hut.ics.lime.common.sourcecode;

public interface Variable {

	/**
	 * @return the simple (unqualified) name of this Variable (whatever
	 * that means)
	 */
	public abstract String getSimpleName();
	
	/**
	 * @return the type of this Variable as a String (boolean, String, double,
	 * whatever)
	 */
	public abstract String getType();
	
	/**
	 * @return details about the type of this Variable as a String (is it a
	 * pointer, an array, an array of array...?)
	 */
	public abstract String getTypeDetails();
	
	/**
	 * @return the Visibility enum indicating the visibility of this
	 * variable (e.g. public, protected, private, default in Java, static or
	 * non-static in C)
	 */
	public abstract Visibility getVisibility();
	
}
