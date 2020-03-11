package fi.hut.ics.lime.common.aspect;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.utils.FileUtils;

/**
 * A singleton class to write aspects to a .aj file 
 * @author sliedes lharpf
 */
public class AspectWriter {
	
	private static class AspectWriterHolder {
		private static final AspectWriter INSTANCE = new AspectWriter();
	}
	
	public static AspectWriter getInstance() {
		return AspectWriterHolder.INSTANCE;
	}

	/**
	 * Write the given aspects into files with the extension 'extension'. 
	 * 
	 * @param aspects aspects to write
	 * @param targetDir the output directory for the aspects
	 * @param extension the extension used for the aspect file, without the 
	 * 		  leading dot. E.g. to write as '.aj' file, pass 'aj'
	 * @throws IOException on I/O error
	 */
	public void writeAspects(Collection<Aspect> aspects, File targetDir,
							 String extension) throws IOException {
		
		for (Aspect a : aspects) {
			String filename = makeSubDirectories(a, targetDir).getCanonicalPath() + 
							  File.separator + a.getName() + "." + extension;
			FileUtils.writeFile(new File(filename), a.toString());
		}
	}
	
	/**
	 * Creates subdirectories in the target directory for the aspect file,
	 * if any are necessary. In Java, the aspect is placed in a subdirectory
	 * under targetDir. The default implementation, used in C, is to place 
	 * all aspects in targetDir. 
	 * 
	 * @param aspect The aspect to create subdirectories for 
	 * @param targetDir The directory under which the subdirs are created
	 * @return a File object pointing the final destination directory for the 
	 * 		   aspect 
	 */
	protected File makeSubDirectories(Aspect aspect, File targetDir) {
		return targetDir;
	}

}

