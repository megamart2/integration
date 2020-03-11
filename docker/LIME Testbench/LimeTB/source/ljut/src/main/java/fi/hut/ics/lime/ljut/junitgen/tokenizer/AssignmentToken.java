package fi.hut.ics.lime.ljut.junitgen.tokenizer;

/**
 * @author osaariki
 */
public class AssignmentToken implements Token {

	/**
	 * Initializes an AssignmentToken instance representing an assignment of a value to a field in an object.
	 * 
	 * @param left
	 *            the object's variable name.
	 * @param field
	 *            the field's name.
	 * @param right
	 *            the value to assign.
	 */
	public AssignmentToken(String left, String field, String right) {
		this.left = left;
		this.field = field;
		this.right = right;
	}

	/**
	 * @return the object's variable name.
	 */
	public String getLeft() {
		return left;
	}

	/**
	 * @return the field's name.
	 */
	public String getField() {
		return field;
	}

	/**
	 * @return the value to assign.
	 */
	public String getRight() {
		return right;
	}

	private String left, field, right;
}
