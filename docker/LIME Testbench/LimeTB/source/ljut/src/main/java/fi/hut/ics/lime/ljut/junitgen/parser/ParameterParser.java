package fi.hut.ics.lime.ljut.junitgen.parser;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import fi.hut.ics.lime.ljut.Debug;
import fi.hut.ics.lime.ljut.junitgen.InterfaceTestMethod;
import fi.hut.ics.lime.ljut.junitgen.SimpleTestMethod;
import fi.hut.ics.lime.ljut.junitgen.TestMethod;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.AssignmentToken;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.ObjectToken;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.Token;
import fi.hut.ics.lime.ljut.junitgen.tokenizer.ValueToken;

/**
 * Implements the parsing of tokenized testing parameters directly into {@link TestMethod} instances. Thus this class is
 * also a factory for classes extending {@link TestMethod}.
 * 
 * @author osaariki
 */
public class ParameterParser {

	private static final String NULL_OBJECT = "o0";

	private ParameterParser() {
	}

	/**
	 * Parses a list of tokens into a new {@link InterfaceTestMethod} instance.
	 * 
	 * @param interfaceClass
	 *            the interface.
	 * @param constructor
	 *            the constructor.
	 * @param methods
	 *            a list of methods to test. The order has to be the same with which the LCT test driver was run.
	 * @param iterations
	 *            the number of times the methods were called.
	 * @param tokens
	 *            the tokenized parameter string.
	 * @return a new {@link InterfaceTestMethod} instance from the parsed tokens.
	 * @throws ParameterParsingException
	 *             when various parsing exceptions occur. The message is generally meaningful.
	 */
	public static InterfaceTestMethod parseAsInterfaceTestMethod(Class<?> interfaceClass, Constructor<?> constructor,
			List<Method> methods, int iterations, List<Token> tokens) throws ParameterParsingException {
		List<ObjectParameter> objects = new ArrayList<ObjectParameter>();
		List<Assignment> assignments = new ArrayList<Assignment>();
		Map<String, ObjectParameter> objectMap = new HashMap<String, ObjectParameter>();

		// This one iterator instance is used in the rest of the method to keep track of the position of the parsing
		Iterator<Token> tokenIterator = tokens.iterator();

		Debug.printDetail("Parsing constructor parameters...");

		// Parse the tokens needed for the constructor call
		Class<?>[] constructorParameterTypes = constructor.getParameterTypes();
		List<Parameter> constructorParameters = parseTokensForTypes(constructorParameterTypes, tokenIterator,
				objectMap, objects, assignments);

		Debug.printDetail("Parsing parameters for method calls...");

		int[] methodSelections = new int[iterations];
		List<List<Parameter>> methodParameterLists = new ArrayList<List<Parameter>>();
		for (int i = 0; i < methods.size(); ++i) {
			methodParameterLists.add(new ArrayList<Parameter>());
		}
                for (int i = 0; i < methodSelections.length && tokenIterator.hasNext(); ++i) { //fix for generating correct number of method calls --Kari
			// Parse one token to determine which method was called
			int selection = parseOneAsInt(tokenIterator, objectMap, objects, assignments);
			methodSelections[i] = selection;

			// Parse the value tokens that belong to the selected method's call
			if (0 <= selection && selection < methods.size()) {
				Debug.printDetail("Method number " + selection + " selected. Parsing parameters...");
				Method method = methods.get(selection);
				List<Parameter> methodParameters = parseTokensForTypes(method.getParameterTypes(), tokenIterator,
						objectMap, objects, assignments);
				methodParameterLists.get(selection).addAll(methodParameters);
			} else {
				Debug.printDetail("Method index out of bounds, skipping.");
			}
		}

		Debug.printDetail("Parsing remaining tokens...");

		// Parse the rest of the tokens. Only assignment tokens if any should be left at this point.
		parseRest(tokenIterator, objectMap, objects, assignments);

		InterfaceTestMethod testMethod = new InterfaceTestMethod(interfaceClass, constructor, constructorParameters,
				methodSelections, methods, methodParameterLists, objects, assignments);
		return testMethod;
	}

	/**
	 * Parses a list of tokens into a new {@link SimpleTestMethod} instance.
	 * 
	 * @param constructor
	 *            the constructor.
	 * @param method
	 *            the method to test.
	 * @param tokens
	 *            the tokenized parameter string.
	 * @return a new {@link SimpleTestMethod} instance from the parsed tokens.
	 * @throws ParameterParsingException
	 *             when various parsing exceptions occur. The message is generally meaningful.
	 */
	public static SimpleTestMethod parseAsSimpleTestMethod(Constructor<?> constructor, Method method, List<Token> tokens)
			throws ParameterParsingException {
		List<ObjectParameter> objects = new ArrayList<ObjectParameter>();
		List<Assignment> assignments = new ArrayList<Assignment>();
		Map<String, ObjectParameter> objectMap = new HashMap<String, ObjectParameter>();

		// This one iterator instance is used in the rest of the method to keep track of the position of the parsing
		Iterator<Token> tokenIterator = tokens.iterator();

		Debug.printDetail("Parsing constructor parameters...");

		// Parse the tokens for the constructor call
		Class<?>[] constructorParameterTypes = constructor.getParameterTypes();
		List<Parameter> constructorParameters = parseTokensForTypes(constructorParameterTypes, tokenIterator,
				objectMap, objects, assignments);

		Debug.printDetail("Parsing method parameters...");

		// Parse the tokens for the method call
		Class<?>[] methodParameterTypes = method.getParameterTypes();
		List<Parameter> methodParameters = parseTokensForTypes(methodParameterTypes, tokenIterator, objectMap, objects,
				assignments);

		Debug.printDetail("Parsing remaining tokens...");

		// Parse the rest of the tokens. Only assignment tokens if any should be left at this point.
		parseRest(tokenIterator, objectMap, objects, assignments);

		SimpleTestMethod testMethod = new SimpleTestMethod(constructor, constructorParameters, method,
				methodParameters, objects, assignments);
		return testMethod;
	}

	private static void parseRest(Iterator<Token> tokenIterator, Map<String, ObjectParameter> objectMap,
			List<ObjectParameter> objects, List<Assignment> assignments) throws ParameterParsingException {
		while (tokenIterator.hasNext()) {

			Token token = tokenIterator.next();

			if (token instanceof AssignmentToken) {
				assignments.add(parseAssignment(((AssignmentToken) token), objectMap, objects));
			} else if (token instanceof ValueToken)
				throw new ParameterParsingException("Leftover value tokens encountered.");
			else
				throw new ParameterParsingException("Unknown token type encountered.");
		}
	}

	private static List<Parameter> parseTokensForTypes(Class<?>[] parameterTypes, Iterator<Token> tokenIterator,
			Map<String, ObjectParameter> objectMap, List<ObjectParameter> objects, List<Assignment> assignments)
			throws ParameterParsingException {
		List<Parameter> parameters = new ArrayList<Parameter>();
		for (int i = 0; i < parameterTypes.length; ++i) {
			Parameter parameter = parseOneAsType(parameterTypes[i], tokenIterator, objectMap, objects, assignments);
			Debug.printDetail("Parsed value token, expression: " + parameter.getExpression());
			parameters.add(parameter);
		}
		return parameters;
	}

	private static int parseOneAsInt(Iterator<Token> tokenIterator, Map<String, ObjectParameter> objectMap,
			List<ObjectParameter> objects, List<Assignment> assignments) throws ParameterParsingException {
		// Loops because any number of assignment tokens can be encountered before the desired value token
		while (true) {
			if (!tokenIterator.hasNext())
				throw new ParameterParsingException("Ran out of value tokens.");

			Token token = tokenIterator.next();

			if (token instanceof AssignmentToken) {
				assignments.add(parseAssignment(((AssignmentToken) token), objectMap, objects));
			} else if (token instanceof ObjectToken) {
				throw new ParameterParsingException("Token does not match expected type.");
			} else if (token instanceof ValueToken) {
				ValueToken valueToken = (ValueToken) token;
				return Integer.parseInt(valueToken.getData());
			} else
				throw new ParameterParsingException("Unknown token type encountered.");
		}
	}

	private static Parameter parseOneAsType(Class<?> expectedType, Iterator<Token> tokenIterator,
			Map<String, ObjectParameter> objectMap, List<ObjectParameter> objects, List<Assignment> assignments)
			throws ParameterParsingException {
		Debug.printDetail("Expecting next value token to be of type " + expectedType.getCanonicalName());
		// Loops because any number of assignment tokens can be encountered before the desired value or object token
		while (true) {
			if (!tokenIterator.hasNext())
				throw new ParameterParsingException("Ran out of value tokens.");

			Token token = tokenIterator.next();

			if (token instanceof AssignmentToken) {
				assignments.add(parseAssignment(((AssignmentToken) token), objectMap, objects));
			} else if (token instanceof ObjectToken) {
				ObjectToken objectToken = (ObjectToken) token;

				if (objectToken.getRight().equals(NULL_OBJECT))
					return new NullParameter();

				ObjectParameter obj = null;
				// Check for a duplicate variable name
				if (!objectMap.containsKey(objectToken.getLeft())) {
					// Check whether this is a new object
					if (!objectMap.containsKey(objectToken.getRight())) {
						// A new object token must have the same variable name on the right and left hand sides
						if (!objectToken.getLeft().equals(objectToken.getRight()))
							throw new ParameterParsingException("Non-existent object reference encountered.");
						obj = new NewObject(expectedType, objectToken.getLeft());
					} else {
						ObjectParameter referenced = objectMap.get(objectToken.getRight());
						obj = new ReferenceObject(expectedType, objectToken.getLeft(), referenced);
					}
				} else
					throw new ParameterParsingException("Duplicate object reference encountered.");
				objectMap.put(obj.getVariableName(), obj);
				objects.add(obj);
				return obj;
			} else if (token instanceof ValueToken) {
				ValueToken valueToken = (ValueToken) token;
				// For a value token the expected type must be one of the LCT supported primitive types
				if (expectedType.equals(int.class)) {
					return new Primitive(Integer.parseInt(valueToken.getData()));
				} else if (expectedType.equals(byte.class)) {
					return new Primitive(Byte.parseByte(valueToken.getData()));
				} else if (expectedType.equals(short.class)) {
					return new Primitive(Short.parseShort(valueToken.getData()));
				} else if (expectedType.equals(long.class)) {
					return new Primitive(Long.parseLong(valueToken.getData()));
				} else if (expectedType.equals(boolean.class)) {
					return new Primitive(Boolean.parseBoolean(valueToken.getData()));
				} else
					throw new ParameterParsingException("Token does not match expected type.");
			} else
				throw new ParameterParsingException("Unknown token type encountered.");
		}
	}

	private static Assignment parseAssignment(AssignmentToken token, Map<String, ObjectParameter> objectMap,
			List<ObjectParameter> objects) throws ParameterParsingException {
		ObjectParameter or = objectMap.get(token.getLeft());
		if (or == null)
			throw new ParameterParsingException("Missing object reference.");

		Field f = getAnyField(or.getType(), token.getField());

		Parameter value = null;
		if (f.getType().isPrimitive()) {
			if (f.getType().equals(int.class)) {
				value = new Primitive(Integer.parseInt(token.getRight()));
			} else if (f.getType().equals(byte.class)) {
				value = new Primitive(Byte.parseByte(token.getRight()));
			} else if (f.getType().equals(short.class)) {
				value = new Primitive(Short.parseShort(token.getRight()));
			} else if (f.getType().equals(long.class)) {
				value = new Primitive(Long.parseLong(token.getRight()));
			} else if (f.getType().equals(boolean.class)) {
				value = new Primitive(Boolean.parseBoolean(token.getRight()));
			} else {
				throw new ParameterParsingException("Unexpected token type.");
			}
		} else {
			if (token.getRight().equals(NULL_OBJECT)) {
				value = new NullParameter();
			} else {
				ObjectParameter rightOr = objectMap.get(token.getRight());
				if (rightOr == null) {
					rightOr = new NewObject(f.getType(), token.getRight());
					objectMap.put(rightOr.getVariableName(), rightOr);
					objects.add(rightOr);
				}
				value = rightOr;
			}
		}

		Debug.printDetail("Parsed assignment: " + or.getVariableName() + "." + f.getName() + " = "
				+ value.getExpression());

		return new Assignment(or, f, value);
	}

	/*
	 * Inaccessible field are not listed by Field.getFields(), so this method moves up the class hierarchy and gets the
	 * fields with Field.getDeclaredFields(), which in turn does return all fields. The first field with a matching name
	 * is returned, so this is also the one that would shadow other fields higher in the class hierarchy.
	 */
	private static Field getAnyField(Class<?> declaringClass, String fieldName) throws ParameterParsingException {
		Class<?> currentClass = declaringClass;
		do {
			Field[] fields = currentClass.getDeclaredFields();
			for (Field f : fields) {
				if (f.getName().equals(fieldName))
					return f;
			}
		} while ((currentClass = currentClass.getSuperclass()) != null);

		throw new ParameterParsingException("Missing field encountered: " + declaringClass.getCanonicalName() + "."
				+ fieldName);
	}
}
