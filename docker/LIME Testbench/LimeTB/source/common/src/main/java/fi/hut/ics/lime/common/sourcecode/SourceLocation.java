package fi.hut.ics.lime.common.sourcecode;

/**
 * This class contains the location of (something) in the source.
 * It contains the relative path to the source file, the line number and the
 * column number.
 * 
 * @author sliedes
 */
public class SourceLocation {
	private String filename;
	private int line;
	private int column;

	// Possibly use -1 for no column? Implement when need arises.
	public SourceLocation(String filename, int line, int column) {
		this.filename = filename;
		this.line = line;
		this.column = column;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public int getLine() {
		return line;
	}
	
	public int getColumn() {
		return column;
	}
}
