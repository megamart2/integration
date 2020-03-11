package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Abstract base class for all object parameters. Note that null objects are not subclasses of this class because they
 * don't need the type information.
 * 
 * @author osaariki
 */
public abstract class ObjectParameter implements Parameter {

	/**
	 * Initializes a new instance.
	 * 
	 * @param type
	 *            the class of this object.
	 * @param variableName
	 *            the variable name to use with this object.
	 */
	public ObjectParameter(Class<?> type, String variableName) {
		this.type = type;
		this.variableName = variableName;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof ObjectParameter) {
			ObjectParameter other = (ObjectParameter) obj;
			return type.equals(other.type) && variableName.equals(other.variableName);
		} else {
			return super.equals(obj);
		}
	}

	@Override
	public int hashCode() {
		return type.hashCode() + variableName.hashCode();
	}

	/**
	 * @return the class of this object.
	 */
	public Class<?> getType() {
		return type;
	}

	/**
	 * @param type
	 *            a new type for this object.
	 */
	public void setType(Class<?> type) {
		this.type = type;
	}

	/**
	 * @return the variable name this object uses.
	 */
	public String getVariableName() {
		return variableName;
	}

	/**
	 * @param variableName
	 *            a new variable name to use for this object.
	 */
	public void setVariableName(String variableName) {
		this.variableName = variableName;
	}

	@Override
	public String getExpression() {
		return variableName;
	}

	/**
	 * @return the statement that accomplishes the construction of this object.
	 */
	public abstract String getConstructionStatement();

	private Class<?> type;
	private String variableName;
}
