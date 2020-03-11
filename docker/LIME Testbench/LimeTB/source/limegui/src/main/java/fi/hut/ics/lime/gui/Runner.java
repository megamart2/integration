package fi.hut.ics.lime.gui;

import java.io.*;
import javax.swing.*;

import fi.hut.ics.lime.gui.RunHelper.Windowname;

import java.util.List;

public class Runner {

	private RunHelper helper;
	private Config config;

	public Runner(RunHelper helper, Config config) {
		this.helper = helper;
		this.config = config;
	}

	/**
	 * Runs the "compile" task for currently set source directory (make sure one
	 * exists).
	 * 
	 * Compile task consists of 1) cleaning the spoon directory away if one
	 * exists 2) running spoon with the correct parameters for the source code
	 * 3) compiling generated aspects with aspectj
	 */
	public void limeCompile() {
		// clean the log and lock actions before new task
		this.helper.logClean();
		this.helper.lockActions();
		// write a status message that tells what's happening
		this.helper.statusWrite("executing compile task...");
		LimeTask task = new LimeTask(this.helper.getLog(), this.helper, this.config.getLimejcCommand());
		task.execute();
	}

	public void limeCCompile() {
		// clean the log and lock actions before new task
		this.helper.logClean();
		this.helper.lockActions();
		// write a status message that tells what's happening
		this.helper.statusWrite("executing compile task...");
		LimeTask task = new LimeTask(this.helper.getLog(), this.helper, this.config.getCCompileCommand());
		task.execute();
	}

	/**
	 * Runs the "run" task for currently set source directory (actually the
	 * spoon directory created in the compilation task).
	 * 
	 * Run task consists of running a user specified class file within the
	 * compiled program, and filtering the output in case of an exception to
	 * make it more readable.
	 */
	public void limeRun() {
		// clean the log and lock actions before new task
		this.helper.logClean();
		this.helper.lockActions();
		// write a status message that tells what's happening
		this.helper.statusWrite("executing run task...");
		LimeTask task = new LimeTask(this.helper.getLog(), this.helper, this.config.getLimejavaCommand());

		task.execute();
	}

	public void limeCRun() {
		// clean the log and lock actions before new task
		this.helper.logClean();
		this.helper.lockActions();
		// write a status message that tells what's happening
		this.helper.statusWrite("executing run task...");
		LimeTask task = new LimeTask(this.helper.getLog(), this.helper, this.config.getCRunCommand());

		task.execute();
	}


	/**
	 * Runs a custom command, that can be pretty much anything.
	 * 
	 * @param cmd
	 */
	public void runCustomCommand(Command cmd) {
		// when running custom commands, don't clear the screen or lock any
		// actions since the custom commands can do pretty much anything and
		// that might be a problem
		this.helper.statusWrite("executing custom command "
				+ cmd.getCommandText());
		LimeTask task = new LimeTask(this.helper.getLog(), this.helper, cmd);
		task.execute();
	}

	/**
	 * Runs emacs for current log output, that is the text you see on the
	 * screen. Mostly useful when an exception is encountered, since the output
	 * can be used to jump straight into the erroneous file.
	 */
	public void runEmacsForOutput() {
		// TODO: emacs can't be forced to start in certain directory if we give
		// it a file in different directory as a parameter. if we save the
		// temporary output file in the spoon directory (which would be nice),
		// beautify.py is able to find the source code files, but since they
		// now reside under spoon directory, all changes made to them will
		// be lost in next compilation.
		//
		// one ugly solution to this is to create the temporary file one level
		// above the original source directory, or two levels above spoon
		// directory, which will lead emacs to the correct files. however, this
		// solution is extremely ugly and might lead to serious consequences
		// and is currently only implemented as a necessary solution, and
		// should be fixed as soon as possible
		File tmpdir = null;
		if (this.config.getSourceDir() != null) {
			tmpdir = this.config.getSourceDir().getParentFile();
		}
		// if sourcedir doesn't have parent or hasn't been set yet, the tmp
		// file will be written to the system default directory
		EmacsTask task = new EmacsTask(this.helper.logSaveFile(tmpdir));
		task.execute();
	}
	
	public void runTracer(JTextArea outputarea, Command command) {
		LimeTask tracertask = new LimeTask(outputarea, this.helper, command);
		tracertask.execute();
	}
	
	public void lctcompileandinstrument(File file) {
			// write a status message that tells what's happening
			this.helper.statusWrite("executing LCTcompile and LCTinstrument...");
			OutputWindow lctwindow = this.helper.getOutputWindow(Windowname.LCT_OUTPUT);
			lctwindow.cleanOutputArea();
			// instrument depends on compile, so compile task is set to 
			// run it after finishing
			LimeTask instrumenttask = new LimeTask(lctwindow.getOutputArea(), this.helper, 
					this.config.getInstrumentCmd(new File(file.getAbsolutePath().replace(".java", ".class"))));
			LimeTask compiletask = new LimeTask(lctwindow.getOutputArea(), this.helper, 
					this.config.getCompileCmd(file), instrumenttask);
			lctwindow.setVisible(true);
			compiletask.execute();
	}
	
	public void lctinstrument(File file) {
		// write a status message that tells what's happening
		this.helper.statusWrite("executing LCTinstrument...");
		OutputWindow lctwindow = this.helper.getOutputWindow(Windowname.LCT_OUTPUT);
		lctwindow.cleanOutputArea();
		LimeTask task = new LimeTask(lctwindow.getOutputArea(), this.helper, this.config.getInstrumentCmd(file));
		lctwindow.setVisible(true);
		task.execute();
	}
	
	public void lctserverandrun(File file, String arg) {
		// write a status message that tells what's happening
		this.helper.statusWrite("executing LCTserver and LCTrun...");
		this.helper.logClean();
		OutputWindow serverwindow = this.helper.getOutputWindow(Windowname.LCT_SERVER);
		LimeTask servertask = new LimeTask(this.helper.getLog(), this.helper, this.config.getServerCmd());
		LimeTask runtask = new LimeTask(serverwindow.getOutputArea(), this.helper, this.config.getRunCmd(file, arg));
		// even though the output of LCTrun is shown in the window,
		// we'll set it so that the server (that's running in the mainwindow)
		// is killed when the window is closed
		serverwindow.setTask(servertask);
		serverwindow.cleanOutputArea();
		serverwindow.setVisible(true);
		servertask.execute();
		runtask.execute();
	}
	
	public void lctStop() {
		LimeTask stopTask = new LimeTask(null, this.helper, this.config.getStopCmd());
		stopTask.execute();
	}

	public void ljtoolsGenerateSimple(String constructorname, String methodname){
		this.helper.statusWrite("Running ljut-simple...");
		OutputWindow output = this.helper.getOutputWindow(Windowname.LJUT);
		LimeTask ljutsimple = new LimeTask(output.getOutputArea(), this.helper, this.config.getSimpleCmd(constructorname, methodname));
		output.cleanOutputArea();
		output.setVisible(true);
		ljutsimple.execute();
	}


	public void ljtoolsGenerateInterfaceTest(String interfacename, String constructorname, int iterations){
		this.helper.statusWrite("Running ljut-interface...");
		OutputWindow output = this.helper.getOutputWindow(Windowname.LJUT);
		LimeTask ljutinterface = new LimeTask(output.getOutputArea(), this.helper, this.config.getInterfaceCmd(interfacename, constructorname, iterations));
		output.cleanOutputArea();
		output.setVisible(true);
		ljutinterface.execute();
	}
	
	public void JunitTestGenerator(){
		this.helper.statusWrite("Running ljut-junit...");
		OutputWindow output = this.helper.getOutputWindow(Windowname.LJUT);
		LimeTask ljutjunit = new LimeTask(output.getOutputArea(), this.helper, this.config.getJunitCmd());
		output.cleanOutputArea();
		output.setVisible(true);
		ljutjunit.execute();		
	}

}
/**
 * One LimeTask represents a single "task" (like compilation or run) inside the
 * program that consists of several commands that are run in succession.
 * 
 * This might not be the best possible way of running commands, but works fine
 * at the moment since most of the commands are essentially bash scripts anyway.
 */
class LimeTask extends SwingWorker<Void, String> {

	private static final String ERROR_MESSAGE = "Program didn't finish normally, task ended.";

	private RunHelper helper;
	private Command command;
	private JTextArea outputarea;
	private Process p;
	private LimeTask followingtask;


	public LimeTask(JTextArea outputarea, RunHelper helper, Command command) {
		this.helper = helper;
		this.command = command;
		this.outputarea = outputarea;
		this.p = null;
		this.followingtask = null;
	}
	
	public LimeTask(JTextArea outputarea, RunHelper helper, Command command, LimeTask followingtask) {
		this.helper = helper;
		this.command = command;
		this.outputarea = outputarea;
		this.p = null;
		this.followingtask = followingtask;
	}

	@Override
	public Void doInBackground() {
		try {
			String output = null;
			if (this.command.premessage != null) {
				publish(this.command.premessage);
			}
			this.p = Runtime.getRuntime()
					.exec(this.command.cmd, this.command.env, this.command.dir);
			BufferedReader stdInput = new BufferedReader(
					new InputStreamReader(this.p.getInputStream()));
			// reading stderr causes an exception when killing the process for
			// some reason, should try to find a fix
			BufferedReader stdError = new BufferedReader(
					new InputStreamReader(this.p.getErrorStream()));
			while ((output = stdInput.readLine()) != null) {
				publish(output);
			}
			while ((output = stdError.readLine()) != null) {
				publish(output);
			}
			this.p.waitFor();
			stdInput.close();
			stdError.close();
			// if the process didn't exit correctly, print a message
			if (this.p.exitValue() != 0) {
				publish(ERROR_MESSAGE + " (return value: " + this.p.exitValue()
						+ ") Reason: "+this.command.errmessage);
				return null;
			}
			if (this.command.postmessage != null) {
				publish(this.command.postmessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("got exception: " + e);
		}
		return null;
	}

	@Override
	protected void process(List<String> output) {
		if (outputarea != null)
			for (String out : output) {
				this.outputarea.append(out + "\n");
			}
	}

	@Override
	protected void done() {
		// when done, reset statusline and unlock actions
		this.helper.statusClean();
		this.helper.unLockActions();
		// is there anything else to do? if so, run the task
		// (this is useful if some task depends on the execution of this one)
		if (this.followingtask != null) {
			this.followingtask.execute();
		}
	}
	
	public void kill() {
		if (this.p != null) {
			this.p.destroy();
		}
	}

}

/**
 * EmacsTask is simply used for running emacs in a separate thread for a
 * temporary file that is going to be deleted when the task finishes.
 */
class EmacsTask extends SwingWorker<Void, String> {

	private File inputfile;

	public EmacsTask(File inputfile) {
		this.inputfile = inputfile;
	}

	@Override
	public Void doInBackground() {
		try {
			String output = null;
			// if inputfile is null, temporary file couldn't be created so
			// there's no point in continuing
			if (this.inputfile == null) {
				return null;
			}
			Process p = Runtime.getRuntime().exec(
					new String[] { "emacs", this.inputfile.getAbsolutePath(),
							"-e", "compilation-mode" });
			// print stderr of emacs to stdout just in case
			BufferedReader stdError = new BufferedReader(new InputStreamReader(
					p.getErrorStream()));
			while ((output = stdError.readLine()) != null) {
				publish(output);
			}
			p.waitFor();
			stdError.close();
		} catch (Exception e) {
			System.out.println("got exception: " + e);
		}
		return null;
	}

	@Override
	protected void process(List<String> output) {
		for (String out : output) {
			System.out.println(out);
		}
	}

	@Override
	protected void done() {
		// when done, remove the temporary file
		try {
			this.inputfile.delete();
		} catch (Exception e) {
			System.out.println("couldn't delete a temporary file: " + e);
		}
	}
}


/**
 * Command represents a single process the tool executes.
 */
class Command {

	public String[] cmd;
	public String[] env;
	public File dir;
	public String errmessage;
	public String premessage;
	public String postmessage;

	/**
	 * Each command needs to have at least the following:
	 * 
	 * @param cmd
	 *            A string array containing the command and it's parameters
	 * @param env
	 *            A string array containing all the environment variables
	 * @param dir
	 *            The directory in which the command is run
	 * @param premessage
	 *            The message that is printed before running the command
	 * @param postmessage
	 *            The message that is printed after running the command
	 * @param errmessage
	 *            The message that is printed if an error occurs
	 */
	public Command(String cmd[], String[] env, File dir, String premessage,
			String postmessage, String errmessage) {
		this.cmd = cmd;
		this.env = env;
		this.dir = dir;
		this.errmessage = errmessage;
		this.premessage = premessage;
		this.postmessage = postmessage;
	}

	/**
	 * Overloaded constructor that can be used when there's no pre or post
	 * message to specify.
	 * 
	 * @param cmd
	 *            A string array containing the command and it's parameters
	 * @param env
	 *            A string array containing all the environment variables
	 * @param dir
	 *            The directory in which the command is run
	 * @param errmessage
	 *            The message that is printed if an error occurs
	 */
	public Command(String cmd[], String[] env, File dir, String errmessage) {
		this.cmd = cmd;
		this.env = env;
		this.dir = dir;
		this.errmessage = errmessage;
		this.premessage = null;
		this.postmessage = null;
	}

	/**
	 * Returns the text stored in the command, mainly usable with custom
	 * commands that are always run with bash, might return unexpected values
	 * when used with anything else.
	 * 
	 * @return
	 */
	public String getCommandText() {
		// TODO: this should be fixed to be something sensible
		// [0] = bash, [1] = -c [2] = rest of the command
		return this.cmd[2];
	}
}

