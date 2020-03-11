/**
 * Runs at the end of execution; the aspect(s) have been created and placed
 * into the same directory with the original C source files. The backend
 * 
 * - Cleans up after the fi.hut.ics.lime.isl_c tool; i.e. it removes the
 *   temporary directory created by the 
 *   fi.hut.ics.lime.isl_c.frontend.FrontEnd class
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.isl_c.backend;

import java.io.File;
import java.io.IOException;

import fi.hut.ics.lime.common.utils.FileUtils;
import fi.hut.ics.lime.isl_c.frontend.FrontEnd;

public class BackEnd {

	private final FrontEnd frontEnd;
	
	public BackEnd(FrontEnd frontEnd) {
		this.frontEnd = frontEnd;
	}
	
	/**
	 * Deletes the temporary directory created by the FrontEnd frontEnd.
	 */
	public void cleanUp() {
		File tmpDirectory = this.frontEnd.getTemporaryDirectory();
		
		try {
			FileUtils.deleteDirectory(tmpDirectory);
		} catch (IOException ioe) {
			System.out.print("ERROR: While deleting temporary directory " +
							 tmpDirectory.getAbsolutePath() + ":\n" + 
							 ioe.getMessage());
		}
	
	}
	
}
