package fi.hut.ics.lime.aspectmonitor;

import java.io.File;
import spoon.Launcher;
import fi.hut.ics.lime.aspectmonitor.LogUtility;

public class SpoonRunner {
	
	private static final String USAGE = "LIME Spoon Runner version 0.0.1\n\n" +
			"SpoonRunner <path_to_source_directory> [options]\n\n" +
			"supported options are:\n" +
			"    -h                     For this help information.\n" +
			"    -nolog                 For disabling writing to the log file\n" +
			"                           completely.\n" +
			"    -spec <list,of,specs>  For listing specifications that will\n" +
			"                           write to the log file.\n";
	private static final String SPOON_DIR = "spoon";
	
	public static void main(String[] args) {
		String inputdir = null;
		String outputdir = null;
		
		if (args.length < 1) {
			exitWithUsage();
		}
		
		for (int i = 0; i < args.length; i++) {
			if (args[i].equals("-h")) {
				exitWithUsage();
			}
			else if (args[i].equals("-nolog")) {
				LogUtility.getInstance().disableLogging();
			}
			else if (args[i].equals("-spec")) {
				if (++i >= args.length) {
					exitWithError("Couldn't find specification list after -spec.");
				}
				String[] specs = args[i].split(",");
				for (int j = 0; j < specs.length; j++) {
					LogUtility.getInstance().watchSpec(specs[j]);
				}
			}
			else if (inputdir == null) {
				inputdir = args[i];
				outputdir = inputdir+File.separator+SPOON_DIR;
			}
			else {
				exitWithError("Unkown parameter: "+args[i]);
			}
		}
		
		if (inputdir == null || !(new File(inputdir).exists())) {
			exitWithError("Source directory not specified or doesn't exist.");
		}
		
		String[] spoonparams= new String[6];
		spoonparams[0] = "-p";
		spoonparams[1] = "fi.hut.ics.lime.aspectmonitor.SpecProcessor";
		spoonparams[2] = "-i";
		spoonparams[3] = inputdir;
		spoonparams[4] = "-o";
		spoonparams[5] = outputdir;
		
		try {
			new Launcher(spoonparams).run();
		}
		catch (Exception e) {
			exitWithError("Spoon execution ended in an exception: "+e);
		}
	}
	
	private static void exitWithUsage() {
		System.err.print(USAGE);
		System.exit(1);
	}
	
	private static void exitWithError(String error) {
		System.err.println(error);
		System.exit(1);
	}

}
