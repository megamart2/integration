package fi.hut.ics.lime.ljut.drivergen;

import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.EnumSet;

import fi.hut.ics.lime.ljut.IndentingWriter;
import fi.hut.ics.lime.ljut.LCTType;

/**
 * This class implements the writing of a wrapper class for testing a single method in a class.
 * 
 * @author osaariki
 */
public class SimpleDriver extends Driver {

	private static final String TEST_OBJECT_VAR = "testObject";
	private static final String CONSTRUCTOR_PARAM_PREFIX = "consParam";
	private static final String METHOD_PARAM_PREFIX = "methodParam";

	/**
	 * Initializes a new instance.
	 * 
	 * @param driverPackageName
	 *            the name of the driver's package.
	 * @param driverClassName
	 *            the name for the driver class.
	 * @param constructor
	 *            the constructor.
	 * @param method
	 *            the method to test.
	 */
	public SimpleDriver(String driverPackageName, String driverClassName, Constructor<?> constructor, Method method) {
		if (constructor != null && !constructor.getDeclaringClass().equals(method.getDeclaringClass()))
			throw new IllegalArgumentException("Constructor's declaring class does not match method's declaring class.");

		this.driverPackageName = driverPackageName;
		this.driverClassName = driverClassName;
		this.method = method;
		this.constructor = constructor;
	}

	@Override
	public DriverSettings getDriverSettings() {
		return new SimpleDriverSettings(constructor, method);
	}

	@Override
	public void writeTo(Writer out) throws IOException {
		IndentingWriter w = new IndentingWriter(out, true);

		if (driverPackageName != null)
			w.println("package " + driverPackageName + ";");

		w.println("import fi.hut.ics.lime.tester.LCT;");
		w.println("public class " + driverClassName + " {");
		w.indent();
		{

			w.println("public static void main(String[] args) {");
			w.indent();
			{

				writeConstructorCall(w);
				writeMethodCall(w);

			}
			w.deindent();
			w.println("}");

		}
		w.deindent();
		w.println("}");
	}

	private void writeConstructorCall(IndentingWriter w) {
		Class<?>[] paramTypes = constructor.getParameterTypes();
		for (int i = 0; i < paramTypes.length; ++i) {
			String typeName = paramTypes[i].getCanonicalName();
			w.print(typeName + " " + CONSTRUCTOR_PARAM_PREFIX + i + " = ");
			if (paramTypes[i].isPrimitive()) {
				for (LCTType l : EnumSet.allOf(LCTType.class)) {
					if (typeName.equals(l.getName()))
						w.println("LCT." + l.getLctCall() + ";");
				}
			} else {
				w.println("(" + typeName + ") LCT.getObject(\"" + typeName + "\");");
			}
		}

		w.print(constructor.getDeclaringClass().getCanonicalName() + " " + TEST_OBJECT_VAR + " = new "
				+ constructor.getName() + "(");
		if (paramTypes.length > 1)
			for (int i = 0; i < paramTypes.length - 1; ++i) {
				w.print(CONSTRUCTOR_PARAM_PREFIX + i + ",");
			}
		if (paramTypes.length > 0)
			w.print(CONSTRUCTOR_PARAM_PREFIX + (paramTypes.length - 1));
		w.println(");");
	}

	private void writeMethodCall(IndentingWriter w) {
		Class<?>[] paramTypes = method.getParameterTypes();
		for (int i = 0; i < paramTypes.length; ++i) {
			String typeName = paramTypes[i].getCanonicalName();
			w.print(typeName + " " + METHOD_PARAM_PREFIX + i + " = ");
			if (paramTypes[i].isPrimitive()) {
				for (LCTType l : EnumSet.allOf(LCTType.class)) {
					if (typeName.equals(l.getName()))
						w.println("LCT." + l.getLctCall() + ";");
				}
			} else {
				w.println("(" + typeName + ") LCT.getObject(\"" + typeName + "\");");
			}
		}

		w.print(TEST_OBJECT_VAR + "." + method.getName() + "(");
		if (paramTypes.length > 1)
			for (int i = 0; i < paramTypes.length - 1; ++i) {
				w.print(METHOD_PARAM_PREFIX + i + ",");
			}
		if (paramTypes.length > 0)
			w.print(METHOD_PARAM_PREFIX + (paramTypes.length - 1));
		w.println(");");
	}

	private String driverPackageName;
	private String driverClassName;
	private Method method;
	private Constructor<?> constructor;
}
