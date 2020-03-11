package fi.hut.ics.lime.ljut.junitgen;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import fi.hut.ics.lime.ljut.IndentingWriter;
import fi.hut.ics.lime.ljut.drivergen.SimpleDriver;
import fi.hut.ics.lime.ljut.junitgen.parser.Assignment;
import fi.hut.ics.lime.ljut.junitgen.parser.ObjectParameter;
import fi.hut.ics.lime.ljut.junitgen.parser.Parameter;

/**
 * Implements writing a single JUnit test method corresponding to the testing parameters obtained from running a
 * {@link SimpleDriver}.
 * 
 * @author osaariki
 * 
 */
public class SimpleTestMethod extends TestMethod {

	private static final String TEST_OBJECT_VAR = "obj";
	private static final String INCONCLUSIVE_MESSAGE = "Call specification violated: test inconclusive.";

	/**
	 * Initializes a new instance. The name defaults to the class name and method name separated by a dollar sign and
	 * appended with "Test". Overriding exceptions from call specification violations defaults to false.
	 * 
	 * @param constructor
	 *            the constructor.
	 * @param constructorParameters
	 *            the constructor's parameters.
	 * @param method
	 *            the method to test.
	 * @param methodParameters
	 *            the method's parameters.
	 * @param objects
	 *            the objects used.
	 * @param assignments
	 *            the assignments to fields of the objects used.
	 */
	public SimpleTestMethod(Constructor<?> constructor, List<Parameter> constructorParameters, Method method,
			List<Parameter> methodParameters, List<ObjectParameter> objects, List<Assignment> assignments) {
		super(method.getDeclaringClass().getSimpleName() + "$" + method.getName() + "Test");
		this.constructor = constructor;
		this.constructorParameters = constructorParameters;
		this.method = method;
		this.methodParameters = methodParameters;
		this.objects = objects;
		this.assignments = assignments;
		this.overrideExceptions = false;
	}

	@Override
	public Set<CodeSnippet> requiredSnippets() {
		if (assignments.size() != 0)
			if (overrideExceptions) {
				Set<CodeSnippet> snippets = new HashSet<CodeSnippet>();
				snippets.add(CommonSnippets.SET_FIELD_METHOD);
				snippets.add(CommonSnippets.INCONCLUSIVE_EXCEPTION);
				return snippets;
			} else
				return Collections.singleton(CommonSnippets.SET_FIELD_METHOD);
		else if (overrideExceptions)
			return Collections.singleton(CommonSnippets.INCONCLUSIVE_EXCEPTION);
		else
			return Collections.emptySet();
	}

	@Override
	public void writeTo(IndentingWriter w) {
		w.println("@Test public void " + getName() + "() {");
		w.indent();
		{
			if (overrideExceptions) {
				w.println("try {");
				w.indent();
			}

			// Print the object construction statements needed
			for (ObjectParameter or : objects) {
				w.println(or.getConstructionStatement());
			}

			// Print the field assignments for those objects
			for (Assignment a : assignments) {
				w.println(a.getStatement());
			}

			// Print the test class constructor call
			w.print(constructor.getDeclaringClass().getCanonicalName() + " " + TEST_OBJECT_VAR + " = new "
					+ constructor.getName() + "(");
			if (constructorParameters.size() > 1)
				for (int i = 0; i < constructorParameters.size() - 1; ++i) {
					w.print(constructorParameters.get(i).getExpression() + ", ");
				}
			if (constructorParameters.size() > 0)
				w.print(constructorParameters.get(constructorParameters.size() - 1).getExpression());
			w.println(");");

			if (overrideExceptions)
				w.println("fi.hut.ics.lime.aspectmonitor.ExceptionOverride.setCallException(" + TEST_OBJECT_VAR
						+ ", InconclusiveException.class);");

			// Print the method call
			w.print(TEST_OBJECT_VAR + "." + method.getName() + "(");
			if (methodParameters.size() > 1)
				for (int i = 0; i < methodParameters.size() - 1; ++i) {
					w.print(methodParameters.get(i).getExpression() + ", ");
				}
			if (methodParameters.size() > 0)
				w.print(methodParameters.get(methodParameters.size() - 1).getExpression());
			w.println(");");

			if (overrideExceptions) {
				w.deindent();
				w.println("} catch (InconclusiveException e) {");
				w.indent();
				{
					w.println("System.out.println(\"" + INCONCLUSIVE_MESSAGE + "\");");
				}
				w.deindent();
				w.println("}");
			}
		}
		w.deindent();
		w.println("}");
	}

	/**
	 * @return whether to override exceptions from call specification violations.
	 */
	public boolean isOverrideExceptions() {
		return overrideExceptions;
	}

	/**
	 * @param overrideExceptions whether to override exceptions from call specification violations.
	 */
	public void setOverrideExceptions(boolean overrideExceptions) {
		this.overrideExceptions = overrideExceptions;
	}

	private Constructor<?> constructor;
	private List<Parameter> constructorParameters;
	private Method method;
	private List<Parameter> methodParameters;
	private List<Assignment> assignments;
	private Collection<ObjectParameter> objects;
	private boolean overrideExceptions;
}
