package fi.hut.ics.lime.common.aspect.components;

/**
 * Container for generated aspect code (AspectJ on the Java side,
 * AspeCt-oriented C on the C side) for advice and method bodies.
 * @author jalampin
 */
public class CodeFragment {
	
	// TODO: is this class really necessary at all?
	// all it does is renaming some methods of StringBuilder
	
	private StringBuilder code;
	
	public CodeFragment() {
		code = new StringBuilder();
	}
	
	/**
	 * Add code to the end of the existing code.
	 * @param code the code to add
	 */
	public void addEnd(String code) {
		this.code.append(code);
	}
	
	/**
	 * Add code to the beginning of the existing code.
	 * @param code the code to add
	 */
	public void addBegin(String code) {
		this.code.insert(0, code);
	}
	
	/**
	 * Check whether no code has ever been added to this fragment.
	 */
	public boolean isEmpty() {
		return (code.length() == 0);
	}
	
	/**
	 * Return the bulk of code in this fragment.
	 */
	@Override
	public String toString() {
		return code.toString();
	}
}
