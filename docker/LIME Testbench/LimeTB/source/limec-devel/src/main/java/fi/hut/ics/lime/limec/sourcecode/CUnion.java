/**
 * Represents a C union definition. All the actual logic is in CDataStructure
 * (structs and unions have the same syntax).
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.sourcecode;

public class CUnion extends CDataStructure {

	/** 
	 * Create a new C union statement with the name name; for example,
	 * if we encounter "union aSimpleUnion { };", the name should be
	 * "aSimpleUnion"
	 *  
	 * @param name the name of the CUnion to create 
	 */
	public CUnion(String name) {
		super(name);
	}

}
