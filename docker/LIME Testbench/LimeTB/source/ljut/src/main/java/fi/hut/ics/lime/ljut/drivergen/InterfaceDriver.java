package fi.hut.ics.lime.ljut.drivergen;

import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.EnumSet;
import java.util.List;

import fi.hut.ics.lime.ljut.IndentingWriter;
import fi.hut.ics.lime.ljut.LCTType;

/**
 * This class implements the writing of a wrapper class for testing classes implementing an interface by sequentially
 * calling methods from the interface a number of times in an order decided by the LCT.
 * 
 * @author osaariki
 */
public class InterfaceDriver extends Driver {

	private static final String TEST_OBJECT_VAR = "obj";
	private static final String CONSTRUCTOR_PARAM_PREFIX = "consParam";
	private static final String METHOD_PARAM_PREFIX = "methodParam";
	private static final String INCONCLUSIVE_MESSAGE = "Call specification violated, test inconclusive, skipping test values.";

	/**
	 * Initializes a new instance.
	 * 
	 * @param driverPackageName
	 *            the name of the driver's package.
	 * @param driverClassName
	 *            the name for the driver class.
	 * @param interfaceClass
	 *            the interface class.
	 * @param constructor
	 *            the constructor.
	 * @param methods
	 *            the methods to test.
	 * @param iterations
	 *            the number of times the methods should be called in one test pass.
	 * @param overrideExceptions
	 *            whether to override call specification violation exceptions.
	 */
	public InterfaceDriver(String driverPackageName, String driverClassName, Class<?> interfaceClass,
			Constructor<?> constructor, List<Method> methods, int iterations, boolean overrideExceptions) {
		if (!interfaceClass.isAssignableFrom(constructor.getDeclaringClass()))
			throw new IllegalArgumentException(
					"The declaring class of the given constructor must be assignable to the given interface class.");

		this.driverPackageName = driverPackageName;
		this.driverClassName = driverClassName;
		this.interfaceClass = interfaceClass;
		this.constructor = constructor;
		this.methods = methods;
		this.iterations = iterations;
		this.overrideExceptions = overrideExceptions;
	}

	@Override
	public DriverSettings getDriverSettings() {
		return new InterfaceDriverSettings(interfaceClass, constructor, methods, iterations);
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
			if (overrideExceptions)
				w.println("private class InconclusiveException extends RuntimeException {}");
			w.println("private static final int ITERATIONS = " + iterations + ";");
			w.println("public static void main(String[] args) {");
			w.indent();
			{
				if (overrideExceptions) {
					w.println("try {");
					w.indent();
				}

				writeConstructorCall(w);

				if (overrideExceptions)
					w.println("fi.hut.ics.lime.aspectmonitor.ExceptionOverride.setCallException(" + TEST_OBJECT_VAR
							+ ", InconclusiveException.class);");

				w.println("int i = 0;");
				w.println("while (i < ITERATIONS) {");
				w.indent();
				{
					w.println("++i;");
					w.println("int methodNumber = LCT.getInteger(0, " + (methods.size() - 1) + ");");
					w.println("switch (methodNumber) {");
					w.indent();
					{
						writeMethodCalls(w);
					}
					w.deindent();
					w.println("}");
				}
				w.deindent();
				w.println("}");

				if (overrideExceptions) {
					w.deindent();
					w.println("} catch (InconclusiveException e) {");
					w.indent();
					{
						// TODO: consider removing this printout
						w.println("System.out.println(\"" + INCONCLUSIVE_MESSAGE + "\");");
						w.println("LCT.dropTest();");
					}
					w.deindent();
					w.println("}");
				}
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

		w.print(interfaceClass.getCanonicalName() + " " + TEST_OBJECT_VAR + " = new " + constructor.getName() + "(");
		if (paramTypes.length > 1)
			for (int i = 0; i < paramTypes.length - 1; ++i) {
				w.print(CONSTRUCTOR_PARAM_PREFIX + i + ",");
			}
		if (paramTypes.length > 0)
			w.print(CONSTRUCTOR_PARAM_PREFIX + (paramTypes.length - 1));
		w.println(");");
	}

	private void writeMethodCalls(IndentingWriter w) {
		for (int i = 0; i < methods.size(); ++i) {
			w.println("case " + i + ": {");
			w.indent();
			{
				writeMethodCall(w, methods.get(i));
				w.println("break;");
			}
			w.deindent();
			w.println("}");
		}
	}

	private void writeMethodCall(IndentingWriter w, Method method) {
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

            if (method.getExceptionTypes().length > 0) {
                w.println("try {");
                w.indent();
            }

		w.print(TEST_OBJECT_VAR + "." + method.getName() + "(");
		if (paramTypes.length > 1)
			for (int i = 0; i < paramTypes.length - 1; ++i) {
				w.print(METHOD_PARAM_PREFIX + i + ",");
			}
		if (paramTypes.length > 0)
			w.print(METHOD_PARAM_PREFIX + (paramTypes.length - 1));
		w.println(");");

            if (method.getExceptionTypes().length > 0) {
                w.deindent();
                w.println("}");
                w.println("catch (Exception e) {");
                w.indent();
                w.println("throw new RuntimeException(e.toString());");
                w.deindent();
                w.println("}");
            }

	}

	private String driverPackageName;
	private String driverClassName;
	private Class<?> interfaceClass;
	private Constructor<?> constructor;
	private List<Method> methods;
	private int iterations;
	private boolean overrideExceptions;
}
