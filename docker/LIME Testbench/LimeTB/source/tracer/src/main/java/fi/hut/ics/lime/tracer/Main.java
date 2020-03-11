package fi.hut.ics.lime.tracer;

import java.util.ArrayList;
import java.util.regex.*;
import java.io.*;

public class Main {

	private static final String USAGE = "limt tracing utility 0.0.1:\n\n" +
		"usage: tracer <path_to_logfile> [options]\n\n" +
		"supported options are:\n" +
		"    -h                 this help information\n" +
		"    -v                 more verbose output (print the value of each\n" +
		"                       proposition when observer state is updated)\n" +
		"    -vv                even more verbose output (print stacktrace when\n" +
		"                       a method is observed)\n" +
		"    -i                 print summary about specifications and observers\n" +
		"    -n                 don't indent different observer instances\n" +
		"    -wsSpec1,Spec2,... only print output about listed specifications\n" +
		"    -woObs1,Obs2,...   only print output about listed observers\n";
	private static final String ARGUMENT_FAIL = "unknown option: ";
	private static final String FILE_FAIL = "logfile not specified or not found";
	
	public static void main(String[] args) {
		
		File logfile = null;
		int verbosity = 1;
		boolean onlyinfo = false;
		boolean noindent = false;
		ArrayList<String> ws = new ArrayList<String>();
		ArrayList<String> wo = new ArrayList<String>();

		// parse commandline
		if (args.length < 1) {
			System.out.println(USAGE);
			System.exit(0);
		}

		for (int i = 0; i < args.length; i++) {
			if (args[i].equals("-h")) {
				System.out.println(USAGE);
				System.exit(0);
			}
			else if (args[i].equals("-v")) {
				verbosity = 2;
			}
			else if (args[i].equals("-vv")) {
				verbosity = 3;
			}
			else if (args[i].equals("-i")) {
				onlyinfo = true;
			}
			else if (args[i].equals("-n")) {
				noindent = true;
			}
			else if (args[i].startsWith("-ws")) {
				String[] tmp = args[i].substring(3).split(",");
				for (int j = 0; j < tmp.length; j++) {
					ws.add(tmp[j]);
				}
			}
			else if (args[i].startsWith("-wo")) {
				String[] tmp = args[i].substring(3).split(",");
				for (int j = 0; j < tmp.length; j++) {
					wo.add(tmp[j]);
				}
			}
			else if (logfile == null) {
				logfile = new File(args[i]);
			}
			else {
				System.err.println(ARGUMENT_FAIL+args[i]);
				System.exit(1);
			}

		}

		if (logfile == null || !logfile.exists()) {
			System.err.println(FILE_FAIL);
			System.exit(1);
		}

		LogFile log = new LogFile(logfile, verbosity, ws, wo, noindent);
		
		if (onlyinfo) {
			log.printInfo();
		}
		else {
			log.print();
		}


		System.exit(0);
	}

}
