package fi.hut.ics.lime.aspectmonitor;

import java.io.*;
import java.util.HashMap;
import java.util.regex.*;

public class LogWriter {
	
	private static final String LOGFILENAME = "runlog";
	
	private HashMap<String, Observer> observers;
	private boolean writelog;
	private String logpath;
	private BufferedWriter log;
	private Pattern aspectjtrace = Pattern.compile("(?:.*\\((?:CALL|RETURN)Specification[A-Za-z0-9_]*\\.aj:?[0-9]*\\)$|.*AjcClosure.*|.*aroundBody.*)");
		
	private LogWriter() {
		this.observers = new HashMap<String, Observer>();
		this.writelog = true;
		// we can't initialize the writer here since we don't know where to
		// store the log file yet
		this.logpath = null;
		this.log = null;
	}
	
	private static class LogWriterHolder {
		private static final LogWriter INSTANCE = new LogWriter();
	}
	
	public static LogWriter getInstance() {
		return LogWriterHolder.INSTANCE;
	}
	
	private void write(Observer observer, String message) {
		try {
			this.log.write(System.currentTimeMillis()+" "+observer.name+" "+observer.objectid+" "+message+"\n");
			this.log.flush();
		}
		catch (Exception e) {
			// this usually shouldn't happen since we already wrote to the
			// file when creating it
			System.err.println("Failed to write to log file: "+e);
			System.exit(1);
		}
	}
	
	public void initMessage(String id, String path, String specname, String spectype, String spec, String[] props, String[] proptypes) {
		if (!this.writelog) {
			// if we don't want to log, just don't do anything
			return;
		}
		
		// set the new default log file path if it hasn't been set yet
		// (all initmessages will have (redundant) information about the file path,
		// but since there's no way to know which one will be called first at
		// compile time, this is necessary)
		if (this.logpath == null) {
			this.logpath = path;
		}
		
		// create the logfile now that we know where to store it (providing 
		// it's not created yet)
		if (this.log == null) {
			File logfile = new File(path+File.separator+LOGFILENAME);
			try {
				if (logfile.exists()) {
					// if the file exists already, delete it first
					logfile.delete();
				}
				logfile.createNewFile();
				this.log = new BufferedWriter(new FileWriter(logfile));
				this.log.write("# log created at "+System.currentTimeMillis()+"\n");
				this.log.flush();
			}
			catch (Exception e) {
				System.err.println("Log file '"+logfile.getAbsolutePath()+"' could not be created or written to: "+e);
				System.err.println("Continuing without logging.");
				this.writelog = false;
			}
		}
		
		if (this.observers.get(id) != null) {
			// observer already created
			System.err.println("ERROR: Observer for '"+id+"' already created, multiple initMessage() calls in aspect.");
			System.exit(1);
		}
		
		// parse the object id from the identifier string (it's the last hex
		// value after '@')
		String objectid = id.split("@")[id.split("@").length - 1];
		Observer current = new Observer(specname, objectid);
		this.observers.put(id, current);
		write(current, "spec "+spectype+" "+spec);
		for (int i = 0; i < props.length; i++) {
			write(current, "prop "+i+" "+proptypes[i]+" "+props[i]);
		}
	}
	
	public void aroundMessage(String id, String methodname) {
		if (!this.writelog) {
			// if we don't want to log, just don't do anything
			return;
		}
		Observer current = this.observers.get(id);
		if (current == null) {
			// observer not initialized yet
			System.err.println("ERROR: Observer for '"+id+"' not found, missing initMessage() call from aspect.");
			System.exit(1);
		}
		write(current, "around "+methodname);
		writeParsedStackTrace(current);
	}
	
	public void updateMessage(String id, boolean[] propvalues) {
		if (!this.writelog) {
			// if we don't want to log, just don't do anything
			return;
		}
		Observer current = this.observers.get(id);
		if (current == null) {
			// observer not initialized yet
			System.err.println("ERROR: Observer for '"+id+"' not found, missing initMessage() call from aspect.");
			System.exit(1);
		}
		String values = "values";
		for (int i = 0; i < propvalues.length; i++) {
			values += " "+i+" "+propvalues[i];
		}
		write(current, values);
	}
	
	public void errorMessage(String id) {
		if (!this.writelog) {
			// if we don't want to log, just don't do anything
			return;
		}
		Observer current = this.observers.get(id);
		if (current == null) {
			// observer not initialized yet
			System.err.println("ERROR: Observer for '"+id+"' not found, missing initMessage() call from aspect.");
			System.exit(1);
		}
		write(current, "exception");
	}
	
	private void writeParsedStackTrace(Observer observer) {
		// we can start parsing from the fourth line since the first three are
		// from this logwriter
		StackTraceElement[] trace = Thread.currentThread().getStackTrace();
		for (int i = 3; i < trace.length; i++) {
			// output the line if it isn't from the aspect side
			Matcher ajmatcher = aspectjtrace.matcher(trace[i].toString());
			if (!ajmatcher.matches()) {
				write(observer, "stacktrace "+trace[i]);
			}
		}
	}
	
	// this class just stores the specification name and object id of this
	// observer instance
	private class Observer {
		
		private String name;
		private String objectid;
		
		private Observer(String name, String objectid) {
			this.name = name;
			this.objectid = objectid;
		}
		
	}

}
