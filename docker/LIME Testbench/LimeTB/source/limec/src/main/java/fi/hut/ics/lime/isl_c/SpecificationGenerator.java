/**
 * Uses SpecificationFactory to turn regexp, pltl and
 * automaton specs into Specification objects.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.specification.SpecificationException;
import fi.hut.ics.lime.common.specification.SpecificationFactory;
import fi.hut.ics.lime.common.sourcecode.SourceLocation;
import fi.hut.ics.lime.isl_c.ast.Annotation;
import fi.hut.ics.lime.isl_c.ast.AnnotationField;
import fi.hut.ics.lime.isl_c.ast.AnnotationFieldName;
import fi.hut.ics.lime.isl_c.sourcecode.CMethod;
import fi.hut.ics.lime.isl_c.sourcecode.CSource;
import fi.hut.ics.lime.isl_c.sourcecode.ISLContainer;

public class SpecificationGenerator {

	private static SpecificationFactory spf = 
		SpecificationFactory.instance();
	
	/**
	 * Creates regexp, pltl and automaton Specifications from the ISL 
	 * specifications (ReturnSpecifications and CallSpecifications) associated with
	 * the C source file source or any of the functions (CMethods) contained
	 * in it.
	 *   
	 * @param source the C Source file to create specifications from
	 * @throws SpecificationException
	 */
	public static void createAllSpecifications(Source source) 
			throws SpecificationException {
		
		createSpecifications((CSource)source, source); 
		for (Method func : source.getAllMethods()) {
			createSpecifications((CMethod)func, source);
		}
		
	}
	
	/** 
	 * A helper method for createAllSpecifications.
	 * 
	 * Creates Specification objects from the parsed ISL. 
	 */
	private static void createSpecifications(
			ISLContainer container, Source sourceFile) 
			throws SpecificationException {
		
		// Go through all the parsed ISL associated with this ISLContainer
		// and create pltlSpecifications
		for (Annotation annotation : container.getAssociatedAnnotations()) {
			for (AnnotationField field : annotation.getAnnotationFields()) {
				
				AnnotationFieldName fieldName = field.getFieldName();
				
				if (fieldName != AnnotationFieldName.PLTL &&
					fieldName != AnnotationFieldName.REGEXP && 
					fieldName != AnnotationFieldName.AUTOMATON) {
					// We're only interested in PLTL, REGEX
					// and AUTOMATON specifications here
					continue;
				}

				for (String checkerContents : field.getFieldContents()) {
					
					// We consider a newline to be just a space; newlines confuse our
					// regexp pattern
					checkerContents = checkerContents.replace('\n', ' '); 
							
					try {
							
						switch (annotation.getType()) {
							
							case CALLSPEC: 
								
								switch (fieldName) {
								
									case PLTL: 
										spf.createPltlSpecification(annotation.getSpecType(), 
												sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;
										
									case REGEXP:
										spf.createRegExpSpecification(annotation.getSpecType(), 
												sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;
										
									case AUTOMATON:
										spf.createNfaSpecification(annotation.getSpecType(), 
												sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;

									case CHECKERS:
									case CALLPROPOSITIONS:
									case VALUEPROPOSITIONS:
										throw new AssertionError("should not happen");
								
									}
							
								break;
								
								
							case RETURNSPEC:
								
								switch (fieldName) {
									
									case PLTL: 
										spf.createPltlSpecification(annotation.getSpecType(), 
											sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;
									
									case REGEXP:
										spf.createRegExpSpecification(annotation.getSpecType(), 
											sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;
									
									case AUTOMATON:
										spf.createNfaSpecification(annotation.getSpecType(), 
											sourceFile, checkerContents.trim(), null, new SourceLocation("not supported", 0, 0));
										break;
										
									case CHECKERS:
									case CALLPROPOSITIONS:
									case VALUEPROPOSITIONS:
										throw new AssertionError("should not happen");
								
								}
								
								break;
								
							default:
								break;
							}
						
						} catch (SpecificationException e) {
							// TODO Handle the exception somehow
							throw e;
						}
						
				
				} 
						
					
			}			
		}
	}
	
}
