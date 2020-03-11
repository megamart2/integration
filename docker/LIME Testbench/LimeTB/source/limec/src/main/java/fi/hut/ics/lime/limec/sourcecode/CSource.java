/**
 * Represents a C source code file.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.sourcecode;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.io.File;
import java.io.IOException;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.Variable;

public class CSource extends ISLContainer implements Source {

	private HashSet<Method> functions = new HashSet<Method>(); 
	private HashSet<Variable> variables = new HashSet<Variable>();
	private Map<String, Boolean> includedFiles = new HashMap<String, Boolean>();
	private HashSet<String> typedefs = new HashSet<String>();
	private HashSet<CDataStructure> structsAndUnions = 
							new HashSet<CDataStructure>();
	
	private final File fileLocation;

	public CSource(File fileLocation) {
		
		if (fileLocation == null) {
			System.err.println("ERROR: Must have a file to associate with " +
							   "a CSource object.");
		}
		
		this.fileLocation = fileLocation;

	}
	
	/**
	 * @return The filename (excluding the extension) of this source file.
	 * 
	 * Note that this source file is a temporary copy of the 
	 * original source file - not the original source file itself.
	 */
	public String getSimpleName() {
		
		String fileName = this.getFileName(); 
			
		return fileName.substring(0, fileName.lastIndexOf('.'));
	}
	
	/**
	 * @return The filename (including the extension) of this source file.
	 * 
	 * Note that this source file is a temporary copy of the 
	 * original source file - not the original source file itself.
	 */
	public String getFileName() {
		return this.fileLocation.getName();
	}
	
	/**
	 * @return the fully qualified name of this source file (path and filename),
	 * which is a temporary copy of the original source file.
	 */
	public String getQualifiedName() {
		
		String returnValue = null;
		
		try {
			returnValue = this.fileLocation.getCanonicalPath();
		} catch (IOException ioe) {
			System.err.println("Unable to resolve canonical path.");
			System.err.println(ioe.getMessage());
		}
		
		return returnValue;
	
	}
	
	/**
	 * @return all the accessible functions for this C source file
	 */
	public Set<Method> getAllMethods() {
		return this.functions;
	}
	
	/**
	 * Adds the method toAdd to the list of Methods associated with this 
	 * CSource.
	 * 
	 * @param toAdd the Method to add
	 */
	public void addMethod(Method toAdd) {
		this.functions.add(toAdd);
	}
	
	/**
	 * @return all the top-level (non-automatic, i.e. not within a function)
	 * Variables contained in this C source file 
	 */
	public Set<Variable> getAllVariables() {
		return this.variables;
	}
	
	/**
	 * Adds the variable toAdd to the list of Variables associated with this
	 * CSource.
	 * 
	 * @param toAdd the Variable to add
	 */
	public void addVariable(Variable toAdd) {
		this.variables.add(toAdd);
	}
	
	/**
	 * Adds the filename in fileName to the list of filenames defined to 
	 * be included in this C source file with the \#include statement. 
	 * 
	 * The Boolean local indicates the type of the \#include statement; for 
	 * \#include "example.h" local should be true and for \#include <example.h> 
	 * local should be false.
	 *
	 * @param fileName the name of the file specified in the \#include statement
	 * @param local a Boolean object, true if the \#include is "", false otherwise
	 */
	public void addIncludedFile(String fileName, Boolean local) {
		assert (fileName != null && local != null) : "Attempted to add a new " +
				"included file without sufficent information.";
		this.includedFiles.put(fileName, local);
	}
	
	/**
	 * If this C source file contains \#include statements, returns
	 * the list of files included by them. Otherwise, returns an empty
	 * Map.
	 *
	 * @return a Map representing the files included by this C Source.
	 * The keys of the Map are the filenames (Strings) that are 
	 * \#included, the values are Booleans representing whether
	 * the \#include is local (\#include "example.h" -> true) or
	 * not (\#include <example.h> -> false) 
	 */
	public Map<String, Boolean> getIncludedFiles() {
		return this.includedFiles;
	}

	/**
	 * Add a typedef statement to the list of typedef statements defined in
	 * this C source code file.
	 * 
	 * @param typeDef The typedef statement to add in its entirety (e.g.
	 * "typedef int myInt") but without the terminating semicolon
	 */
	public void addTypeDef(String typeDef) {
		assert (typeDef != null && typeDef.contains("typedef")) :
			"Attempted to add a typedef that was null or didn't " +
			"contain 'typedef'.";
		this.typedefs.add(typeDef);
	}

	/**
	 * @return the set of typedef statements defined in this C source code
	 * file.
	 */
	public HashSet<String> getTypeDefs() {
		return this.typedefs;
	}
	
	/**
	 * Add a C data structure, in other words a C struct or union definition,
	 * to the list of struct and union definitions in this C source code file.
	 * 
	 * @param struct the C data structure to add
	 */
	public void addDataStructure(CDataStructure struct) {
		this.structsAndUnions.add(struct);
	}
	
	/**
	 * @return the set of C data structures (C struct and union definitions)
	 * defined in this C source code file.
	 */
	public HashSet<CDataStructure> getDataStructures() {
		return this.structsAndUnions;
	}
	
}
