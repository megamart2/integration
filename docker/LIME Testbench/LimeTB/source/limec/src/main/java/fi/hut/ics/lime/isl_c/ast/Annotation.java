/**
 * Represents an annotation. An annotation is one 
 * CallSpecification, ReturnSpecification or Observe. One
 * annotation may have multiple fields, which represent
 * regexp, pltl, and nfa specifications.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.ast;

import java.util.LinkedList;
import fi.hut.ics.lime.common.annotation.SpecType;

public class Annotation {

	private AnnotationType type;
	private LinkedList<AnnotationField> annotationFields;
	
	public Annotation(AnnotationType type,
					LinkedList<AnnotationField> annotationFields) {
	
		this.type = type;
		this.annotationFields = annotationFields;
	
	}

	/**
	 * @return the type of this Annotation; CALLSPEC, RETURNSPEC, 
	 * OBSERVE or INSTANCE
	 */
	public AnnotationType getType() {
		return this.type;
	}

	/**
	 * @return the SpecType that corresponds to the AnnotationType
	 * of this Annotation.
	 * 
	 * Basically CALLSPEC = CALL and RETURNSPEC = RETURN, but OBSERVE 
	 * is not a SpecType - it just indicates a method is associated with a 
	 * CallSpecification or an ReturnSpecification.
	 */
	public SpecType getSpecType() {
		
		switch (this.getType()) {
		
			case CALLSPEC:
				return SpecType.CALL;
			
			case RETURNSPEC:
				return SpecType.RETURN;
				
				
			case OBSERVE: default:
				assert false : "No SpecType corresponding to this " +
							   "AnnotationType exists.";
				
		}
	
		return null;
		
	}
	
	/**
	 * @return the annotationFields
	 */
	public AnnotationField[] getAnnotationFields() {
		AnnotationField[] retArr = new AnnotationField[this.annotationFields.size()];
		return this.annotationFields.toArray(retArr);
	}

}
