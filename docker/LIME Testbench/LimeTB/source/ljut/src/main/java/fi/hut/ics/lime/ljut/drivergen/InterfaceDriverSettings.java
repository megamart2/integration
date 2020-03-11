package fi.hut.ics.lime.ljut.drivergen;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import fi.hut.ics.lime.ljut.ConstructorSignature;
import fi.hut.ics.lime.ljut.LCTType;
import fi.hut.ics.lime.ljut.MethodSignature;
import fi.hut.ics.lime.ljut.SignatureParsingException;

/**
 * The driver settings for an {@link InterfaceDriver}.
 * 
 * @author osaariki
 */
public class InterfaceDriverSettings extends DriverSettings {

	private static final String INTERFACE_KEY = "interface";
	private static final String CONSTRUCTOR_KEY = "constructor";
	private static final String METHODS_KEY = "methods";
	private static final String ITERATIONS_KEY = "iterations";
	private static final String METHODS_DELIMITER = ";";
	private static final String METHODS_DELIMITER_REGEX = ";";

	/**
	 * Initializes a new instance.
	 * 
	 * @param interfaceClass
	 *            the interface class.
	 * @param constructor
	 *            the constructor.
	 * @param methods
	 *            the methods to test.
	 * @param iterations
	 *            the number of methods to call in one test pass.
	 */
	public InterfaceDriverSettings(Class<?> interfaceClass, Constructor<?> constructor, List<Method> methods,
			int iterations) {
		this.interfaceClass = interfaceClass;
		this.constructor = constructor;
		this.methods = methods;
		this.iterations = iterations;
	}

	/**
	 * Parses settings for an {@link InterfaceDriver} from the given {@link DriverProperties}.
	 * 
	 * @param properties
	 *            the properties to parse.
	 * @return the parsed settings.
	 * @throws PropertyParsingException
	 *             passthrough from {@link DriverProperties}.
	 * @throws ClassNotFoundException
	 *             if the interface class is not found or the method or constructor signature parsing can not find a
	 *             class.
	 * @throws SignatureParsingException
	 *             passthrough from the signature parsing.
	 * @throws NoSuchMethodException
	 *             passthrough from the signature parsing.
	 */
	public static InterfaceDriverSettings parse(DriverProperties properties) throws PropertyParsingException,
			ClassNotFoundException, SignatureParsingException, NoSuchMethodException {
		if (properties.getDriverType() != DriverType.INTERFACE)
			throw new IllegalArgumentException("DriverProperties must have a driver type of "
					+ DriverType.INTERFACE.getName());

		return parse(properties.getProperty(INTERFACE_KEY), properties.getProperty(CONSTRUCTOR_KEY),
				properties.getProperty(METHODS_KEY), Integer.parseInt(properties.getProperty(ITERATIONS_KEY)));
	}

	/**
	 * Parses settings for an {@link InterfaceDriver}.
	 * 
	 * @param interfaceClassName
	 *            the interface class name.
	 * @param constructorString
	 *            the constructor signature.
	 * @param methodString
	 *            the method signature.
	 * @param iterations
	 *            the number of methods to call in one testing pass.
	 * @return the parsed settings.
	 * @throws ClassNotFoundException
	 *             if the interface class is not found or the method or constructor signature parsing can not find a
	 *             class.
	 * @throws SignatureParsingException
	 *             passthrough from the signature parsing.
	 * @throws NoSuchMethodException
	 *             passthrough from the signature parsing.
	 */
	public static InterfaceDriverSettings parse(String interfaceClassName, String constructorString,
			String methodString, int iterations) throws ClassNotFoundException, SignatureParsingException,
			NoSuchMethodException {
		Class<?> interfaceClass = Class.forName(interfaceClassName);

		ConstructorSignature constructorSignature = ConstructorSignature.parseConstructorDescription(constructorString);
		Constructor<?> constructor = constructorSignature.getConstructor();

		List<Method> methods = new ArrayList<Method>();
		for (String s : methodString.split(METHODS_DELIMITER_REGEX)) {
			MethodSignature methodSignature = MethodSignature.parseMethodDescription(s);
			methods.add(methodSignature.getMethod(constructor.getDeclaringClass()));
		}

		return new InterfaceDriverSettings(interfaceClass, constructor, methods, iterations);
	}

	/**
	 * Parses settings for an {@link InterfaceDriver}. The methods to test will be all the methods callable with
	 * parameters obtainable from LCT, namely those that have parameters of only supported primitive types (listed in
	 * LCTType) or objects with nullary constructors.
	 * 
	 * @param interfaceClassName
	 *            the interface class name.
	 * @param constructorString
	 *            the constructor signature.
	 * @param iterations
	 *            the number of methods to call in one testing pass.
	 * @return the parsed settings.
	 * @throws ClassNotFoundException
	 *             if the interface class is not found or the method or constructor signature parsing can not find a
	 *             class.
	 * @throws SignatureParsingException
	 *             passthrough from the signature parsing.
	 * @throws NoSuchMethodException
	 *             passthrough from the signature parsing.
	 */
	public static InterfaceDriverSettings parse(String interfaceClassName, String constructorString, int iterations)
			throws ClassNotFoundException, SignatureParsingException, NoSuchMethodException {
		Class<?> interfaceClass = Class.forName(interfaceClassName);

		ConstructorSignature constructorSignature = ConstructorSignature.parseConstructorDescription(constructorString);
		Constructor<?> constructor = constructorSignature.getConstructor();

		List<Method> methods = new ArrayList<Method>();
		for (Method method : interfaceClass.getMethods()) {
			if (areParametersSupported(method.getParameterTypes()))
				methods.add(method);
		}
		if (methods.size() == 0)
			throw new IllegalArgumentException("Supplied interface does not contain any LCT supported methods.");

		return new InterfaceDriverSettings(interfaceClass, constructor, methods, iterations);
	}

	private static boolean areParametersSupported(Class<?>[] parameterTypes) {
		IterateParameters: for (Class<?> parameterType : parameterTypes) {
			for (LCTType l : EnumSet.allOf(LCTType.class)) {
				if (l.getTypeClass().equals(parameterType))
					break IterateParameters;
			}
			try {
				parameterType.getConstructor();
				return true;
			} catch (NoSuchMethodException e) {
			}
			return false;
		}
		return true;
	}

	@Override
	public void writeTo(DriverProperties properties) {
		ConstructorSignature constructorSignature = new ConstructorSignature(constructor.getDeclaringClass(),
				constructor.getParameterTypes());

		StringBuilder sb = new StringBuilder();
		boolean first = true;
		for (Method method : methods) {
			MethodSignature methodSignature = new MethodSignature(method.getName(), method.getParameterTypes());
			if (!first)
				sb.append(METHODS_DELIMITER);
			else
				first = false;
			sb.append(methodSignature.toString());
		}

		properties.setProperty(INTERFACE_KEY, interfaceClass.getCanonicalName());
		properties.setProperty(CONSTRUCTOR_KEY, constructorSignature.toString());
		properties.setProperty(METHODS_KEY, sb.toString());
		properties.setProperty(ITERATIONS_KEY, Integer.toString(iterations));
		properties.setDriverType(DriverType.INTERFACE);
	}

	/**
	 * @return the interface class.
	 */
	public Class<?> getInterfaceClass() {
		return interfaceClass;
	}

	/**
	 * @param interfaceClass
	 *            the new interface class.
	 */
	public void setInterfaceClass(Class<?> interfaceClass) {
		this.interfaceClass = interfaceClass;
	}

	/**
	 * @return the constructor.
	 */
	public Constructor<?> getConstructor() {
		return constructor;
	}

	/**
	 * @param constructor
	 *            the new constructor.
	 */
	public void setConstructor(Constructor<?> constructor) {
		this.constructor = constructor;
	}

	/**
	 * @return the methods to test.
	 */
	public List<Method> getMethods() {
		return methods;
	}

	/**
	 * @param methods
	 *            the new methods to test.
	 */
	public void setMethods(List<Method> methods) {
		this.methods = methods;
	}

	/**
	 * @return the number of method calls in one testing pass.
	 */
	public int getIterations() {
		return iterations;
	}

	/**
	 * @param iterations
	 *            the number of method calls in one testing pass.
	 */
	public void setIterations(int iterations) {
		this.iterations = iterations;
	}

	private Class<?> interfaceClass;
	private Constructor<?> constructor;
	private List<Method> methods;
	private int iterations;
}
