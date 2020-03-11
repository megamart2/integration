package fi.hut.ics.lime.ljut.drivergen;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import fi.hut.ics.lime.ljut.ConstructorSignature;
import fi.hut.ics.lime.ljut.MethodSignature;
import fi.hut.ics.lime.ljut.SignatureParsingException;

/**
 * The driver settings for a {@link SimpleDriver}.
 * 
 * @author osaariki
 */
public class SimpleDriverSettings extends DriverSettings {

	private static final String CONSTRUCTOR_KEY = "constructor";
	private static final String METHOD_KEY = "method";

	/**
	 * Initializes a new instance.
	 * 
	 * @param constructor
	 *            the constructor.
	 * @param method
	 *            the method to test.
	 */
	public SimpleDriverSettings(Constructor<?> constructor, Method method) {
		this.constructor = constructor;
		this.method = method;
	}

	/**
	 * Parses settings for a {@link SimpleDriver} from the given {@link DriverProperties}.
	 * 
	 * @param properties
	 *            the properties to parse.
	 * @return the parsed settings.
	 * @throws PropertyParsingException
	 *             passthrough from {@link DriverProperties}.
	 * @throws ClassNotFoundException
	 *             passthrough from the signature parsing.
	 * @throws SignatureParsingException
	 *             passthrough from the signature parsing.
	 * @throws NoSuchMethodException
	 *             passthrough from the signature parsing.
	 */
	public static SimpleDriverSettings parse(DriverProperties properties) throws PropertyParsingException,
			ClassNotFoundException, SignatureParsingException, NoSuchMethodException {
		if (properties.getDriverType() != DriverType.SIMPLE)
			throw new IllegalArgumentException("DriverProperties must have a driver type of "
					+ DriverType.SIMPLE.getName());

		return parse(properties.getProperty(CONSTRUCTOR_KEY), properties.getProperty(METHOD_KEY));
	}

	/**
	 * @param constructorString
	 *            the constructor signature.
	 * @param methodString
	 *            the method signature.
	 * @return the parsed settings.
	 * @throws ClassNotFoundException
	 *             passthrough from the signature parsing.
	 * @throws SignatureParsingException
	 *             passthrough from the signature parsing.
	 * @throws NoSuchMethodException
	 *             passthrough from the signature parsing.
	 */
	public static SimpleDriverSettings parse(String constructorString, String methodString)
			throws ClassNotFoundException, SignatureParsingException, NoSuchMethodException {
		ConstructorSignature constructorSignature = ConstructorSignature.parseConstructorDescription(constructorString);
		Constructor<?> constructor = constructorSignature.getConstructor();

		MethodSignature methodSignature = MethodSignature.parseMethodDescription(methodString);
		Method method = methodSignature.getMethod(constructor.getDeclaringClass());

		return new SimpleDriverSettings(constructor, method);
	}

	@Override
	public void writeTo(DriverProperties properties) {
		ConstructorSignature constructorSignature = new ConstructorSignature(constructor.getDeclaringClass(),
				constructor.getParameterTypes());
		MethodSignature methodSignature = new MethodSignature(method.getName(), method.getParameterTypes());

		properties.setProperty(CONSTRUCTOR_KEY, constructorSignature.toString());
		properties.setProperty(METHOD_KEY, methodSignature.toString());
		properties.setDriverType(DriverType.SIMPLE);
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
	 * @return the method to test.
	 */
	public Method getMethod() {
		return method;
	}

	/**
	 * @param method
	 *            the new method to test.
	 */
	public void setMethod(Method method) {
		this.method = method;
	}

	private Constructor<?> constructor;
	private Method method;
}
