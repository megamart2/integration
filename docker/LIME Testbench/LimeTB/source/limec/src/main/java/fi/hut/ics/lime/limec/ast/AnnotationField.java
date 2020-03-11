/**
 * Represents a single CheckerField (regexpChecker, pltlChecker and so on)
 * associated with a CheckerAnnotation.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.ast;

import java.util.LinkedList;

public class AnnotationField {

	private final AnnotationFieldName fieldName;
	private final LinkedList<String> fieldContents;
	
	public AnnotationField(String fieldName, LinkedList<String>
						fieldContents) {
		
		/* Let's make sure that the fieldName string is a valid name for a
		 * AnnotationField */
		this.fieldName = AnnotationFieldName.toAnnotationFieldName(fieldName);
		
		assert (this.fieldName != null) : "Encountered a AnnotationFieldName " +
										  "that could not be recognized.";
		
		this.fieldContents = fieldContents;
		
	}

	/** 
	 * @return a AnnotationFieldName enum representing the name of the ISL field: 
	 * REGEXP, PLTL, NFA, etc.
	 */
	public AnnotationFieldName getFieldName() {
		return this.fieldName;
	}

	/**	
	 * @return the contents of the ISL field
	 */
	public String[] getFieldContents() {
		String[] retArr = new String[this.fieldContents.size()];
		return this.fieldContents.toArray(retArr);
	}
	
}
