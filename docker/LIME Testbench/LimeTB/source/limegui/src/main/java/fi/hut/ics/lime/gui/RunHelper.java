package fi.hut.ics.lime.gui;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.awt.Point;
import java.awt.event.KeyEvent;

import javax.swing.Action;
import javax.swing.JTextArea;
import javax.swing.JLabel;


public class RunHelper {
	
	public enum Windowname {
		LCT_SERVER ("LCT Server", 30, 30),
		LCT_OUTPUT ("LCT Output", 60, 60),
		LJUT ("Test code generation", 90, 90);
		
		private String title;
		private int xpos;
		private int ypos;
		Windowname(String title, int x, int y) {
			this.title = title;
			this.xpos = x;
			this.ypos = y;
		}		
		public String title() { return title; }
		public int xpos() { return xpos; }
		public int ypos() { return ypos; }
	}
	
	private ArrayList<Action> critactions;
	private JTextArea log;
	private JLabel status;
	private String statuslocation;
	private HashMap<Windowname, OutputWindow> windows;
	private Runner runner;
	
	public RunHelper(JTextArea log, JLabel status) {
		this.critactions = new ArrayList<Action>();
		this.log = log;
		this.status = status;
		this.statuslocation = "no source directory open";
		// create a map to store all the output windows used
		this.windows = new HashMap<Windowname, OutputWindow>();
	}

	public void setRunner(Runner runner) {
		this.runner = runner;
	}

	public OutputWindow getOutputWindow(Windowname windowname) {
		// create the requested window if it doesn't exist yet
		OutputWindow tmp = this.windows.get(windowname);
		if (tmp == null) {
			switch (windowname) {
			case LCT_SERVER:
				tmp = new LCTRunOutputWindow(windowname.title(), new Point(windowname.xpos(), windowname.ypos()), new LCTStopAction(this.runner, "Stop", KeyEvent.VK_T));
				break;
			default:
				tmp = new OutputWindow(windowname.title(), new Point(windowname.xpos(), windowname.ypos()));
			}
			this.windows.put(windowname, tmp);
		}
		return tmp;
	}
	
	public JTextArea getLog() {
		return this.log;
	}

	public void addCritAction(Action action) {
		this.critactions.add(action);
	}

	/**
	 * Locks all the "important" actions. This is used from runner to make
	 * sure the user only runs one task at a time. All tasks that need to be
	 * disabled should be listed here.
	 */
	public void lockActions() {
		for (Action i : this.critactions) {
			i.setEnabled(false);
		}
	}
	
	/**
	 * Unlocks all the "important" actions. When runner has finished, it'll
	 * enable the disabled tasks again. This should be also kept up to date.
	 */
	public void unLockActions() {
		for (Action i : this.critactions) {
			i.setEnabled(true);
		}
	}
	
	/**
	 * Should be called from MainWindow to set the log correctly so commands
	 * can write to it.
	 * 
	 * @param log
	 */
	public void setLog(JTextArea log) {
		this.log = log;
	}
	
	/**
	 * Should be called from MainWindow to set the status label correctly so
	 * commands can write to it.
	 * 
	 * @param status
	 */
	public void setStatus(JLabel status) {
		this.status = status;
	}
	
	/**
	 * Set the "location" part of the status label, meaning the current working
	 * directory.
	 * 
	 * @param dir
	 */
	public void setStatusLocation(String dir) {
		this.statuslocation = dir;
	}
	
	/**
	 * This method can be used to reset the log.
	 */
	public void logClean() {
		if (this.log == null) {
			// do something if the log hasn't been set
			return;
		}
		this.log.setText("");
	}
	
	/**
	 * This method can be used to save the current ouput into a temporary
	 * file.
	 * 
	 * @param tmpdir  the directory where the file is going to be writte to
	 * @return  the file which was created
	 */
	public File logSaveFile(File tmpdir) {
		File tmp = null;
		try {
			tmp = File.createTempFile("limt", ".tmp", tmpdir);
			BufferedWriter fileWriter = new BufferedWriter(
					new FileWriter(tmp));
			fileWriter.write(this.log.getText());
			fileWriter.close();
		}
		catch (Exception e) {
			System.out.println("couldn't create a temporary file: "+e);
		}
		return tmp;
	}
	
	/**
	 * This method can be used to write to the status label.
	 * 
	 * @param input
	 */
	public void statusWrite(String input) {
		if (this.status == null) {
			// do something if the statusline hasn't been set
			return;
		}
		this.status.setText(input+" ("+this.statuslocation+")");
	}
	
	/**
	 * This method can be used to reset the status label.
	 */
	public void statusClean() {
		if (this.status == null) {
			// do something if the statusline hasn't been set
			return;
		}
		this.status.setText("ready ("+this.statuslocation+")");
	}

}
