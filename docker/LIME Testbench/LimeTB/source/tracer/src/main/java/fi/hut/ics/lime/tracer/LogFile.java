package fi.hut.ics.lime.tracer;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.regex.*;
import java.io.*;

public class LogFile {

	private HashMap<String, Observer> observers;
	private File logfile;
	private boolean noindent;
	private int currentindent;
	private int verbosity;
	private ArrayList<String> watchedspecs;
	private ArrayList<String> watchedobjects;

	private static final String JAVA_IDENTIFIER = 
		"\\p{javaJavaIdentifierStart}\\p{javaJavaIdentifierPart}*";

	// the general message pattern, every log message should match this
	private Pattern message = Pattern.compile("([0-9]+) ("+JAVA_IDENTIFIER+") " +
		"([a-f0-9]+) (around|spec|prop|values|exception|stacktrace) ?+(.*)");
	// used to parse the specification string
	private Pattern spec = Pattern.compile("(CALL|RETURN) (.*)$");
	// used to parse a proposition string
	private Pattern prop = Pattern.compile("([0-9]+) " +
		"(NAMED|VALUE|CALL|EXCEPTION) (.*)$");
	// used to parse a proposition value
	private Pattern values = Pattern.compile("([0-9]+) (true|false)");
	
	public LogFile(File logfile, int verbosity, 
		ArrayList<String> ws, ArrayList<String> wo, boolean noindent) {
		this.observers = new HashMap<String, Observer>();
		this.logfile = logfile;
		this.noindent = noindent;
		this.currentindent = 0;
		this.verbosity = verbosity;
		this.watchedspecs = ws;
		this.watchedobjects = wo;
	}

	public void printInfo() {
		// parse logfile without printing
		this.verbosity = 0;
		parseLog();
		HashMap<String, ArrayList<String>> tmpspecs = 
			new HashMap<String, ArrayList<String>>();
		// collect data about specs and observers
		for (Observer i : this.observers.values()) {
			ArrayList<String> tmpobjects = tmpspecs.get(i.specname);
			if (tmpobjects == null) {
				tmpobjects = new ArrayList<String>();
				tmpspecs.put(i.specname, tmpobjects);
			}
			tmpobjects.add(i.object);
		}
		// print collected data
		System.out.println("Printing information about specifications " +
			"and associated observer instances:");
		for (String i : tmpspecs.keySet()) {
			System.out.println("observer instances for specification "+i+":");
			for (String j : tmpspecs.get(i)) {
				System.out.print("  observer id: "+j);
				if (this.observers.get(i+j).exception) {
					System.out.print(" (exception occured here)");
				}
				System.out.print("\n");
			}
		}
	}

	public void print() {
		//System.out.println("--log output start--");
		parseLog();
		//System.out.println("---log output end---");
	}

	private void parseLog() {
		try {
			BufferedReader filereader = 
				new BufferedReader(new FileReader(this.logfile));
			// reset this.observers
			this.observers = new HashMap<String, Observer>();
			String line = "";
			while ((line = filereader.readLine()) != null) {
				process(line);
			}
			filereader.close();
		}
		catch (Exception e) {
			System.err.println("Couldn't read log file '" +
				this.logfile.getAbsolutePath()+"': "+e);
			System.exit(1);
		}
	}
	
	private void process(String line) {
		// skip comments
		if (line.startsWith("#")) {
			return;
		}

		//System.out.println("reading: "+line);
		Matcher matcher = this.message.matcher(line);
		if (!matcher.matches()) {
			System.err.println("Malformed input in log file '" +
				this.logfile.getAbsolutePath()+"'.");
			System.exit(1);
		}
		String timestr = matcher.group(1);
		String specnamestr = matcher.group(2);
		String objectstr = matcher.group(3);
		String keywordstr = matcher.group(4);
		String datastr = matcher.group(5);
		
		Observer observer = this.observers.get(specnamestr+objectstr);
		if (observer == null) {
			observer = new Observer(specnamestr, objectstr);
			// check if the observer needs to print or not
			if (this.verbosity >= 1 && ((this.watchedspecs.size() == 0 
				&& this.watchedobjects.size() == 0) 
				|| this.watchedspecs.contains(specnamestr) 
				|| this.watchedobjects.contains(objectstr))) {
				observer.verbosity = this.verbosity;
				observer.indent = this.currentindent;
				if (!this.noindent) {
					this.currentindent = this.currentindent + 2;
				}
			}
			observer.printCreation();
			this.observers.put(specnamestr+objectstr, observer);
		}

		if (keywordstr.equals("spec")) {
			matcher = this.spec.matcher(datastr);
			matcher.matches();
			observer.spectype = matcher.group(1);
			observer.spec = matcher.group(2);
			observer.printSpec();
		}
		else if (keywordstr.equals("prop")) {
			matcher = this.prop.matcher(datastr);
			matcher.matches();
			observer.addProposition(Integer.parseInt(matcher.group(1)), 
				new Proposition(matcher.group(3), matcher.group(2)));
		}
		else if (keywordstr.equals("around")) {
			observer.printAround(datastr);
		}
		else if (keywordstr.equals("values")) {
			matcher = this.values.matcher(datastr);
			while(matcher.find()) {
				observer.printValue(Integer.parseInt(matcher.group(1)), 
					matcher.group(2));
			}
		}
		else if (keywordstr.equals("exception")) {
			observer.exception = true;
			observer.printException();
		}
		else if (keywordstr.equals("stacktrace")) {
			observer.printSTrace(datastr);
		}
		else {
			// this really shouldn't happen but let's be safe
			// anyways
			System.err.println("Unknown keyword encountered '" + 
				keywordstr+"'.");
			System.exit(1);
		}
		
	}


	private class Observer {
		private int indent;
		private int verbosity;
		private String specname;
		private String object;
		private String spectype;
		private String spec;
		private ArrayList<Proposition> props;
		private boolean exception;

		private Observer(String specname, String object) {
			this.indent = 0;
			this.verbosity = 0;
			this.specname = specname;
			this.object = object;
			this.spectype = "not_known_yet";
			this.spec = "not_known_yet";
			this.props = new ArrayList<Proposition>();
			this.exception = false;
		}

		private void addProposition(int index, Proposition proposition) {
			if (index != this.props.size()) {
				System.err.println("Propositions for " +
					specname+" added out of order.");
				System.exit(1);
			}
			this.props.add(proposition);
		}

		private void printCreation() {
			printIndent("new observer ("+this.object +
				") created for specification: "+this.specname);
		}

		private void printSpec() {
			if (this.verbosity >= 2) {
				printIndent("("+this.spectype+")specification " +
					this.specname+" string: "+this.spec);
			}
		}

		private void printAround(String method) {
			String output = "call to '"+method+"', updating state";
			if (this.verbosity >= 3) {
				output += ", stacktrace:";
			}
			printIndent(output);
		}

		private void printValue(int index, String value) {
			if (this.verbosity >= 2) {
				printIndent("("+this.props.get(index).type +
					")proposition"+index+" (" +
					this.props.get(index).proposition +
					") evaluated to: "+value);
			}
		}

		private void printException() {
			printIndent("exception occured");
		}

		private void printSTrace(String tracestring) {
			if (this.verbosity >= 3) {
				printIndent("  "+tracestring);
			}
		}

		private void printIndent(String output) {
			if (this.verbosity < 1)
				return;
			for (int i = 0; i < this.indent; i++) {
				System.out.print(" ");
			}
			System.out.print("["+this.specname+"/"+this.object+"] ");
			System.out.print(output+"\n");
		}

	}

	private class Proposition {
		private String proposition;
		private String type;

		private Proposition(String proposition, String type) {
			this.proposition = proposition;
			this.type = type;
		}

	}

}
