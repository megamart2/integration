/**
 * Uses PropositionFactory to turn the callProposition and valueProposition
 * ISL propositions into Proposition objects.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.specification.propositions.PropositionException;
import fi.hut.ics.lime.common.specification.propositions.PropositionFactory;
import fi.hut.ics.lime.limec.ast.Annotation;
import fi.hut.ics.lime.limec.ast.AnnotationField;
import fi.hut.ics.lime.limec.ast.AnnotationFieldName;
import fi.hut.ics.lime.limec.sourcecode.CMethod;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.sourcecode.ISLContainer;

public class PropositionGenerator {

	private static PropositionFactory propositionFactory = 
		PropositionFactory.getInstance();	
	
	/**
	 * Creates Propositions from the parsed ISL associated with the C
	 * source file source or any of the functions (CMethods) defined
	 * within that source file. 
	 * 
	 * @param source a C source file to create propositions from
	 */
	public static void createAllPropositions(CSource source) {
		
		createPropositions(source, source);
		for (Method func : source.getAllMethods()) {
			createPropositions((CMethod)func, source);
		}
		
	}
	
	/** 
	 * A helper method for createAllPropositions. 
	 * 
	 * Creates Propositions from the parsed ISL contained in the 
	 * ISLContainer container and associates them with the C source
	 * file defined in sourceFile. 
	 */
	private static void createPropositions(ISLContainer container, Source sourceFile) {		
		
		// Go through all the parsed ISL associated with this ISLContainer and
		// create valuePropositions and callPropositions
		for (Annotation annotation : container.getAssociatedAnnotations()) {
			for (AnnotationField field : annotation.getAnnotationFields()) {
				
				AnnotationFieldName fieldName = field.getFieldName();
				
				if (fieldName != AnnotationFieldName.CALLPROPOSITIONS &&
					fieldName != AnnotationFieldName.VALUEPROPOSITIONS) {
					// We are only interested in callPropositions and
					// valuePropositions
					continue;
				}
				
				for (String checkerContents : field.getFieldContents()) {
				
					// We consider a newline to be just a space; newlines confuse our
					// regexp pattern
					checkerContents = checkerContents.replace('\n', ' '); 

					try {
						
						if (fieldName == AnnotationFieldName.VALUEPROPOSITIONS) {
							propositionFactory.createValuePropositionNode(sourceFile, checkerContents);
						} else if (fieldName == AnnotationFieldName.CALLPROPOSITIONS) {
							propositionFactory.createCallPropositionNode(sourceFile, checkerContents);
						} else {
							assert false : 	"Only callPropositions and valuePropositions " +
											"are acceptable here.";
						}
					} catch (PropositionException e) {
						System.err.println("ERROR: " + e.getMessage());
					}
					
				}
			}
		}
		
	}
	
}
