/**
 * Represents a C struct definition. All the actual logic is in CDataStructure
 * (structs and unions have the same syntax).
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.sourcecode;

public class CStruct extends CDataStructure {

	/** 
	 * Create a new C struct statement with the name name; for example,
	 * if we encounter "struct aSimpleStruct { };", the name should be
	 * "aSimpleStruct"
	 *  
	 * @param name the name of the CStruct to create 
	 */
	public CStruct(String name) {
		super(name);
	}
	
}
