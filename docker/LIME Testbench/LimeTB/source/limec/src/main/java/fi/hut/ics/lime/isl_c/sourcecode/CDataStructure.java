/**
 * The abstract superclass of CStruct (represents a C struct statement and 
 * CUnion (represents a C union statement). To us, both are identical,
 * except the other is declared with "struct" and the other with "union".
 * 
 * Otherwise, the syntax is the same, so all of the logic for structs and
 * unions can reside here.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.sourcecode;

import java.util.HashSet;
import java.util.Set;

import fi.hut.ics.lime.common.sourcecode.Variable;

public abstract class CDataStructure {

private HashSet<Variable> variables = new HashSet<Variable>();
	
	private String name;
	
	public CDataStructure(String name) {
		this.name = name;
	}
	
	/**
	 * @return The name of this C data structure.
	 */
	public String getSimpleName() {
		return this.name;
	}
	
	/**
	 * @return all the Variables contained in this C data structure 
	 */
	public Set<Variable> getAllVariables() {
		return this.variables;
	}
	
	/**
	 * Adds the variable toAdd to the list of Variables associated with this
	 * C data structure.
	 * 
	 * @param toAdd the Variable to add
	 */
	public void addVariable(Variable toAdd) {
		this.variables.add(toAdd);
	}
	
}