package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Represents an object parameter that is initialized with another object.
 * 
 * @author osaariki
 */
public class ReferenceObject extends ObjectParameter {

	/**
	 * Initializes a new instance.
	 * 
	 * @param type
	 *            the class of the object.
	 * @param variableName
	 *            the variable name to use for the object.
	 * @param referenced
	 *            the object this object is to be initialized to in it's construction statement.
	 */
	public ReferenceObject(Class<?> type, String variableName, ObjectParameter referenced) {
		super(type, variableName);
		this.referenced = referenced;
	}

	@Override
	public String getConstructionStatement() {
		return getType().getCanonicalName() + " " + getVariableName() + " = " + referenced.getVariableName();
	}

	private ObjectParameter referenced;
}
