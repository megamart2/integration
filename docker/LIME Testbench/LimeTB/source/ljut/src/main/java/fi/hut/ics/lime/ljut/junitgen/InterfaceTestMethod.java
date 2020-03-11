package fi.hut.ics.lime.ljut.junitgen;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import fi.hut.ics.lime.ljut.IndentingWriter;
import fi.hut.ics.lime.ljut.drivergen.InterfaceDriver;
import fi.hut.ics.lime.ljut.junitgen.parser.Assignment;
import fi.hut.ics.lime.ljut.junitgen.parser.ObjectParameter;
import fi.hut.ics.lime.ljut.junitgen.parser.Parameter;

/**
 * Implements writing a single JUnit test method corresponding to one set of testing parameters obtained from running an
 * {@link InterfaceDriver}.
 * 
 * @author osaariki
 */
public class InterfaceTestMethod extends TestMethod {

	private static final String TEST_OBJECT_VAR = "obj";
	private static final String INCONCLUSIVE_MESSAGE = "Call specification violated: test inconclusive.";

	/**
	 * Initializes a new instance. The name defaults to the interface class name appended with "Test". Overriding call
	 * specification violation exceptions defaults to false.
	 * 
	 * @param interfaceClass
	 *            the interface class.
	 * @param constructor
	 *            the constructor.
	 * @param constructorParameters
	 *            the constructor's parameters.
	 * @param methodSelections
	 *            the sequence of the methods to call.
	 * @param methods
	 *            the methods to test.
	 * @param methodParameterLists
	 *            the methods' parameters.
	 * @param objects
	 *            the objects used.
	 * @param assignments
	 *            the assignments to fields of the objects used.
	 */
	public InterfaceTestMethod(Class<?> interfaceClass, Constructor<?> constructor,
			List<Parameter> constructorParameters, int[] methodSelections, List<Method> methods,
			List<List<Parameter>> methodParameterLists, List<ObjectParameter> objects, List<Assignment> assignments) {
		super(interfaceClass.getSimpleName() + "Test");
		this.interfaceClass = interfaceClass;
		this.constructor = constructor;
		this.constructorParameters = constructorParameters;
		this.methodSelections = methodSelections;
		this.methods = methods;
		this.methodParameterLists = methodParameterLists;
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
			w.print(interfaceClass.getCanonicalName() + " " + TEST_OBJECT_VAR + " = new " + constructor.getName() + "(");
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

			// Print the method calls
			List<Iterator<Parameter>> methodParameterIterators = new ArrayList<Iterator<Parameter>>();
			for (List<Parameter> methodParameters : methodParameterLists) {
				methodParameterIterators.add(methodParameters.iterator());
			}
			for (int i = 0; i < methodSelections.length; ++i) {
				int selection = methodSelections[i];
				if (0 <= selection && selection < methods.size()) {
					Method method = methods.get(selection);
					Iterator<Parameter> parameterIterator = methodParameterIterators.get(selection);

                                    if (method.getExceptionTypes().length > 0)
                                        w.println("try {");
                                    //   w.indent();

					w.print(TEST_OBJECT_VAR + "." + method.getName() + "(");
					boolean first = true;
					for (int j = 0; j < method.getParameterTypes().length; ++j) {
						if (first)
							first = false;
						else
							w.print(",");
						w.print(parameterIterator.next().getExpression());
					}
					w.println(");");

                                    if (method.getExceptionTypes().length > 0) {
                                        //     w.deindent();
                                        w.println("} catch (Exception e) {");
                                        //   w.indent();
                                        w.println("throw new RuntimeException(e.toString());");
                                        //  w.deindent();
                                        w.println("}");
                                    }
				}
			}

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
	 * @param overrideExceptions
	 *            whether to override exceptions from call specification violations.
	 */
	public void setOverrideExceptions(boolean overrideExceptions) {
		this.overrideExceptions = overrideExceptions;
	}

	private Class<?> interfaceClass;
	private Constructor<?> constructor;
	private List<Parameter> constructorParameters;
	private int[] methodSelections;
	private List<Method> methods;
	private List<List<Parameter>> methodParameterLists;
	private List<Assignment> assignments;
	private Collection<ObjectParameter> objects;
	private boolean overrideExceptions;
}
