package fi.hut.ics.lime.ljut;

import java.util.EnumSet;

/**
 * This enumeration lists all the primitive types supported by LCT.
 * 
 * @author osaariki
 */
public enum LCTType {

	INT(int.class, "getInteger()"),
	BOOLEAN(boolean.class, "getBoolean()"),
	BYTE(byte.class, "getByte()"),
	SHORT(short.class, "getShort()"),
	LONG(long.class, "getLong()");

	LCTType(Class<?> typeClass, String lctCall) {
		this.typeClass = typeClass;
		this.lctCall = lctCall;
	}

	/**
	 * @return the class object of the primitive type.
	 */
	public Class<?> getTypeClass() {
		return typeClass;
	}

	/**
	 * @return the name of the primitive type.
	 */
	public String getName() {
		return typeClass.getName();
	}

	/**
	 * @return the LCT get method for this primitive type, e.g. "LCT.getInteger()".
	 */
	public String getLctCall() {
		return lctCall;
	}
	
	/**
	 * Resolves a given primitive type's class into a LCTType.
	 * 
	 * @param c the class to resolve.
	 * @return the corresponding LCTType if the given class is a supported primitive type, else <code>null</code>.
	 */
	public static LCTType getTypeForClass(Class<?> c) {
		for (LCTType l : EnumSet.allOf(LCTType.class))
			if (l.typeClass.equals(c))
				return l;
		return null;
	}

	private final Class<?> typeClass;
	private final String lctCall;
}
