package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Represents a parameter of one of the primitive types.
 * 
 * @author osaariki
 */
public class Primitive implements Parameter {

	/**
	 * Initializes a new instance with an Integer value.
	 * 
	 * @param value
	 */
	public Primitive(Integer value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Short value.
	 * 
	 * @param value
	 */
	public Primitive(Short value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Boolean value.
	 * 
	 * @param value
	 */
	public Primitive(Boolean value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Long value.
	 * 
	 * @param value
	 */
	public Primitive(Long value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Double value.
	 * 
	 * @param value
	 */
	public Primitive(Double value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Float value.
	 * 
	 * @param value
	 */
	public Primitive(Float value) {
		this.value = value;
	}

	/**
	 * Initializes a new instance with an Byte value.
	 * 
	 * @param value
	 */
	public Primitive(Byte value) {
		this.value = value;
	}

	@Override
	public String getExpression() {
		if (value instanceof Short)
			return "((short) " + value + ")";
		if (value instanceof Byte)
			return "((byte) " + value + ")";
		if (value instanceof Long)
			return value + "l";
		if (value instanceof Float)
			return value + "f";
		if (value instanceof Double)
			return value + "d";
		return value.toString();
	}

	private Object value;
}
