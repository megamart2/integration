/**
 * Contains the functionality needed to enable aspects generated by the tool
 * to access static functions and non-automatic static variables contained in
 * the original C source file.
 * 
 * Basically, this class adds functions to both the aspect and to the (copy
 * of the) original C source file. The functions added to the C source work
 * as accessors for the static functions and variables, while the functions
 * added to the aspect are jump points to the accessor functions.
 * 
 * This functionality is isolated from the other parts of the aspect
 * generation, as we hope that eventually AspeCt-oriented C will start to
 * support accessing static functions and variables.
 * 
 * TODO: Can be deleted and replaced with a more elegant solution as soon as 
 * AspeCt-oriented C starts to offer support for accessing static functions.
 * 
 * @author lharpf
 */

package fi.hut.ics.lime.limec.staticaccessor;

import java.io.File;
import java.io.IOException;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Variable;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.common.utils.FileUtils;
import fi.hut.ics.lime.limec.sourcecode.CSource;

public class StaticAccessor {

	// optimally this could be something that is verified to be unique,
	// but this will do for now
	private static final String SUFFIX = "_lime_accessory_";
	
	/**
	 * Takes a String that represents C code that is to be added to the
	 * aspect being generated. Searches for any occurrences of calls to
	 * static functions in that code and replaces them with calls to
	 * the appropriate accessor functions.
	 * 
	 * @param toConvert The code to convert
	 * @param source The source code to process
	 * 
	 * @return the code with calls to static functions (not visible from 
	 * the aspect) converted into calls to the corresponding accessor
	 * functions for these functions
	 */
	public static String convertToAccessorCalls(String toConvert, Source source) {

		CSource cSource = (CSource)source;
		
		// make sure the file name doesn't have unallowed characters, whatever that means
		String ACC_SUFFIX = SUFFIX+source.getSimpleName();
		ACC_SUFFIX = ACC_SUFFIX.replace('-', '_');
		// more needs to be added later
	
		// Go through all the functions in the given source file.
		for (Method func : cSource.getAllMethods()) {
			if (func.getVisibility() == Visibility.STATIC) {
				// Static function. Any occurrence of funcName(
				// must be replaced with funcName_ACC_SUFFIX(
				
				// TODO: add something to ensure that the accessor function name doesn't
				// doesn't match the name of some other function in the original file.
				toConvert = toConvert.replaceAll(
						"(" + func.getSimpleName() + "){1}" + "[ \\n\\t]*\\(", 
						func.getSimpleName() + ACC_SUFFIX + "\\(");
			}
			
		}
		
		// Go through all the non-automatic variables in the given source 
		// file
		for (Variable var : cSource.getAllVariables()) {
			if (var.getVisibility() == Visibility.STATIC) {
				// Static variable. Any occurrence of 
				// "(nonalphanumeric)varName(nonalphanumeric)" 
				// must be replaced with " varName_ACC_SUFFIX() "
				
				// TODO add something to ensure that the accessor function name doesn't
				// doesn't match the name of some other function in the original file.				
				toConvert = toConvert.replaceAll(
					  "(([^a-zA-Z0-9])" + "(" + var.getSimpleName() + "){1}" + "([^a-zA-Z0-9]*))",
					  "$2" + var.getSimpleName() + ACC_SUFFIX + "\\(\\)" + "$4");
				
			}
		} 
		
		return toConvert;
		
	}
	
	/**
	 * For every static function and static variable in the original C source
	 * file, adds an accessor function that enables us to access the static
	 * member from our aspect.
	 * 
	 * We read the original C source file, then write the one we modified to
	 * the same directory with the .mc extension. For example, if the original 
	 * source file has the name "source.c", the modified is written as 
	 * "source.mc".
	 * 
	 * @param source the Source object representing the C source file we are
	 * 		  processing
	 * @param targetDirectory a File object representing the directory to write 
	 * 		  the modified source files to. Should be the one containing the
	 * 		  original C source files.  
	 */
	public static void addOriginalSourceAccessors(CSource source, File targetDirectory) {

		try {
			
			if(!targetDirectory.isDirectory()) {
				throw new IOException("ERROR: " + 
					targetDirectory.getAbsolutePath() +  " does not exist " +
					"or is not a directory. Error encountered while trying " +
					"to write modified source files.");
			}
		
			// Get the name and path of the file to read.
			File sourceFile = new File(targetDirectory.getAbsolutePath() + 
								   File.separator + source.getFileName());
		
			// Read the file into the string contents.
			String contents = FileUtils.readFile(sourceFile);
			String code = "";
			
			// Go through all the functions in the original C source.
			// Code for accessor functions for static functions is
			// created into the string code.
			code += addOriginalSourceAccessorsForFunctions(source);
			code += addOriginalSourceAccessorsForVariables(source);
			
			if (!code.equals("")) {
				// if we added some functions, comment them for the user
				code = "/* Machine-generated accessor functions for " +
					  "static functions and variables */" + code;
			}
			
			// append the created code to the pre-existing
			contents += code;
			
			// write to disk with the extension .mc
			String targetFileName = source.getFileName().substring(0, 
									source.getFileName().lastIndexOf('.'))
									+ ".mc";
			// an alternative filename that preserves the original suffix
			//String targetFileName = source.getFileName() + ".mc";
			
			
			File targetFile = new File(targetDirectory.getAbsolutePath() + 
							  File.separator + targetFileName);
		
			if (sourceFile.equals(targetFile)) {
				// The original source file should never be overwritten 
				throw new IOException("ERROR: " +
						"Accidentally almost overwrote your original source " +
						"file at " + sourceFile.getAbsolutePath() + ". " +
						"Stopped before any damage could be done.");
			} else {
				FileUtils.writeFile(targetFile, contents);
			}
			
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
			System.exit(1);
		}

	}
	
	private static String addOriginalSourceAccessorsForFunctions(Source source) {

		String codeToAdd = "";
		
		// make sure the file name doesn't have unallowed characters, whatever that means
		String ACC_SUFFIX = SUFFIX+source.getSimpleName();
		ACC_SUFFIX = ACC_SUFFIX.replace('-', '_');
		// more needs to be added later
		 
		// TODO add something to ensure that the accessor function name doesn't
		// doesn't match the name of some other function in the original file.
		
		for(Method method : source.getAllMethods()) {
			
			if (method.getVisibility() == Visibility.STATIC) {
				
				// Create the function definition, 
				// e.g. float myFunc_ACC_SUFFIX(int j, char * pk) { 
				
				codeToAdd += "\n" + method.getReturnType() + " ";
				codeToAdd += method.getSimpleName() + ACC_SUFFIX +"(";
				
				for(int i=0; i < method.getParameters().size(); i++) {
					Parameter param = method.getParameters().get(i);
					
					codeToAdd += param.getTypeAsString() + " ";
					codeToAdd += param.getSimpleName();
					
					if (param.isArray()) {
						codeToAdd += "[]";
					}
					
					if (i < (method.getParameters().size() - 1)) {
						// more parameters to come, must add a comma
						codeToAdd += ", ";
					}
					
				}
				
				codeToAdd += ") {\n";
				
				// Create the function body, e.g. return myFunc(j, pk);
				codeToAdd += "\treturn " + method.getSimpleName() + "(";
				
				for(int i=0; i < method.getParameters().size(); i++) {
					Parameter param = method.getParameters().get(i);
					
					codeToAdd += param.getSimpleName();
					
					if (i < (method.getParameters().size() - 1)) {
						// more parameters to come, must add a comma
						codeToAdd += ", ";
					}
				}
					
				codeToAdd += ");\n";
				codeToAdd += "}\n";
				
				
			}
		
		}
		
		return codeToAdd;
	}
	
	private static String addOriginalSourceAccessorsForVariables(Source source) {

		String codeToAdd = "";
		
		// make sure the file name doesn't have unallowed characters, whatever that means
		String ACC_SUFFIX = SUFFIX+source.getSimpleName();
		ACC_SUFFIX = ACC_SUFFIX.replace('-', '_');
		// more needs to be added later
		 
		// TODO add something to ensure that the accessor function name doesn't
		// doesn't match the name of some other function in the original file.
		for (Variable var : source.getAllVariables()) {
			if (var.getVisibility() == Visibility.STATIC) {
				
				// A static variable; let's create the function definition
				// for it
				
				if (var.getTypeDetails().contains("[") && 
					var.getTypeDetails().contains("]")) {
					// A static array, which we cannot create an accessor
					// function for; C functions cannot return arrays.
					
					System.out.println("WARNING: Source file contains " + 
						"static non-automatic variables of array type, " +
						"which are unsupported. The created aspect may " +
						"function incorrectly.\n\n" +
						"Please remove the static modifier to ensure " +
						"correct operation.");
					continue;
				}
				
				// can't have 'const' here
				String type = var.getType();
				System.out.println("ACC VAR TYPE: "+type);
				if (type.contains("const")) {
					System.out.println("DEBUG: const found "+type);
					type = type.replace("const", "");
					System.out.println("DEBUG: replaced with "+type);
				}
				
				codeToAdd += "\n" + type + " ";
				codeToAdd += var.getSimpleName() + ACC_SUFFIX + "() {\n";
				
				// The accessor function body
				
				codeToAdd += "\treturn " + var.getSimpleName() + ";\n";
				codeToAdd += "}\n";
				
			}
		}
		
		return codeToAdd;
	}
	
}
