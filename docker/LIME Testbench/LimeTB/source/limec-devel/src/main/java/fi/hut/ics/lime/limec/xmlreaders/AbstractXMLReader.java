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

import fi.hut.ics.lime.common.utils.Debug;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

public abstract class AbstractXMLReader {

	private final File xmlFileToRead;
	
	/**
	 * @param xmlFileToRead the XML file we should read
	 */
	public AbstractXMLReader(File xmlFileToRead) {
		
		assert xmlFileToRead.exists() : "Attempted to read a non-existing " +
										"XML file " + 
										xmlFileToRead.getAbsolutePath() + ".";
		
		Debug.println("reading XML file: "+xmlFileToRead);
		
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
			doc = docBuilder.parse(xmlFile);
		} catch (Exception e) {
			// TODO do something reasonable with the exception
			System.err.println(e);
			System.exit(1);
		}
		
		// normalize text representation
		doc.getDocumentElement().normalize();

		return doc;
		
	}
	
	/**
	 * @return the File object pointing to the XML file we are currently
	 * reading
	 */
	public File getXMLFile() {
		return this.xmlFileToRead;
	}
	
}
