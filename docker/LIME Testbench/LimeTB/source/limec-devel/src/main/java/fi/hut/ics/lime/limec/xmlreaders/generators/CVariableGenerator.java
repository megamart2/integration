/**
 * An utility class used by the classes in fi.hut.ics.lime.limec.xmlreaders
 * package. Creates CVariable objects from a Node fed to it. The Node should 
 * represent an XML "memberdef" tag that describes a variable.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.xmlreaders.generators;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.sourcecode.CVariable;

public class CVariableGenerator {

	/** 
	 * Creates a new CVariable object based on the data in the node given
	 * as a parameter. Returns the CVariable rather than associating it
	 * directly with cSource. The reason for this is that the variable
	 * may be contained in a C data structure (struct or union) statement 
	 * that is associated with a C source file.
	 *  
	 * Thus, the variable might need to be associated first with a C
	 * data structure and then the data structure with a C source, rather than 
	 * associating the variable directly with a C source.
	 *	
	 * @param variableNode The node that contains a memberdef describing a
	 *		  variable 
	 * @param cSource the C source file this variable is contained in; used as a
	 *		  container for any Interface Specification Language
	 *		  potentially encountered
	 *
	 * @return the CVariable created */
	public static CVariable createVariable(Node variableNode, CSource cSource) {

		NamedNodeMap aNodeAttr = variableNode.getAttributes();

		// A function, let's store it. Placeholders for the information
		// required to create a new CVariable (which represents a variable).
		String varName = null;
		String varType = null;
		String varTypeDetails = null;	
		Visibility varVisibility = null;

		// Check whether this is a static variable or not 
		Node varIsStatic = aNodeAttr.getNamedItem("static");

		if (varIsStatic.getNodeValue().equals("yes")) {
			varVisibility = Visibility.STATIC;
		} else {
			varVisibility = Visibility.NONSTATIC;
		}

		// Get the rest of the information regarding the variable
		NodeList varDetails = variableNode.getChildNodes();

		for (int j = 0; j < varDetails.getLength(); j++) {
			Node attributeNode = varDetails.item(j);

			if (attributeNode.getNodeName().equals("type")) {
				// Store type
				assert varType == null : "Double type definition for variable.";		
				varType = attributeNode.getTextContent();
			} else if (attributeNode.getNodeName().equals("name")) {
				// Store name
				assert varName == null : "Double name definition for variable.";
				varName = attributeNode.getTextContent();
			} else if (attributeNode.getNodeName().equals("argsstring")) {
				// Store type details
				assert varTypeDetails == null : "Double type details definition for variable";
				varTypeDetails = attributeNode.getTextContent();
			} else if (attributeNode.getNodeName().equals("detaileddescription")) {
				// Create ISL and associate it with the source file
				ISLGenerator.createISL(attributeNode, cSource);
			}

		}

		// Create the CVariable and add it to the list of variables associated
		// with a C source file or a data structure (struct or union)

		CVariable tempVariable = new CVariable(varName, varType, varTypeDetails,
				varVisibility);

		return tempVariable;

	}

}
