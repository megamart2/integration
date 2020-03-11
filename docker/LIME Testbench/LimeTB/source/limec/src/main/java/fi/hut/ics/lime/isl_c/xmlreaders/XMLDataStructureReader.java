/**
 * Reads Doxygen-generated XML files that represent C data structures
 * (struct or union statements). Turns the XML representation into CStruct 
 * or CUnion objects, depending on whether we encounter a struct or an
 * union.
 * 
 * The CDataStructure may contain zero or more CVariable objects representing 
 * the variables defined in the struct/union statement.
 *
 * Only structs and unions defined outside functions are of interest to us; 
 * those inside functions are ignored (by Doxygen).
 *
 * @author lharpf
 */

package fi.hut.ics.lime.isl_c.xmlreaders;

import java.io.File;

//Imports for reading XML
import org.w3c.dom.*;

import fi.hut.ics.lime.isl_c.sourcecode.CDataStructure;
import fi.hut.ics.lime.isl_c.sourcecode.CSource;
import fi.hut.ics.lime.isl_c.sourcecode.CStruct;
import fi.hut.ics.lime.isl_c.sourcecode.CUnion;
import fi.hut.ics.lime.isl_c.sourcecode.CVariable;
import fi.hut.ics.lime.isl_c.xmlreaders.generators.CVariableGenerator;

public class XMLDataStructureReader extends AbstractXMLReader {

	private CDataStructure cDataStructure;
	private CSource cSource;
	
	/**
	 * Creates a new XMLStructReader to read a Doxygen-generated XML file
	 * that should represent a C struct statement. 
	 * 
	 * @param structXMLFile the XML file representing a C struct statement
	 * @param cSource the C source file this struct statement is associated
	 * 				  with
	 */
	public XMLDataStructureReader(File structXMLFile, CSource cSource) {
		super(structXMLFile);
		this.cSource = cSource;
		this.parse();
	}

	/**
	 * Reads the XML file (assumed to represent a struct) via the functionality 
	 * provided by the superclass. Passes it on to a helper method for
	 * extracting information about the struct. 
	 */
	private void parse() {
		
		Document doc = this.getDocument(this.getSourceFile());
	    
	    parseDataStructure(doc);
		
	}
	
	/**
	 * Creates a new CStruct (represents a C struct statement) or CUnion
	 * (represents a C union statement) depending on which one the XML
	 * document doc represents. Both are subclasses of CDataStructure that
	 * have no own functionality; in C, struct and union have the same
	 * syntax.
	 * 
	 * All variables defined in the original struct or union statement are
	 * added to the new CDataStructure as CVariable objects. 
	 * 
	 * @param doc The XML document to read in Document form
	 */
	private void parseDataStructure(Document doc) {
		
		// There is always just one struct or union per file. First, get the
		// compounddef tag in this file (it tells us whether this is a struct
		// or an union).
		NodeList compounddefTag =
			doc.getDocumentElement().getElementsByTagName("compounddef");
		
		assert compounddefTag.getLength() == 1 : "Expected the XML file " +
				"containing a struct or union to have exactly one " + 
				"compounddef tag, but encountered " + 
				compounddefTag.getLength() + ".";
		
		String structureType =
			compounddefTag.item(0).getAttributes().getNamedItem("kind").
			getTextContent();
		
		// Get the name of the struct or union
		NodeList compoundnameTag =
			doc.getDocumentElement().getElementsByTagName("compoundname");
		
		assert compoundnameTag.getLength() == 1 : "Expected the XML file " +
				"containing a struct or union to have exactly one " + 
				"compoundname tag, but encountered " + 
				compoundnameTag.getLength() + ".";
		
		String structureName = compoundnameTag.item(0).getTextContent();
			
		// We know the name and the type, we can create it
		
		if (structureType.equals("struct")) {
			this.cDataStructure = new CStruct(structureName);
		} else if (structureType.equals("union")) {
			this.cDataStructure = new CUnion(structureName);
		} else {
			// TODO There might be other innerclass items than what we've encountered
			assert false : "Encountered an innerclass that was not a struct " +
						   "or union.";
		}
		
		NodeList memberdefTags = doc.getDocumentElement().
									getElementsByTagName("memberdef");
		
		// Go through all memberdef tags
		for(int i = 0; i < memberdefTags.getLength(); i++) {
			NamedNodeMap memberAttr = memberdefTags.item(i).getAttributes();
			
			Node memberdefType = memberAttr.getNamedItem("kind");
			
			if (memberdefType.getNodeValue().equals("variable")) {
				// This is a variable associated with this struct or union. 
				// Add it accordingly.		 
				CVariable newVariable =
					CVariableGenerator.createVariable(memberdefTags.item(i), 
													  this.cSource);
				this.getParsedResult().addVariable(newVariable);
			}
		}
		
	}
	
	/**
	 * @return a CDataStructure object representing a C struct statement
	 * (CStruct object) or a C union statement (CUnion object) 
	 */
	public CDataStructure getParsedResult() {
		return this.cDataStructure;
	}
	
}
