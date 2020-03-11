/**
 * Contains the common functionality shared by all XML reading classes
 * in this package. The single-purpose XML readers (XMLMainReader,
 * XMLSourceReader, XMLStructReader) extend this class.
 * 
 * @author lharpf 
 */
package fi.hut.ics.lime.limec.xmlreaders;

import java.io.File;

//Imports for reading XML

import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

public abstract class AbstractXMLReader {

	private final File xmlFileToRead;
	
	/**
	 * @param xmlFileToRead the XML file we should read
	 */
	public AbstractXMLReader(File xmlFileToRead) {
		
		assert xmlFileToRead.isFile() : "Attempted to read a non-existing " +
										"XML file " + 
										xmlFileToRead.getAbsolutePath() + ".";
		
		this.xmlFileToRead = xmlFileToRead;
	}
	
	/**
	 * @return a Document element representing the XML file xmlFile
	 */
	public Document getDocument(File xmlFile) {
		
		DocumentBuilderFactory docBuilderFactory; 
		docBuilderFactory = DocumentBuilderFactory.newInstance();
		
		DocumentBuilder docBuilder;
		Document doc = null;
		
		try {
			docBuilder = docBuilderFactory.newDocumentBuilder();
			doc = docBuilder.parse (xmlFile);
		} catch (Exception e) {
			// TODO: better exception handling?
			System.err.println(e.getMessage());
			System.exit(1);
		}
		
		doc.getDocumentElement().normalize(); // normalize text representation

		return doc;
		
	}
	
	/**
	 * @return the File object pointing to the XML file we are currently
	 * reading
	 */
	public File getSourceFile() {
		return this.xmlFileToRead;
	}
	
}
