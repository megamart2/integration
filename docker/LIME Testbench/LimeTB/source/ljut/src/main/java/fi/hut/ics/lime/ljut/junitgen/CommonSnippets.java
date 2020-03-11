package fi.hut.ics.lime.ljut.junitgen;

import fi.hut.ics.lime.ljut.IndentingWriter;

/**
 * A collection of common CodeSnippets.
 * 
 * @author osaariki
 */
public class CommonSnippets {

	/**
	 * An InconclusiveException that extends RuntimeException {}
	 */
	public static final CodeSnippet INCONCLUSIVE_EXCEPTION = new CodeSnippet() {

		@Override
		public void writeTo(IndentingWriter w) {
			w.println("private class InconclusiveException extends RuntimeException {}");
		}
	};

	/**
	 * A setField for setting values of private fields.
	 */
	public static final CodeSnippet SET_FIELD_METHOD = new CodeSnippet() {

		@Override
		public void writeTo(IndentingWriter w) {
			w.println("private static void setField(Object object, String fieldName, Object value) throws NoSuchFieldException {");
			w.indent();
			{
				w.println("Class<?> currentClass = object.getClass();");
				w.println("boolean found = false;");
				w.println("Search: do {");
				w.indent();
				{
					w.println("java.lang.reflect.Field[] fields = currentClass.getDeclaredFields();");
					w.println("for (java.lang.reflect.Field f : fields) {");
					w.indent();
					{
						w.println("if (f.getName().equals(fieldName)) {");
						w.indent();
						{
							w.println("boolean wasAccessible = f.isAccessible();");
							w.println("f.setAccessible(true);");
							w.println("try {");
							w.indent();
							{
								w.println("f.set(object, value);");
								w.println("found = true;");
								w.println("break Search;");
							}
							w.deindent();
							w.println("} catch (IllegalArgumentException e) {");
							w.indent();
							{
								w.println("throw new RuntimeException(e);");
							}
							w.deindent();
							w.println("} catch (IllegalAccessException e) {");
							w.indent();
							{
								w.println("throw new RuntimeException(e);");
							}
							w.deindent();
							w.println("}");
							w.println("f.setAccessible(wasAccessible);");
						}
						w.deindent();
						w.println("}");
					}
					w.deindent();
					w.println("}");
				}
				w.deindent();
				w.println("} while ((currentClass = currentClass.getSuperclass()) != null);");
				w.println("if (!found)");
				w.indent();
				{
					w.println("throw new NoSuchFieldException(object.getClass().getSimpleName() + \".\" + fieldName);");
				}
				w.deindent();
			}
			w.deindent();
			w.println("}");
		}
	};

	private CommonSnippets() {
	}
}
