/**
 * This is an utility class that contains methods to print debugging output
 * in various states of the program. The purpose of the class is to keep Main
 * and XMLReader from getting clogged with methods that simply print out debug
 * info.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec;

import java.util.Map;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Variable;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.common.specification.BricsAutomatonSpecification;
import fi.hut.ics.lime.common.specification.PltlSpecification;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.SpecificationFactory;
import fi.hut.ics.lime.limec.ast.Annotation;
import fi.hut.ics.lime.limec.ast.AnnotationField;
import fi.hut.ics.lime.limec.sourcecode.CMethod;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.sourcecode.ISLContainer;

public class DebugPrinter {

	/** 
	 * Prints out some simple debugging information about the parsed 
	 *  ISL attached to a CSource and to all of its functions (CMethods). 
	 *  Just a convenient shortcut for calling printContainerDebugInfo(CSource) 
	 *  and then printContainerDebugInfo(all CMethods of CSource)
	 *  
	 *  @param source the CSource to print debug info about
	 */
	protected static void printAllCheckerDebugInfo(CSource source) {
		printCheckerDebugInfo(source);
		for (Method func : source.getAllMethods()) {
			printCheckerDebugInfo((CMethod)func);
		}
	}
	
	/** 
	 * Just prints out some simple debugging information about an
	 * 	object (CSource or CMethod) that has parsed ISL associated
	 *  with it. This is a convenient way to check that the ISL
	 *  has been parsed correctly.
	 *  
	 *  @param container the CSource or CMethod we are interested in
	 */
	protected static void printCheckerDebugInfo(ISLContainer container) {
	
		if (!Settings.isVerbose()) {
			// Command-line switch -s set, operating in silent mode
			return;
		}
		
		for (Annotation annotation : container.getAssociatedAnnotations()) {
			
			if (container instanceof Source) {
				System.out.println("** ISL ASSOCIATED TO THE FILE " +
						((Source)container).getSimpleName() + " **");
			} else if (container instanceof Method) {
				System.out.println("** ISL ASSOCIATED TO THE FUNCTION " + 
						((Method)container).getSimpleName() + " **");
			}
				
			System.out.println("Found ISL type: " + annotation.getType());
			
			for (AnnotationField field : annotation.getAnnotationFields()) {
				System.out.println("\t" + field.getFieldName() + ":");
		
				for (String fieldContents : field.getFieldContents()) {
					System.out.println("\t\t" + fieldContents);
				}
			
			}
			
			System.out.println("\n");
				
		}	
	
	}
	
	/**
	 * Takes a SpecificationFactory and prints out some debugging information
	 * about the Specification objects associated with the factory. Useful
	 * for ensuring that all Specifications have been correctly created.
	 * 
	 * @param specificationFactory the SpecificationFactory object that contains
	 * 		  the Specifications we want to print out debugging information about
	 * @param source the CSource we want to print specifications for 
	 * 
	 */
	protected static void printSpecificationDebugInfo(SpecificationFactory 
			specificationFactory, CSource source) {
	
	if (!Settings.isVerbose()) {
		// Command-line switch -s set, operating in silent mode
		return;
	}
		
	// pltl specifications
	for (Map<String,PltlSpecification> tmpMap: specificationFactory.getPltlSpecifications().values()) {
	
			for (PltlSpecification spec : tmpMap.values()) {
				if (spec.getSourceType().equals(source)) {
					System.out.println("PLTL SPECIFICATION:\n");
					printSpecificationDebugInfoHelper(spec);
				}
			}
	
	}
	
	// regexp specifications
	for (Map<String,BricsAutomatonSpecification> tmpMap: specificationFactory.getRegExpSpecifications().values()) {
		
		
		for (BricsAutomatonSpecification spec : tmpMap.values()) {
			if (spec.getSourceType().equals(source)) {
				System.out.println("REGEXP SPECIFICATION:\n");
				printSpecificationDebugInfoHelper(spec);
			}
		}
	
	}
	
	// nfa specifications
	for (Map<String,BricsAutomatonSpecification> tmpMap: specificationFactory.getNfaSpecifications().values()) {
		

		for (Specification spec : tmpMap.values()) {
			if (spec.getSourceType().equals(source)) {
				System.out.println("NFA SPECIFICATION:\n");
				printSpecificationDebugInfoHelper(spec);
			}
		}
	}
	
	}
	
	/* A helper method for printSpecificationDebugInfo */
	protected static void printSpecificationDebugInfoHelper(Specification spec) {
	
		if (!Settings.isVerbose()) {
			// Command-line switch -s set, operating in silent mode
			return;
		}
			System.out.print("\tEnforces: ");
		
			for (Method func : spec.getEnforcedMethods()) {
				System.out.print(func.getSimpleName() + " ");
			}
			System.out.println();
		
			System.out.println("\tParsed representation: " + spec.getParsed());
	
	}
	
	/** 
	 * Prints out some debug information regarding the variables,
	 * 	functions and function parameters parsed from the XML. Useful
	 * 	to invoke after parsing the XML to check that the parsing
	 *  went OK.
	 *  
	 *  @param source the CSource we are interested in
	 */
	protected static void printXMLParsingDebugInfo(CSource source) {
		
		if (!Settings.isVerbose()) {
			// Command-line switch -s set, operating in silent mode
			return;
		}
		
		for (Variable aVariable : source.getAllVariables()) {
        	
			System.out.println("Variable information\n");
				
			System.out.println("Name: " + aVariable.getSimpleName());
			System.out.println("Type: " + aVariable.getType());
			System.out.println("Type details: " + aVariable.getTypeDetails());
			System.out.print("Visibility? ");
			if (aVariable.getVisibility() == Visibility.NONSTATIC) {
				System.out.println("nonstatic");
			} else {
				System.out.println(aVariable.getVisibility());
			}
			
			System.out.println("\n");
        	
		}
		
		for (Method aFunction : source.getAllMethods()) {
			
			System.out.println("Function information\n");
			
			System.out.println("Name: " + aFunction.getSimpleName());
			System.out.println("Return value: " + aFunction.getReturnType());
			
			assert (aFunction instanceof CMethod) : "Cast to CMethod fails";
			
			System.out.println("Inline? " + ((CMethod)aFunction).isInline());
			System.out.print("Visibility? ");
			if (aFunction.getVisibility() == Visibility.NONSTATIC) {
				System.out.println("nonstatic");
			} else {
				System.out.println(aFunction.getVisibility());
			}
			
			for (Parameter aParameter : aFunction.getParameters()) {
				System.out.println("Parameter:");
				
				System.out.println("\tName: " + aParameter.getSimpleName());
				System.out.print("\tType: " + aParameter.getTypeAsString());
				System.out.println((aParameter.isArray()) ? " []" : "");
					
			}
			
			System.out.println("\n");
			
		}
		
	}
	
}
