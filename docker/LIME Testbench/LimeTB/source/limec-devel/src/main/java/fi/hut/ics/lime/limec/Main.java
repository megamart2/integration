package fi.hut.ics.lime.limec;

import java.io.File;

import fi.hut.ics.lime.common.utils.Debug;
import fi.hut.ics.lime.limec.Runner;

public class Main {
	
	private static final String TMPDIRNAME = "limec_tmp";
	private static final String HEADERNAME = "lime.h";
	
	private static final String USAGE = 
		"LIME-C monitoring tool 1.0.0\n" +
		"Main [options] <source_directory>\n" +
		"supported options are:\n" +
		"    -h, -help Print this help information.\n" +
		"    -debug               Enable more verbose output giving more insight on\n" +
		"                         what limec is doing.\n" +
		"    -shortmsg            Replace normal error messages with shorter ones\n" +
		"                         (if excessive printing is undesired).\n" +
		"    -tmp <tmp_directory> Set the temporary directory for limec (default is\n" +
		"                         '"+TMPDIRNAME+"').\n" +
		"    -exite <number>      Set the exit code to be used if an error\n" +
		"                         (inapropriate use of aspects) is encountered and\n" +
		"                         you wish the program to terminate.\n" +
		"    -exitv <number>      Set the exit code to be used if an\n" +
		"                         specification violation is encountered and\n" +
		"                         you wish the program to terminate.\n" +
		"    -olimit <number>     Set the maximum number of observer instances for\n" +
		"                         one specification if dynamic memory allocation\n" +
		"                         is undesired.\n";
		
	
	private static void exitWithUsage() {
		System.err.print(USAGE);
		System.exit(1);
	}
	
	private static void exitWithError(String error) {
		System.err.println(error);
		System.exit(1);
	}
	
	public static void main (String[] args) {
		
		File sourcedir = null;
		File tmpdir = null;
		String tmpdirname = TMPDIRNAME;
		
		// some simple argument processing
		if (args.length < 1) {
			exitWithUsage();
		}
		
		for (int i = 0; i < args.length; i++) {
			String arg = args[i];
			if (arg.equals("-h") || arg.equals("-help")) {
				exitWithUsage();
			}
			else if (arg.equals("-debug")) {
				// set debug messages on
				Debug.enable();
			}
			else if (arg.equals("-tmp")) {
				// set tmpdir
				if (++i >= args.length) {
					exitWithError("Tmp directory name not specified.");
				}
				tmpdirname = args[i];
			}
			else if (arg.equals("-exite")) {
				if (++i >= args.length) {
					exitWithError("Error exit code not specified.");
				}
				try {
					int tmp = Integer.parseInt(args[i]);
					if (tmp > 0)
						CUtils.errorexit = tmp;
					else
						exitWithError("Error exit code should be > 0.");
				}
				catch (NumberFormatException e) {
					exitWithError("Couldn't set error exit code '"+args[i]+"'.");
				}
			}
			else if (arg.equals("-exitv")) {
				if (++i >= args.length) {
					exitWithError("Violation exit code not specified.");
				}
				try {
					int tmp = Integer.parseInt(args[i]);
					if (tmp > 0)
						CUtils.violationexit = tmp;
					else
						exitWithError("Violation exit code should be > 0.");
				}
				catch (NumberFormatException e) {
					exitWithError("Couldn't set violation exit code '"+args[i]+"'.");
				}
			}
			else if (arg.equals("-olimit")) {
				if (++i >= args.length) {
					exitWithError("Please give a limit after -olimit.");
				}
				try {
					int limit = Integer.parseInt(args[i]);
					if (limit > 0)
						CUtils.obslimit = limit;
					else
						exitWithError("limit '"+limit+"' should be > 0.");
				}
				catch (NumberFormatException e) {
					exitWithError("Limit '"+args[i]+" is not an integer.");
				}
			}
			else if (sourcedir == null) {
				sourcedir = new File(args[i]);
			}
			else {
				exitWithError("Unknown parameter: "+arg);
			}
		}
		
		// sanity checks
		
		if (sourcedir == null) {
			exitWithError("Source directory not specified.");
		}
		else if (!sourcedir.exists() || !sourcedir.isDirectory()) {
			exitWithError("Specified source directory '"+sourcedir.getAbsolutePath()+"' doesn't exist or is not a directory.");
		}
		
		// make sure the header file exists in the source directory
		
		if (!(new File(sourcedir.getAbsolutePath()+File.separator+HEADERNAME).exists())) {
			exitWithError("Lime header file '"+HEADERNAME+"' not found inside source directory '"+sourcedir.getAbsolutePath()+"'.");
		}
		
		tmpdir = new File(sourcedir.getAbsolutePath()+File.separator+tmpdirname);
		
		Runner runner = new Runner(sourcedir, tmpdir);
		
		try {
			runner.run();
		}
		catch (Exception e) {
			System.err.println("An exception occured while processing the sources:\n"+e);
			System.exit(1);	
		}
		
		System.exit(0);
		
	}
	
}