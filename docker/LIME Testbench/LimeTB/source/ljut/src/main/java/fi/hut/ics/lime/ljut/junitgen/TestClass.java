package fi.hut.ics.lime.ljut.junitgen;

import java.io.Writer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import fi.hut.ics.lime.ljut.IndentingWriter;

/**
 * This class writes a JUnit test case and the {@link TestMethod} instances that go inside it.
 * 
 * @author osaariki
 */
public class TestClass {

	/**
	 * Initializes a new instance.
	 * 
	 * @param className
	 *            the test class's name.
	 * @param packageName
	 *            the test class's package name.
	 */
	public TestClass(String className, String packageName) {
		this.className = className;
		this.packageName = packageName;
		this.methods = new ArrayList<TestMethod>();
		this.snippets = new ArrayList<CodeSnippet>();
		this.imports = new ArrayList<String>();
	}

	/**
	 * @param method
	 *            the test method to add.
	 */
	public void addTestMethod(TestMethod method) {
		methods.add(method);
	}

	/**
	 * @param snippet
	 *            the snippet to add.
	 */
	public void addSnippet(CodeSnippet snippet) {
		snippets.add(snippet);
	}

	/**
	 * @param className
	 *            the name of the class to add an import for.
	 */
	public void addImport(String className) {
		imports.add(className);
	}

	/**
	 * Writes this test class out.
	 * 
	 * @param out
	 *            the {@link Writer} to use.
	 */
	public void writeTo(Writer out) {
		IndentingWriter w = new IndentingWriter(out, true);

		Set<CodeSnippet> requiredSnippets = new HashSet<CodeSnippet>();
		for (TestMethod method : methods)
			requiredSnippets.addAll(method.requiredSnippets());

		if (packageName != null)
			w.println("package " + packageName + ";");
		for (String className : imports)
			w.println("import " + className + ";");
		w.println("import org.junit.*;");
		w.println("public class " + className + " {");
		w.indent();
		{
			for (CodeSnippet snippet : requiredSnippets)
				snippet.writeTo(w);

			for (CodeSnippet snippet : snippets)
				snippet.writeTo(w);

			for (TestMethod method : methods)
				method.writeTo(w);
		}
		w.deindent();
		w.println("}");
	}

	private String className;
	private String packageName;
	private List<TestMethod> methods;
	private List<CodeSnippet> snippets;
	private List<String> imports;
}
