package fi.hut.ics.lime.common.aspect;

/**
 * @author sliedes
 * Indent source code to the given indentation.
 */
public class Indent {
	private final String str;
	private static final int INDENT_LEVEL = 4; 
	
	static private String spaces(int n) {
		String s = "";
		for (int i=0; i<n*INDENT_LEVEL; i++)
			s += " ";
		return s;
	}
	
	public Indent(String str, int levels) {
		String sp = spaces(levels);
		this.str = str.trim().replace("\n", "\n"+sp);		
	}

	public Indent(String str) {
		String sp = spaces(1);
		this.str = str.trim().replace("\n", "\n"+sp);		
	}
	
	@Override
	public String toString() {
		return str;
	}
}
