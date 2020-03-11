/** 
 * All parts of a C source file that may have ISL associated with
 * them extend ISLContainer. For example, ISL may be linked to
 * a specific C function (CMethod.java) or just the source file
 * (CSource.java) in general. Thus, both are ISLContainers.
 *  
 * This class simply defines an uniform way to set and fetch ISL
 * data associated with these objects.
 *  
 * @author lharpf
 */
package fi.hut.ics.lime.limec.sourcecode;

import java.util.LinkedList;
import java.util.List;

import fi.hut.ics.lime.limec.ast.Annotation;

public abstract class ISLContainer {

	private LinkedList<Annotation> associatedAnnotations = 
		new LinkedList<Annotation>();
	
	/** 
	 * Each ISLContainer may be associated with several Annotations.
	 * An Annotation represents an CallSpecification, a ReturnSpecification
	 * or an Observe. They are simply parsed representations of the
	 * raw (unparsed) ISL that is contained in the XML files created by
	 * Doxygen. 
	 * 
	 * @return an array of Annotations associated with this object 
	 */
	public Annotation[] getAssociatedAnnotations() {
		Annotation[] retArr = 
			new Annotation[this.associatedAnnotations.size()];
		return this.associatedAnnotations.toArray(retArr);
	}
	
	/**
	 * Adds all of the Annotations in toAdd to the list of
	 * Annotations associated with this function.
	 * 
	 * @param toAdd the list of Annotations to add
	 */
	public void addAssociatedAnnotations(List<Annotation> toAdd) {
		this.associatedAnnotations.addAll(toAdd);
	}

}
