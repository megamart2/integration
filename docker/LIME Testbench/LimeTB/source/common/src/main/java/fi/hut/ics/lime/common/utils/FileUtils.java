/**
 * Generic utility functions related to files.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.common.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class FileUtils {

	/**
	 * Copy a single File source into the destination specified by target.
	 * 
	 * <p>If source represents a directory, non-recursively (does not copy
	 * subdirectories) copies all files from source to target. Target must
	 * represent an existing directory.  
	 * 
	 * <p>If source represents a single file, copies it into the destination
	 * specified by target. If target represents an existing directory, the 
	 * file will be copied to it. Otherwise, target is interpreted to 
	 * represent a file. Any pre-existing file with the same name is deleted
	 * before the copy.  
	 * 
	 * @param source a File object representing a file or a directory to copy
	 * @param target a File object representing the target location of the copy
	 * @throws IOException
	 */
	public static void copy(File source, File target) throws IOException {
		
		if (source.isFile()) {
			copyFile(source, target);
		} else if (source.isDirectory()) {
			copyDir(source, target);
		} else {
			throw new IOException("ERROR: Source of copy operation " +
								  "(" + source.getCanonicalPath() + ") " +
								  "does not represent an existing file or " +
								  "directory.");
		}
		
	}
	
	/**
	 * Copies all files with the extension specified in 'extension' from the
	 * directory sourceDir to the directory targetDir. If targetDir does not
	 * exist, it is created.
	 * 
	 * <p>The operation is non-recursive (i.e. files inside subdirectories
	 * will not be copied).
	 * 
	 * @param sourceDir The directory to copy files from
	 * @param targetDir The directory to copy files to
	 * @param extension The extension of the files to copy, without the dot
	 * 					(e.g. to copy all files ending in ".c", pass "c"
	 * @throws IOException
	 */
	public static void copyByExtension(File sourceDir, File targetDir, 
									   String extension) throws IOException {
		
		if (!sourceDir.isDirectory()) {
			throw new IOException("ERROR: Source of copy operation " + 
								  "(" + sourceDir.getCanonicalPath() + ") " +
								  "does not represent an existing directory.");
		}
		if (!targetDir.isDirectory()) {
			// Create directories; throw exception on failure
			if (!targetDir.mkdirs()) {
				throw new IOException("ERROR: Unable to create directory " +
									  "(" + targetDir.getCanonicalPath() + ").");
			}
		}
			
		for(File source : sourceDir.listFiles()) {
			if (source.isFile() && source.getName().endsWith("."+extension)) {  
				copyFile(source, targetDir);
			}
		}
		
	}
	
	/** 
	 * Copy a single file sourceFile into the destination specified by
	 * target. In addition to being a File object, sourceFile must
	 * represent an existing file, not a directory. 
	 * 
	 * If target refers to a non-existing file, it will be created. If the
	 * file exists, it is emptied. If target refers to a directory, the 
	 * sourceFile will be copied into the directory using the original
	 * filename.   
	 * 
	 * @param sourceFile the file to be copied
	 * @param target     the location of the new copy
	 * @throws IOException
	 */
	private static void copyFile(File source, File target) throws IOException {
		
		assert source.isFile() : "sourceFile does not exist or is not a file.";
		
		if (target.isDirectory()) {
			target = new File(target.getCanonicalPath()+File.separator+source.getName());
		}
		
		// target should now represent an existing or a non-existing file
		if (!target.createNewFile() && 
				!(target.delete() && target.createNewFile())) {
			// Could not create file or delete existing one
			throw new IOException("ERROR: Unable to create "+
								  target.getCanonicalPath());
		}
		
		assert target.isFile() : "target does not exist or is not a file";
		
		FileChannel sourceChannel = new FileInputStream(source).getChannel();
		FileChannel targetChannel = new FileOutputStream(target).getChannel();
		sourceChannel.transferTo(0, sourceChannel.size(), targetChannel);
		sourceChannel.close();
		targetChannel.close();

	}
	
	/** 
	 * Recursively copies all the files from sourceDir to targetDir.
	 *  
	 * @param sourceDir the directory to copy files from
	 * @param targetDir the directory to copy files to
	 * @throws IOException
	 */
	private static void copyDir(File sourceDir, File targetDir) throws IOException { 
	
		assert sourceDir.isDirectory() : "sourceDir does not exist or is " +
										 "not a directory.";
	
		assert targetDir.isDirectory() : "targetDir does not exist or is " +
										 "not a directory.";
		
		for(File source : sourceDir.listFiles()) {
			if (source.isFile()) {  
				copyFile(source, targetDir);
			}
			else if (source.isDirectory()) {
				// create a new directory under target with the same new and call the
				// procedure recursively
				File subdir = new File(targetDir.getCanonicalPath()+File.separator+source.getName());
				if (!subdir.mkdirs()) {
					throw new IOException("ERROR: Unable to create "+
										  subdir.getCanonicalPath());
				}
				copyDir(source, subdir);
			}
		}		
	}
	
	/**
	 * Reads a file and returns its contents in a String.
	 * 
	 * @param toRead the file to read
	 * @return a String representing the contents of the file
	 */
	public static String readFile(File toRead) throws IOException {
		
		if (!toRead.isFile() || !toRead.canRead()) {
			throw new IOException("ERROR: File " + 
					toRead.getCanonicalPath() + " does not exist " +
					"or unable to read it.");
		}
		
		StringBuilder contents = new StringBuilder();
		
		try {
			BufferedReader input = new BufferedReader(new FileReader(toRead));
			
			try {
				// Read file line by line
				String line = null;
		        while ((line = input.readLine()) != null){
		            contents.append(line);
		            contents.append(System.getProperty("line.separator"));
		        }
			} finally {
				input.close();
			}	
		} catch (IOException ioe) {
			throw ioe;
		}
	
		return contents.toString();
		
	}
	
	/**
	 * Creates a file with the name toWrite and writes whatever is
	 * contained in contents to it. If a file with the same path and
	 * name as toWrite already exists, that file is deleted before
	 * new content is written.
	 * 
	 * @param toWrite A File object specifying the name of the file to
	 * 		  create and the path to the directory this new file should
	 * 		  be placed in
	 * @param contents a String containing whatever 
	 * 		  should be written to the newly created file
	 * 
	 * @throws IOException if unable to create the file toWrite, delete
	 * a previous file with the same name or unable to write everything
	 * in contents to the new file
	 */
	public static void writeFile(File toWrite, String contents) throws IOException {
		
		if (toWrite.isDirectory()) {
			throw new IOException("ERROR: Expected a file to write content " +
								  "to but received a directory (" +
								  toWrite.getCanonicalPath() + ")");
		}

		// File exists; delete it or throw exception if unsuccessful 
		if(toWrite.isFile() && !toWrite.delete()) {
			throw new IOException("Unable to delete the file " + 
								  toWrite.getCanonicalPath() + ".");
		}
		
		// Create the file
		if(!toWrite.createNewFile()) {
			throw new IOException("Unable to create the file " +
								  toWrite.getCanonicalPath() + ".");
		}
		
		// Write contents to file; close file.
		BufferedWriter output = new BufferedWriter(new FileWriter(toWrite));
		
		try {
			output.write(contents);
		} finally {
			output.close();
		}
		
	}

	/**
	 * Recursively deletes the contents of the directory 'directory'.
	 * 
	 * @param directory the directory (and all its subdirectories) to
	 * 	      delete
	 */
	public static void deleteDirectory(File directory) throws IOException {
		
		for (File file : directory.listFiles()) {
		
			if (file.isFile() && !file.delete()) {
					throw new IOException("Unable to delete file " +
							   			  file.getCanonicalPath());
			} else if(file.isDirectory()) {
				deleteDirectory(file);
			}
		
		}
		
		if (!directory.delete()) {
			throw new IOException("Unable to delete directory " +
					   			  directory.getCanonicalPath());
		}
		
	}
	
}
