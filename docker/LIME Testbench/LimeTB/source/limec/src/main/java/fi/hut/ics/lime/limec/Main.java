package fi.hut.ics.lime.limec;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import fi.hut.ics.lime.common.aspect.AspectWriter;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.SpecificationException;
import fi.hut.ics.lime.common.specification.SpecificationFactory;
import fi.hut.ics.lime.limec.aspect.ACCAspectFactory;
import fi.hut.ics.lime.limec.ast.Annotation;
import fi.hut.ics.lime.limec.ast.AnnotationType;
import fi.hut.ics.lime.limec.ast.AnnotationField;
import fi.hut.ics.lime.limec.backend.BackEnd;
import fi.hut.ics.lime.limec.frontend.FrontEnd;

import fi.hut.ics.lime.limec.sourcecode.CMethod;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.staticaccessor.StaticAccessor;
import fi.hut.ics.lime.limec.xmlreaders.XMLMainReader;
import fi.hut.ics.lime.limec.xmlreaders.XMLSourceReader;

public class Main {
	
	private static SpecificationFactory specificationFactory = SpecificationFactory.instance();
	private static ACCAspectFactory aspectFactory = ACCAspectFactory.instance();
	
	public static void main (String argv []) throws Exception {
		
		// Get the directory where the original C source files should be
		File sourceDir = getDirectoryFromInput(argv);
		
		// Front-end stuff: Copy the sources to a temp directory,
		// do some preprocessing, invoke Doxygen to create XML files from 
		// the C source files.
		FrontEnd frontEnd = new FrontEnd(sourceDir);
		File mainXMLFile = frontEnd.getMainXMLFile();
		
		XMLMainReader reader = new XMLMainReader(mainXMLFile);
		
		ArrayList<File> xmlFilesToRead = reader.getXMLFilesToRead(); 
		
		// Parse the XML files that represents the C source files. The ISL 
		// embedded in the XML is further parsed by the 
		// fi.hut.ics.lime.limec.islparser during the same process.
		for (File xmlFileToRead : xmlFilesToRead) {
		
			CSource cSource = null;
			
			if (Settings.isVerbose()) {
				System.out.println("\nProcessing file " + xmlFileToRead.getAbsolutePath());
			}
			
			XMLSourceReader sourceReader = new XMLSourceReader(xmlFileToRead);

			cSource = (CSource)sourceReader.getParsedResult();
			
			// Did we correctly read all functions and variables from xmlFileToRead? 
			//System.out.println("PARSING INFO");
			//DebugPrinter.printXMLParsingDebugInfo(cSource);
				
			// This can be used to check that the parsing of the ISL went OK
			//System.out.println("CHECKER INFO");
			//DebugPrinter.printAllCheckerDebugInfo(cSource);
		
			PropositionGenerator.createAllPropositions(cSource);
			SpecificationGenerator.createAllSpecifications(cSource);
		
			// Check for Observes and if found, link them to correct
		   	// interface/library specifications
			associateObserves(cSource, specificationFactory);
		
			// This can be used to check that the creation of specifications and
			// the association of Observes with the specifications went OK
			//System.out.println("SPEC INFO");
			//DebugPrinter.printSpecificationDebugInfo(specificationFactory, cSource);
			
			StaticAccessor.addOriginalSourceAccessors(cSource, sourceDir);
			createAspects();
			writeAspectsToDisk(sourceDir);
					
		}
		
		// All done. The back end will clean up for us.
		BackEnd backEnd = new BackEnd(frontEnd);
		backEnd.cleanUp();
		
	}
	
	/**
	 * Observes may be used to specify that a certain function is
	 * associated with a CallSpecification or a ReturnSpecification. This method
	 * goes through all functions of the C source file sourceFile and checks
	 * if they have Observes associated with them.
	 * 
	 * If they do, it finds the correct CallSpecification/ReturnSpecification and
	 * associates the function with it. Observes may also be used
	 * to set the exception that is thrown when the specification is broken;
	 * this method is supposed to handle that as well.
	 * 
	 * @param sourceFile the C source file to grab functions from and determine
	 * 		  if they are associated with Observes
	 * @param specificationFactory the specification factory
	 */
	public static void associateObserves(CSource sourceFile, SpecificationFactory specificationFactory) {
		
		for (Method meth : sourceFile.getAllMethods()) {
			
			// Need to explicitly cast to use getAssociatedCheckers
			CMethod func = (CMethod)meth;
			
			for (Annotation annotation : func.getAssociatedAnnotations()) {
				
				if (annotation.getType() != AnnotationType.OBSERVE) {
					continue; // We are only interested in Observes
				}
					
				for (AnnotationField field : annotation.getAnnotationFields()) {
					
					try {
						
						// This function is associated with an Observe. Now,
						// find the checker this Observe 'points to' and
						// add this function to the list of functions observed by
						// that checker.
						
						for (String fieldContent : field.getFieldContents()) {
							
							// A Observe may associate the function with multiple
							// checkers, so we need to iterate through the Observe contents
							
							Specification spec = specificationFactory.getSpecification(sourceFile, 
												fieldContent);
							spec.addEnforcedMethod(func);
						
						}
						
					} catch (SpecificationException spe) {
						System.out.println(spe.getMessage());
					}
					
				}

			}
			
		}
		
	}
	
	private static void createAspects() {
		
		// Put all specs into a common map
		HashMap<Source, Map<String,? extends Specification>> allSpecs =
			new HashMap<Source, Map<String,? extends Specification>>();
		allSpecs.putAll(specificationFactory.getRegExpSpecifications());
		allSpecs.putAll(specificationFactory.getPltlSpecifications());
		allSpecs.putAll(specificationFactory.getNfaSpecifications());

		// Check that all specifications are associated to at least something.
		// Create aspects from the specifications.
		for(Source sourceType : allSpecs.keySet()) {
			for (String name : allSpecs.get(sourceType).keySet()) {
				Specification specification = allSpecs.get(sourceType).get(name);
				if(specification.getEnforcedMethods().size() == 0) {
					System.err.println("WARNING: " + specification.toString() + 
										"never gets triggered.");
				}
				else {
					try {
						aspectFactory.createAspect(specification);
					} catch (Exception e) { //AspectException
						System.err.println("ERROR: Failed to create aspect from " +
								           specification.toString() + ".");
					}
				}
			}
		}
		
	}
	
	private static void writeAspectsToDisk(File targetDir) {
		
		// Just print out a note that we're writing to the disk and not hung
		if (Settings.isVerbose()) {
			System.out.print("Writing aspect to the disk... ");
		}
		
		// Should now have AspeCt-oriented C aspects, let's write them to the disk.
		// We write to the same directory we read the aspect from.
		try {
			AspectWriter.getInstance().writeAspects(aspectFactory.getAllAspects(), 
												targetDir, "acc");
		} catch (IOException e) {
			System.err.println("ERROR: Failed to write aspect(s) to disk.");
			System.err.println(e.getMessage());
		}
	
		if (Settings.isVerbose()) {
			System.out.println("Done.");
		}
		
	}
	
	/**
	 * Checks the input given to this program and if possible, returns a File
	 * object representing the directory where the C source files to be 
	 * processed are located. If the user didn't give a directory name or
	 * gave one that doesn't exist, we print out an error and exit.
	 * 
	 * @param argv The command-line arguments to this program
	 * @return a File object representing the directory where the C source
	 * 		   code files to be processed are located
	 */
	private static File getDirectoryFromInput(String argv[]) {
		
		File sourceDir = null;
		
		if (argv.length < 1) {
			System.out.println("Please specify the path to C source files to " +
					           "process as a parameter.\n\n" +
					           "Usage: Main [-s] PATH/TO/FILES");
			System.exit(2);
		} else {
			
			if (argv.length > 1 && argv[0].equals("-s")) {
				// User wants to operate in silent mode; produce no output
				Settings.setVerbose(false);
				sourceDir = new File(argv[1]);
			} else {
				sourceDir = new File(argv[0]);
			}
			
			if (!sourceDir.exists()) {
				System.out.println("The directory " + sourceDir.getAbsolutePath() +
						           " doesn't seem to exist.");
				System.exit(2);
			} else if (!sourceDir.isDirectory()) {
				System.out.println("Please give the directory where the files " +
						           "are located as a parameter instead of the " +
						           "name(s) of the files themselves.");
				System.exit(2);
			}
			
		}

		return sourceDir;
		
	}
	
}
