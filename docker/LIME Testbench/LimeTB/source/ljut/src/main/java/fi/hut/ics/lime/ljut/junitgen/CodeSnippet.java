package fi.hut.ics.lime.ljut.junitgen;

import fi.hut.ics.lime.ljut.IndentingWriter;

/**
 * Interface for all code elements that are written in {@link TestClass}.
 * 
 * @author osaariki
 */
public interface CodeSnippet {

	/**
	 * Writes out this snippet.
	 * 
	 * @param w
	 *            the {@link IndentingWriter} to use.
	 */
	public void writeTo(IndentingWriter w);
}
