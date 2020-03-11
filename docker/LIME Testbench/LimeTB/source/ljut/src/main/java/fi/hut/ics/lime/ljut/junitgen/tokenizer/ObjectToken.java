package fi.hut.ics.lime.ljut.junitgen.tokenizer;

/**
 * @author osaariki
 */
public class ObjectToken implements Token {

	/**
	 * Initializes a new object token. If left and right are equal this represents a new object. Else this is just a new
	 * name for an old object.
	 * 
	 * @param left the variable name of this object.
	 * @param right same as left or a variable name of an previously introduced object.
	 */
	public ObjectToken(String left, String right) {
		this.left = left;
		this.right = right;
	}

	/**
	 * @return the left side.
	 */
	public String getLeft() {
		return left;
	}

	/**
	 * @return the right side.
	 */
	public String getRight() {
		return right;
	}

	private String left, right;
}
