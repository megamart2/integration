/**
 * This class is responsible for running the third-party Doxygen tool so
 * it generates XML representations of C source files. In other parts
 * of the program, we read the XML, convert it into a representation of
 * the program and then create aspect(s) from the representation.
 * 
 * @author lharpf, jkauttio
 */
package fi.hut.ics.lime.limec;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import fi.hut.ics.lime.common.utils.Debug;

public class DoxygenRunner {
	
	private static class DoxygenRunnerHolder {
		private static final DoxygenRunner INSTANCE = new DoxygenRunner();
	}
	
	public static DoxygenRunner getInstance() {
		return DoxygenRunnerHolder.INSTANCE;
	}
	
	/**
	 * Runs Doxygen in the given directory, generating the xml files describing
	 * the structure of the program.
	 * 
	 * @param workingdir a directory to run Doxygen in
	 */
	public void run(File workingdir) throws IOException {
		
		if (!workingdir.exists()) {
			throw new IOException("ERROR: Directory '" + 
								  workingdir.getAbsolutePath() +
							   	  "' doesn't exist.");
		} 
		else if(!workingdir.isDirectory()) {
			throw new IOException("ERROR: '" + 
								  workingdir.getAbsolutePath() +
							   	  "' is not a directory.");
		}
			
		// copy the doxyfile from the jar file to the working directory
		// (hardcoding the path is not necessarily a good idea)
		BufferedInputStream bis = new BufferedInputStream(
				this.getClass().getResourceAsStream("/fi/hut/ics/lime/limec/Doxyfile"));
		
		File output = new File(workingdir.getCanonicalPath() + File.separator +
							   "Doxyfile");
						
		BufferedOutputStream bos = new BufferedOutputStream(
				new FileOutputStream(output));
		
		byte[] b = new byte[bis.available()];
		bis.read(b, 0, b.length);
		bos.write(b, 0, b.length);
		bis.close();
		bos.close();
		
		String[] command = new String[]{"doxygen", output.getCanonicalPath()};
		Process doxygen = Runtime.getRuntime().exec(command, null, workingdir);
		
		try {
			doxygen.waitFor();
		} catch (InterruptedException ie) { 
			Debug.println("doxygen was interrupted");
		}
	}

}
