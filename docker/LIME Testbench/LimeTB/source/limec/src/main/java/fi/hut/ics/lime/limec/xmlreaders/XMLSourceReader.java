/**
 * XMLSourceFileReader is a class that takes a filename pointing to a Doxygen-
 * generated XML file that represents a C source file. XMLSourceFileReader 
 * reads this XML file and turns it into a representation of the C program by
 * creating objects defined by the classes in fi.hut.ics.lime.limec.sourcecode. 
 * 
 * The types of objects created are 
 * 
 * 	CSource (C source file)
 * 	CVariable (non-automatic C variable)
 * 	CMethod (a C function)
 * 	CParameter (a formal parameter of a C function)
 * 	CStruct (a C struct statement)
 * 	CUnion (a C union statement)
 *  
 * XMLSourceFileReader also creates associations between these objects (e. g.
 * a CParameter is always associated with a CMethod, as a formal parameter is
 * always linked to a certain function). 
 * 
 * An additional responsibility of this class is to read the Interface
 * Specification Language statements contained in the XML file, parse them with
 * the tools in fi.hut.ics.lime.limec.islparser and associate the parsed ISL
 * with the correct object, basically a CSource or a CMethod.
 * 
 * @author lharpf
 */

package fi.hut.ics.lime.limec.xmlreaders;

import java.io.File;
// testing
import fi.hut.ics.lime.limec.Main;
import fi.hut.ics.lime.common.sourcecode.*;

// Imports for reading XML
import org.w3c.dom.*;

import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.limec.Settings;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.sourcecode.CVariable;
import fi.hut.ics.lime.limec.xmlreaders.generators.CMethodGenerator;
import fi.hut.ics.lime.limec.xmlreaders.generators.CVariableGenerator;

public class XMLSourceReader extends AbstractXMLReader {
	
	private File pathToRead;
	
	private CSource cSource;
	
	/** 
	 * Creates an XMLSourceFileReader to parse the Doxygen XML-file specified by
	 * fileToRead. 
	 */
	public XMLSourceReader(File fileToRead) {

		super(fileToRead);
		this.pathToRead = fileToRead.getParentFile();
		this.parse();
		
	}
	
	/** 
	 * Parses the Doxygen XML-file associated with this XMLSourceFileReader. 
	 * Information about functions, variables, \#include statements, structs 
	 * and ISL specifications is read and associated with the Source that 
	 * can be retrieved via getParsedResult(). 
	 */
	private void parse() {

		Document doc = this.getDocument(this.getSourceFile());

		// Create a new CSource object representing a C source code file
		this.cSource = createNewCSource(doc);
		
		// scan for #include statements in this C source file
		associateIncludeStatements(doc);

		// scan for datastructures (structs and unions) defined in this C 
		// source file
		findDataStructures(doc);

		// scan for the variables, functions and typedef statements 
		// in this C source file
		findVariablesFunctionsAndTypeDefs(doc);
	    
	}	

	/**
	 * Goes through the entire XML file and looks for "compounddef" tags. The
	 * "includes" subtags of "compounddef" tags contain the information
	 * regarding all \#included files in the C source file represented by the
	 * XML.
	 * 
	 * Upon finding an \#include statement, this function associates it with
	 * cSource so we can later on add these \#includes to the aspect we are
	 * creating. 
	 * 
	 * @param doc The XML document
	 */
	private void associateIncludeStatements(Document doc) {

	    NodeList compoundNodes = doc.getDocumentElement().getElementsByTagName("compounddef");
	    
	    for (int i = 0; i < compoundNodes.getLength(); i++) {
	    	
	    	Node compoundNode = compoundNodes.item(i);
	    	
	    	for (int j = 0; j < compoundNode.getChildNodes().getLength(); j++) {
	    		Node possibleInclude = compoundNode.getChildNodes().item(j);
	    		
	    		if (possibleInclude.getNodeName().equals("includes")) {
	    			// Found an #include statement, let's associate it with
	    			// this C source file.
	    			
	    			Node isLocal = possibleInclude.getAttributes().getNamedItem("local");
	    			String fileName = possibleInclude.getTextContent();
	    			
	    			if (isLocal.getNodeValue().equals("yes")) {
		    			// #include "example.h"
	    				this.cSource.addIncludedFile(fileName, true);
	    				// testing
	    				//parseIncludeFile(fileName);
	    			} else if (isLocal.getNodeValue().equals("no")){
	    				// #include <example.h>
	    				this.cSource.addIncludedFile(fileName, false);
	    			} else {
	    				// Should only have two types of includes?
	    				assert false : "Unrecognized #include statement."; 
	    			}
	    			
	    		}
	    		
	    	}
	    	
	    }
	}

	/**
	 * Fetches the typedef statement from typeDefNode and associates it with
	 * the C source code file cSource. 
	 * 
	 * @param typeDefNode a node representing a "memberdef" tag with the
	 * 	      "kind" value "typedef"
	 */
	private void createTypeDef(Node typeDefNode) {
		
		NodeList subNodes = typeDefNode.getChildNodes();
		
		for(int i=0; i < subNodes.getLength(); i++) {
			Node possibleDefinition = subNodes.item(i);
			
			if (possibleDefinition.getNodeName().equals("definition")) {
				/* The "definition" subtag of the "memberdef" tag of kind
				   "typedef" is where the typedef statement is located */
				this.cSource.addTypeDef(possibleDefinition.getTextContent());
				break;	// should be only one "definition" per "memberdef"
			}
		
		}
		
	}
	
	/** 
	 * Go through the XML file and find all the non-automatic (i.e. those
	 * defined outside functions) variables and all the functions. Create
	 * new CVariable and CMethod objects from them and associate these new
	 * objects with this C source file. 
	 */
	private void findVariablesFunctionsAndTypeDefs(Document doc) {
        
		// Go through all memberdefs        
		NodeList nodes = doc.getDocumentElement().getElementsByTagName("memberdef");
        
		for(int i = 0; i < nodes.getLength(); i++) {
		    
			Node aNode = nodes.item(i);
			NamedNodeMap aNodeAttr = aNode.getAttributes();
			
			Node nodeType = aNodeAttr.getNamedItem("kind");
			
			if (nodeType.getNodeValue().equals("variable")) {
				// A variable, let's store it
				CVariable newVariable = 
					CVariableGenerator.createVariable(aNode, this.cSource);
				this.getParsedResult().addVariable(newVariable);
			} else if (nodeType.getNodeValue().equals("function")) {
				// A function
				CMethodGenerator.createFunction(aNode, this.cSource); 
			} else if (nodeType.getNodeValue().equals("typedef")) {
				this.createTypeDef(aNode);
			}
			
		}
	
	}
	
	/**
	 * Invokes XMLDataStructureReader to read information concerning a C struct
	 * or union statement. Associates the information read with this C source
	 * file.
	 * 
	 * XMLDataStructureReader creates CUnion and CStruct objects based on the
	 * XML file this method passes on to it. 
	 *  
	 * @param doc The Document representation of the XML file that represents
	 * 		  the C source file we are currently reading
	 */
	private void findDataStructures(Document doc) {
		
		// The locations of the separate XML files made from structs and unions
		// are hidden in "innerclass" tags.
		NodeList innerclassTags = 
			doc.getDocumentElement().getElementsByTagName("innerclass");
		
		for(int i=0; i < innerclassTags.getLength(); i++) {

			Node innerclassTag = innerclassTags.item(i);
			NamedNodeMap attributes = innerclassTag.getAttributes();
			
			String fileName = attributes.getNamedItem("refid").getNodeValue();
			File structureXMLFile = new File(this.pathToRead + File.separator +
									fileName + ".xml");
			
			if (Settings.isVerbose()) {
				System.out.println("About to read " + 
					structureXMLFile.getAbsolutePath() + "\n");
			}
			
			XMLDataStructureReader structureReader = 
				new XMLDataStructureReader(structureXMLFile, this.cSource); 
			
			this.cSource.addDataStructure(structureReader.getParsedResult());
			
		}
		
	}
	
	/**
	 * Creates a new CSource object that represents a C source file. In the
	 * beginning, the only information associated with the object is the
	 * location of the source file. Other information is filled up later.
	 * 
	 * @param doc The Doxygen XML document that describes the structure
	 *        of this C source file
	 * @return a new CSource object
	 */
	private CSource createNewCSource(Document doc) {
		
		String sourceFileName = null;
		
		NodeList compoundDefTags =
			doc.getDocumentElement().getElementsByTagName("compounddef");
		
		for (int i=0; i < compoundDefTags.getLength(); i++) {
			Node compoundDefTag = compoundDefTags.item(i);
			
			if (compoundDefTag.getAttributes().
					getNamedItem("kind").getNodeValue().equals("file")) {
				// This is the compoundDefTag describing the file. We can
				// find the location of the file in the location subtag
				NodeList subTags = compoundDefTag.getChildNodes();
				
				for (int j=0; j < subTags.getLength(); j++) {
					
					Node subTag = subTags.item(j);
					
					if (subTag.getNodeName().equals("location")) {
						assert sourceFileName == null :
							"Expected a single name for the source file," +
							"but encountered more than one.";
						sourceFileName = subTag.getAttributes().
								getNamedItem("file").getNodeValue();
					}
				}
			}
		}
				
		return new CSource(new File(sourceFileName));
	
	}
	
	/**
	 * @return The parsed representation of the XML. (Should this really be source instead of csource?)
	 */
	public Source getParsedResult() {
		return this.cSource;
	}
	
}
