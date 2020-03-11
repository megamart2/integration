package fi.hut.ics.lime.ljut;

import java.util.EnumSet;
import java.util.regex.Pattern;

/**
 * Common methods and constants for the {@link MethodSignature} and {@link ConstructorSignature} classes.
 * 
 * @author osaariki
 */
public class SignatureUtils {

	public static final Pattern IDENTIFIER = Pattern.compile("([\\p{Alpha}_\\$][\\p{Alpha}_\\$\\d]*)");
	public static final Pattern QUALIFIED_NAME = Pattern.compile(IDENTIFIER + "(\\." + IDENTIFIER + ")*");
	public static final Pattern SIGNATURE_ONLY_NAME = QUALIFIED_NAME;
	public static final Pattern SIGNATURE_NAME_AND_PARAMETER_TYPES = Pattern.compile(QUALIFIED_NAME + "\\(("
			+ QUALIFIED_NAME + "( *, *" + QUALIFIED_NAME + ")*)?\\)");

	private SignatureUtils() {
	}

	public static Class<?> parameterTypeForName(String typeName) throws ClassNotFoundException {
		for (LCTType l : EnumSet.allOf(LCTType.class)) {
			if (typeName.equals(l.getName())) {
				return l.getTypeClass();
			}
		}
		return Class.forName(typeName);
	}
}
