package fi.hut.ics.lime.ljut;

import java.io.PrintWriter;
import java.io.Writer;

/**
 * Extends {@link PrintWriter} to provide indentation support for simple pretty printing of code. The default
 * indentation style is to use tabs.
 * 
 * @author osaariki
 */
public class IndentingWriter extends PrintWriter {

	private static final String DEFAULT_INDENTATION_STYLE = "\t";

	/**
	 * Wraps an existing {@link Writer} as an {@link IndentingWriter} with indentation at 0 and the specified auto
	 * flushing.
	 * 
	 * @param out
	 *            the {@link Writer} to wrap.
	 * @param autoFlush
	 */
	public IndentingWriter(Writer out, boolean autoFlush) {
		super(out, autoFlush);
		indentation = 0;
		tabs = "";
		newLine = true;
		tabString = DEFAULT_INDENTATION_STYLE;
	}

	/**
	 * Wraps an existing {@link Writer} as an {@link IndentingWriter} with indentation at 0 and auto flushing set to
	 * <code>false</code>.
	 * 
	 * @param out
	 *            the {@link Writer} to wrap.
	 */
	public IndentingWriter(Writer out) {
		this(out, false);
	}

	/**
	 * Moves the indentation one to the right.
	 */
	public void indent() {
		++indentation;
		updateTabs();
	}

	/**
	 * Moves the indentation one to the left. May not be called when indentation is already at 0.
	 */
	public void deindent() {
		if (indentation == 0)
			throw new IllegalStateException("Cannot deindent: intendation already at 0.");
		--indentation;
		updateTabs();
	}

	/**
	 * @param indentation
	 *            the new indentation position.
	 */
	public void setIndentation(int indentation) {
		if (indentation < 0)
			throw new IllegalArgumentException("Indentation must be greater than or equal to zero.");
		this.indentation = indentation;
		updateTabs();
	}

	private void updateTabs() {
		StringBuilder sb = new StringBuilder("");
		for (int i = 0; i < indentation; ++i)
			sb.append(tabString);
		tabs = sb.toString();
	}

	/**
	 * @return the current indentation position.
	 */
	public int getIndentation() {
		return indentation;
	}

	/**
	 * @param style
	 *            the new indentation style.
	 */
	public void setIndentationStyle(String style) {
		this.tabString = style;
	}

	/**
	 * @return the current indentation style.
	 */
	public String getIndentationStyle() {
		return tabString;
	}

	@Override
	public void println() {
		super.println();
		newLine = true;
	}

	@Override
	public void write(String s) {
		if (newLine) {
			super.write(tabs);
			newLine = false;
		}
		super.write(s);
	}

	private boolean newLine;
	private int indentation;
	private String tabs;
	private String tabString;
}
