/**
 * Represents a non-automatic (i.e. defined outside any functions) variable
 * contained in a C source code file.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.sourcecode;

import fi.hut.ics.lime.common.sourcecode.Variable;
import fi.hut.ics.lime.common.sourcecode.Visibility;

public class CVariable implements Variable {

	private final String name;
	private final String type;
	private final String typeDetails;
	private final Visibility visibility;
	
	public CVariable(String name, String type, String typeDetails, 
					Visibility visibility) {
		
		assert (name != null && type != null && visibility != null) :
			"Attempted to create a new CVariable without sufficent information.";
		
		this.name = name;
		this.type = type;
		this.typeDetails = typeDetails;
		this.visibility = visibility;
	
	}
	
	/**
	 * @return the name of this variable
	 */
	public String getSimpleName() {
		return this.name;
	}

	/**
	 * @return the type of this variable. If the variable is a pointer, the
	 * pointer symbol is included in the type (e.g. for "int *anInt" returns
	 * "int *").
	 * 
	 * However, if the variable is an array, the brackets must be fetched 
	 * through getTypeDetails(). For "char myArray[]", getType returns "char".
	 */
	public String getType() {
		return this.type;
	}

	/**
	 * @return details on the type of this variable. Basically, if the 
	 * variable is an array, returns the square brackets. May also return
	 * for example [10] for an array defined to be of size 10, or [2][3]
	 * for a two dimensional array with a defined size.
	 */
	public String getTypeDetails() {
		return this.typeDetails;
	}

	/**
	 * @return the Visibility enum indicating the visibility of this
	 * variable (e.g. static or non-static in C)
	 */
	public Visibility getVisibility() {
		return this.visibility;
	}
	
}
