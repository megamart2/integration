package fi.hut.ics.lime.limec.ast;

/**
 * All the legal names for a AnnotationField.
 * 
 * @author lharpf
 */

public enum AnnotationFieldName {

	PLTL("pltl"), REGEXP("regexp"), 
	AUTOMATON("nfa"), CHECKERS("specs"), // TODO: what's this?
	CALLPROPOSITIONS("callPropositions"), VALUEPROPOSITIONS("valuePropositions"),
	INSTANCE("instance");
	
	private String stringName;
	
	private AnnotationFieldName(String nameAsString) {
		this.stringName = nameAsString;
	}
	
	/**
	 * Takes a string of text and searches for a corresponding 
	 * AnnotationFieldName enum. Returns the enum if one is found or null if
	 * no such AnnotationFieldName has been defined.
	 * 
	 * @return AnnotationFieldName if a name corresponding to text exists, null
	 * 		   otherwise
	 */
	public static AnnotationFieldName toAnnotationFieldName(String text) {
		
		if (text == null) { return null; }
		
		for(AnnotationFieldName aFieldName : values()) {
			
			if (aFieldName.stringName.equals(text)) {
				return aFieldName;
			}
			
		}
	
		return null;
	}
	
	@Override
	public String toString() {
		return this.stringName;
	}
	
}
