package fi.hut.ics.lime.ljut;

import java.lang.reflect.Constructor;

/**
 * <p>
 * Contains handling for human readable constructor signatures of the form className(parameters...), where
 * (parameters...) is an optional comma separated list of parameter class names. For example both
 * "com.example.List(int,com.example.List)" and "java.lang.String" are syntactically valid.
 * </p>
 * 
 * <p>
 * This class overrides {@link Object#toString()} for writing out signatures in the format defined above.
 * </p>
 * 
 * @author osaariki
 */
public class ConstructorSignature {

	/**
	 * Parses a string containing one signature and returns a ConstructorSignature instance.
	 * 
	 * @param input
	 *            the input {@link String}.
	 * @return a ConstructorSignature filled with the parsed class and parameter classes.
	 * @throws ClassNotFoundException
	 *             if the class name or one of the parameter class names can not be resolved to a Class instance with a
	 *             call to {@link Class#forName(String)}.
	 * @throws SignatureParsingException
	 *             if the input does not match any known signature pattern.
	 */
	public static ConstructorSignature parseConstructorDescription(String input) throws ClassNotFoundException,
			SignatureParsingException {
		input = input.trim();
		if (SignatureUtils.SIGNATURE_ONLY_NAME.matcher(input).matches()) {
			Class<?> declaringClass = Class.forName(input);
			return new ConstructorSignature(declaringClass, null);
		} else if (SignatureUtils.SIGNATURE_NAME_AND_PARAMETER_TYPES.matcher(input).matches()) {
			String[] inputParts = input.split("[,()]");
			Class<?> declaringClass = Class.forName(inputParts[0]);
			Class<?>[] parameterTypes = new Class<?>[inputParts.length - 1];
			for (int i = 0; i < parameterTypes.length; ++i) {
				parameterTypes[i] = SignatureUtils.parameterTypeForName(inputParts[i + 1].trim());
			}
			return new ConstructorSignature(declaringClass, parameterTypes);
		} else {
			throw new SignatureParsingException("Invalid constructor signature: " + input);
		}
	}

	/**
	 * Initializes a ConstructorSignature with the given class and parameter classes.
	 * 
	 * @param declaringClass
	 *            the class of the constructor.
	 * @param parameterTypes
	 *            the classes of the constructor's parameters. May be <code>null</code>.
	 */
	public ConstructorSignature(Class<?> declaringClass, Class<?>[] parameterTypes) {
		this.declaringClass = declaringClass;
		this.parameterTypes = parameterTypes;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder(declaringClass.getCanonicalName());
		if (parameterTypes != null) {
			sb.append("(");
			if (parameterTypes.length > 0) {
				sb.append(parameterTypes[0].getCanonicalName());
				for (int i = 1; i < parameterTypes.length; ++i) {
					sb.append(", ").append(parameterTypes[i].getCanonicalName());
				}
			}
			sb.append(")");
		}
		return sb.toString();
	}

	/**
	 * <p>
	 * Resolves this signature into a {@link Constructor} instance. If this signatures parameter classes is
	 * <code>null</code> and the class contains only one constructor then that constructor is returned. If multiple
	 * constructors exist an exception is raised.
	 * </p>
	 * 
	 * <p>
	 * If this signatures parameter classes is not <code>null</code> then the corresponding constructor is returned or
	 * an exception is raised if it does not exist.
	 * </p>
	 * 
	 * @return the resolved {@link Constructor}.
	 * @throws NoSuchMethodException
	 *             if the constructor can not be resolved.
	 */
	public Constructor<?> getConstructor() throws NoSuchMethodException {
		if (parameterTypes == null) {
			Constructor<?>[] constructors = declaringClass.getConstructors();

			if (constructors.length > 0) {
				if (constructors.length == 1) {
					return constructors[0];
				} else {
					throw new NoSuchMethodException("Class " + declaringClass.getCanonicalName()
							+ " has multiple constructors. Please specify parameter types.");
				}
			} else {
				throw new NoSuchMethodException("Class " + declaringClass.getCanonicalName()
						+ " has no accessible constructors.");
			}
		} else {
			return declaringClass.getConstructor(parameterTypes);
		}
	}

	/**
	 * @return the declaring class.
	 */
	public Class<?> getDeclaringClass() {
		return declaringClass;
	}

	/**
	 * @param declaringClass
	 *            the new declaring class.
	 */
	public void setDeclaringClass(Class<?> declaringClass) {
		this.declaringClass = declaringClass;
	}

	/**
	 * @return the parameter classes.
	 */
	public Class<?>[] getParameterTypes() {
		return parameterTypes;
	}

	/**
	 * @param parameterTypes
	 *            the new parameter classes.
	 */
	public void setParameterTypes(Class<?>[] parameterTypes) {
		this.parameterTypes = parameterTypes;
	}

	private Class<?> declaringClass;
	private Class<?>[] parameterTypes;
}
