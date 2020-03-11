package fi.hut.ics.lime.limec.aspect.components;

import fi.hut.ics.lime.common.specification.propositions.Proposition;

public class CProceed {

	private String type;
	
	/**
	 * Creates an empty proceed statement "proceed();"
	 * without a return type or parameters.
	 */
	public CProceed() {
		this.type = null;
	}
	
	/**
	 * Getter for the return type of the proceed expression.
	 * 
	 * @return return type of proceed expression as a String.
	 *   null is returned if void.
	 */
	public String getType() {
		return this.type;
	}
	
	/**
	 * Setter for the return type of proceed expression.
	 * 
	 * @param type return type as a String
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * String representation of the proceed statement.
	 */
	@Override
	public String toString() {
		String s = (type == null ? "\t" : "\t" + this.type +" "+Proposition.RESULT+" = ");
		s += "proceed();\n";
		return s;
	}
	
}
