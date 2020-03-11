package fi.hut.ics.lime.aspectmonitor.aspect;

import java.io.File;

import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.AspectWriter;

/**
 * A singleton class to write aspects to a file 
 * @author sliedes
 */
public class JAspectWriter extends AspectWriter {
	private final static JAspectWriter instance = new JAspectWriter();
	
	private JAspectWriter() {}
	
	/**
	 * Get the instance of this singleton.
	 * @return
	 */
	public static AspectWriter instance() {
		return instance;
	}
	
	/**
	 * Creates subdirectories in the target directory for the aspect file,
	 * if any are necessary. In Java, the aspect is placed in a subdirectory
	 * under targetDir.
	 *  
	 * <p>The subdirectory is determined by the name of the package 
	 * corresponding to the aspect; for example, the package 
	 * fi.hut.ics.lime.common.aspect corresponds to the directory
	 * targetDir/fi/hut/ics/lime/common/aspect
	 * 
	 * @param aspect The aspect to create subdirectories for 
	 * @param targetDir The directory under which the subdirs are created
	 * @return a File object pointing the final destination directory for the 
	 * 		   aspect 
	 */
	@Override
	protected File makeSubDirectories(Aspect aspect, File targetDir) {
		
		String qname = ((AspectJAspect)aspect).getCtPackage().getQualifiedName();
		String path = qname.replace(".", File.separator);
		
		File finalPath = new File(targetDir+File.separator+path);
		finalPath.mkdirs();
		
		return finalPath;
		
	}


}
