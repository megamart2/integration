/**
 * An utility class used by the classes in fi.hut.ics.lime.isl_c.xmlreaders
 * package. Takes a raw-text representation of Interface Specification Language
 * and turns it into a parsed representation via the tools in the
 * fi.hut.ics.lime.isl_c.islparser package.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.xmlreaders.generators;

import java.io.StringReader;
import java.util.LinkedList;

import org.w3c.dom.Node;

import fi.hut.ics.lime.isl_c.ast.Annotation;
import fi.hut.ics.lime.isl_c.islparser.ISLLexer;
import fi.hut.ics.lime.isl_c.islparser.ISLParser;
import fi.hut.ics.lime.isl_c.sourcecode.ISLContainer;

public class ISLGenerator {

	/** 
	 * This method parses the ISL contained in ISLNode and associates the
	 * parsed ISL (now in the form of CheckerAnnotations) with the ISLContainer
	 * container, which represents a C source file or a function.
	 * 	
	 * ISLNode is expected to represent a detaileddescription or para Doxygen 
	 * XML-tag, which contain our ISL.
	 *  
	 * @param ISLNode a Node representing a detaileddescription or para XML
	 * 		  tag containing Interface Specification Language 
	 * @param container the ISLContainer (C source file or function) to 
	 *  	  associate the newly generated ISL with. */
	public static void createISL(Node ISLNode, ISLContainer container) {
		
		assert (ISLNode.getNodeName().equals("detaileddescription") |
			    ISLNode.getNodeName().equals("para")):
				"ISLNode does not represent ISL content!";
		
		if (ISLNode.getTextContent().trim().equals("")) {
			// Only non-empty content is fed to the parser
			return;
		}
		
		// Parse the ISL and associate it with container
		ISLParser parser;
		parser = new ISLParser(
				 new ISLLexer(new StringReader(ISLNode.getTextContent())));
		
		try {
			@SuppressWarnings("unchecked")
			LinkedList<Annotation> temp = 
				(LinkedList<Annotation>)parser.parse().value;
			container.addAssociatedAnnotations(temp);
		} catch (Exception e) {
			// TODO do something reasonable with the exception
			System.err.println(e.getMessage());
		}
		
	}
	
}
