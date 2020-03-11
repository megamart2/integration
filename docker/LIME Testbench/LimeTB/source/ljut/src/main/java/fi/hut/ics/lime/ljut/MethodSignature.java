package fi.hut.ics.lime.ljut;

import java.lang.reflect.Method;
import java.util.ArrayList;

/**
 * <p>
 * Contains handling for human readable method signatures of the form name(parameters...), where (parameters...) is an
 * optional comma separated list of parameter class names. For example both "foo(java.lang.String,int)" and "bar" are
 * syntactically valid.
 * </p>
 * 
 * <p>
 * This class overrides {@link Object#toString()} for writing out signatures in the format defined above.
 * </p>
 * 
 * @author osaariki
 * 
 */
public class MethodSignature {

	/**
	 * Parses a string containing one signature and returns a MethodSignature instance.
	 * 
	 * @param input
	 *            the input {@link String}.
	 * @return a MethodSignature filled with the method name and parameter classes.
	 * @throws ClassNotFoundException
	 *             if one of the parameter class names can not be resolved to a Class instance with a call to
	 *             {@link Class#forName(String)}.
	 * @throws SignatureParsingException
	 *             if the input does not match any known signature pattern.
	 */
	public static MethodSignature parseMethodDescription(String input) throws ClassNotFoundException,
			SignatureParsingException {
		input = input.trim();
		if (SignatureUtils.SIGNATURE_ONLY_NAME.matcher(input).matches()) {
			return new MethodSignature(input, null);
		} else if (SignatureUtils.SIGNATURE_NAME_AND_PARAMETER_TYPES.matcher(input).matches()) {
			String[] inputParts = input.split("[,()]");
			String methodName = inputParts[0];
			Class<?>[] parameterTypes = new Class<?>[inputParts.length - 1];
			for (int i = 0; i < parameterTypes.length; ++i) {
				parameterTypes[i] = SignatureUtils.parameterTypeForName(inputParts[i + 1].trim());
			}
			return new MethodSignature(methodName, parameterTypes);
		} else {
			throw new SignatureParsingException("Invalid method signature: " + input);
		}
	}

	/**
	 * Initializes a MethodSignature with the given name and parameter classes.
	 * 
	 * @param methodName
	 *            the method name.
	 * @param parameterTypes
	 *            the classes of the method's parameters. May be <code>null</code>.
	 */
	public MethodSignature(String methodName, Class<?>[] parameterTypes) {
		this.methodName = methodName;
		this.parameterTypes = parameterTypes;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder(methodName);
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
	 * Resolves this signature into a {@link Method} instance from the given declaring class. If this signatures
	 * parameter classes is <code>null</code> and the declaring class contains only one method with this signatures name
	 * then that method is returned. If multiple methods with the same name are found an exception is raised.
	 * </p>
	 * 
	 * <p>
	 * If this signatures parameter classes is not <code>null</code> then the corresponding method from the given
	 * declaring class is returned or an exception is raised if it is not found.
	 * </p>
	 * 
	 * @param declaringClass
	 *            the class to get the method from.
	 * @return the resolved {@link Method}.
	 * @throws NoSuchMethodException
	 *             if the method can not be resolved.
	 */
	public Method getMethod(Class<?> declaringClass) throws NoSuchMethodException {
		if (parameterTypes == null) {
			Method[] methods = declaringClass.getMethods();
			ArrayList<Method> matchingMethods = new ArrayList<Method>();
			for (Method m : methods)
				if (m.getName().equals(methodName))
					matchingMethods.add(m);

			if (matchingMethods.size() > 0) {
				if (matchingMethods.size() == 1) {
					return matchingMethods.get(0);
				} else {
					throw new NoSuchMethodException("Multiple methods with name " + methodName + " found in class "
							+ declaringClass.getCanonicalName() + ". Please specify parameter types.");
				}
			} else {
				throw new NoSuchMethodException("No method with name " + methodName + " found in class "
						+ declaringClass.getCanonicalName() + ".");
			}
		} else {
			return declaringClass.getMethod(methodName, parameterTypes);
		}
	}

	/**
	 * @return the method name.
	 */
	public String getMethodName() {
		return methodName;
	}

	/**
	 * @param methodName
	 *            the new method name.
	 */
	public void setMethodName(String methodName) {
		this.methodName = methodName;
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

	private String methodName;
	private Class<?>[] parameterTypes;
}
