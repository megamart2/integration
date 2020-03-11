package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Represents an object that is assigned a new instance from it's class's nullary constructor.
 * 
 * @author osaariki
 */
public class NewObject extends ObjectParameter {

	/**
	 * Initializes a new instance.
	 * 
	 * @param type the class of this object.
	 * @param variableName the variable name to use for this object.
	 */
	public NewObject(Class<?> type, String variableName) {
		super(type, variableName);
	}

	@Override
	public String getConstructionStatement() {
		return getType().getCanonicalName() + " " + getVariableName() + " = new " + getType().getCanonicalName()
				+ "();";
	}
}
