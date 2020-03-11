package fi.hut.ics.lime.ljut.junitgen.parser;

import java.lang.reflect.Field;

import fi.hut.ics.lime.ljut.junitgen.CommonSnippets;

/**
 * Represents an assignment to an objects field. The assignment is made with a call to the setField method defined in
 * {@link CommonSnippets}.
 * 
 * @author osaariki
 */
public class Assignment {

	/**
	 * Initializes a new instance.
	 * 
	 * @param left
	 *            the object.
	 * @param field
	 *            the field in the object.
	 * @param right
	 *            the value to assign to that field.
	 */
	public Assignment(ObjectParameter left, Field field, Parameter right) {
		this.left = left;
		this.field = field;
		this.right = right;
	}

	/**
	 * @return the statement to that accomplishes this assignment.
	 */
	public String getStatement() {
		return "setField(" + left.getVariableName() + ", \"" + field.getName() + "\", " + right.getExpression() + ");";
	}

	private ObjectParameter left;
	private Field field;
	private Parameter right;
}
