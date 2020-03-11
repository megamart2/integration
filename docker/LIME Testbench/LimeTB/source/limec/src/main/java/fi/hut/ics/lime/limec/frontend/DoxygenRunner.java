/**
 * This class is responsible for running the third-party Doxygen tool so
 * it generates XML representations of C source files. In other parts
 * of the program, we read the XML, convert it into a representation of
 * the program and then create aspect(s) from the representation.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.frontend;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import fi.hut.ics.lime.limec.Settings;

public class DoxygenRunner {

	public DoxygenRunner() {
		
	}
	
	/**
	 * Runs the Doxygen document generator in the path indicated by the File
	 * pathToUse. When run, Doxygen generates XML files representing the
	 * structure of the C source files in the directory specified by
	 * pathToUse.
	 * 
	 * @param pathToUse a directory indicating the path to run Doxygen in
	 */
	public void run(File pathToUse) throws IOException {
		
		if (Settings.isVerbose()) {
			System.out.print("Running doxygen on " + pathToUse.getAbsolutePath() + 
						 " ... ");
		}
		
		if (!pathToUse.exists()) {
			throw new IOException("ERROR: Directory " + 
								  pathToUse.getAbsolutePath() +
							   	  " doesn't exist.");
		} else if(!pathToUse.isDirectory()) {
			throw new IOException("ERROR: " + pathToUse.getAbsolutePath() +
							   	  " is not a directory. Please give a " +
							   	  "directory name rather than a file name.");
		}
		
		Runtime rt = Runtime.getRuntime();
			
		// Read the Doxygen config file from the JAR and output it to our
		// temporary directory
		BufferedInputStream bis = new BufferedInputStream(
				getClass().getResourceAsStream("/fi/hut/ics/lime/limec/frontend/Doxyfile"));
		
		File output = new File(pathToUse.getCanonicalPath() + File.separator +
							   "Doxyfile");
						
		BufferedOutputStream bos = new BufferedOutputStream(
				new FileOutputStream(output));
			
		byte[] b = new byte[bis.available()];
		bis.read(b);
		bos.write(b, 0, b.length);
		bis.close();
		bos.close();
		
		String[] appNameAndParam = new String[]{"doxygen", output.getCanonicalPath()};
		Process doxygen = rt.exec(appNameAndParam, null, pathToUse);
		
		try {
			doxygen.waitFor();
		} catch (InterruptedException ie) { 
			// do nothing
		}
		
		if (Settings.isVerbose()) {
			System.out.println("Done.");
		}
	
	}

}
