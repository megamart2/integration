/**
 * Exception thrown by the fi.hut.ics.lime.limec.xmlreaders classes
 * when something goes wrong while reading or attempting to read XML.
 */
package fi.hut.ics.lime.limec.xmlreaders;

@SuppressWarnings("serial")
public class XMLException extends Exception {

	public XMLException() {
		super();
	}

	public XMLException(String message) {
		super(message);
	}

	public XMLException(Throwable cause) {
		super(cause);
	}

	public XMLException(String message, Throwable cause) {
		super(message, cause);
	}

}
