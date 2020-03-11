package fi.hut.ics.lime.ljut.junitgen;

import java.util.Collections;
import java.util.Set;

/**
 * Abstract base class for all types of test methods.
 * 
 * @author osaariki
 */
public abstract class TestMethod implements CodeSnippet {

	/**
	 * Initializes a new instance.
	 * 
	 * @param name
	 *            the name for this method.
	 */
	public TestMethod(String name) {
		this.name = name;
	}

	/**
	 * @return the name of this method.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the new name for this method.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Returns a {@link Set} containing all the {@link CodeSnippet} this test method requires in the same
	 * {@link TestClass}. All test methods added to a TestClass should return the same instances of required snippets,
	 * lest the snippets be written multiple times into the class resulting in duplicate elements.
	 * 
	 * @return the set of required snippets.
	 */
	public Set<CodeSnippet> requiredSnippets() {
		return Collections.emptySet();
	}

	private String name;
}
