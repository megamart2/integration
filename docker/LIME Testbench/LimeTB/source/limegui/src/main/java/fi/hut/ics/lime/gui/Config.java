package fi.hut.ics.lime.gui;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Properties;

import javax.swing.JFileChooser;

public class Config {
	
	private static final String DEFAULT_CONFIG_FILE = ".limt";
	private static final String SPOON_DIR_NAME = "spoon";
	
	private static final String VAR_CMDLIST = "commands";
	private static final String CMD_SEPARATOR = ":";
	private static final String CMD_PREFIX = "cmd_";
	private static final String CMD_NAME_SUFFIX = "_name";
	private static final String CMD_CMD_SUFFIX = "_cmd";
	private static final String CMD_DIR_SUFFIX = "_dir";
	private static final String VAR_CLASSPATH = "extra_classpath";
	private static final String VAR_PATH = "extra_path";
	private static final String VAR_LIBDIR = "libdir";
	private static final String VAR_BINDIR = "bindir";
	private static final String VAR_SOURCEDIR = "sourcedir";
	private static final String VAR_RUNCLASS = "runclass";
	private static final String DEF_RUNCLASS = "<no class set>";
	private static final String VAR_PROPERTYDIR = "propertydir";
	private static final String VAR_PARAMETERDIR = "parameterdir";
	private static final String VAR_LCTINSTRUPATH = "instrumentpath";
	private static final String VAR_CORE_CLASS_SETTING = "coreclass";
	private static final String VAR_LCT_TMP_TESTCLASS = "lct_tmp_testclass";
	
	private HashMap<String, Command> customcmds;
	
	private File configfile;
	private Properties settings;
	
	public Config() {
		this.settings = new Properties();
		this.configfile = new File(System.getProperty("user.home")+
				File.separator+DEFAULT_CONFIG_FILE);
		this.openFile(this.configfile);
		this.readCommands();
	}
	
	public void openFile(File file) {
		this.configfile = file;
		try {
			if (this.configfile.exists()) {
				BufferedReader fileReader = new BufferedReader(
						new FileReader(this.configfile));
				this.settings.load(fileReader);
				fileReader.close();
			}
		}
		catch (Exception e) {
			System.out.println("config file "+
					this.configfile.getAbsolutePath()+
					" read failed: "+e);
		}
	}
	
	public void saveSettings() {
		try {
			// if the file doesn't exist, create it
			if (!this.configfile.exists()) {
				this.configfile.createNewFile();
			}
			BufferedWriter fileWriter = new BufferedWriter(
					new FileWriter(this.configfile));
			this.settings.store(fileWriter, "limt config file");
			fileWriter.close();
		}
		catch (Exception e) {
			System.out.println("config file "+
					this.configfile.getAbsolutePath()+
					" write failed: "+e);
		}
	}
	
	private void readCommands() {
		this.customcmds = new HashMap<String, Command>();
		String cmdlist = this.settings.getProperty(VAR_CMDLIST);
		if (cmdlist == null || cmdlist.equals("")) {
			// no custom commands found
			return;
		}
		String[] cmds = cmdlist.split(CMD_SEPARATOR);
		for (String cmd : cmds) {
			this.customcmds.put(this.settings.getProperty(CMD_PREFIX+cmd+CMD_NAME_SUFFIX), 
					new Command(new String[]{
					"bash", "-c", this.settings.getProperty(CMD_PREFIX+cmd+CMD_CMD_SUFFIX)}, 
					this.getEnvironment(), 
					new File(this.settings.getProperty(CMD_PREFIX+cmd+CMD_DIR_SUFFIX)),
					"Running '"+cmd+"' failed."));
		}
	}
	
	public HashMap<String, Command> getCommands() {
		return this.customcmds;
	}
	
	private String getClasspath() {
		String classpath = "";
		if (this.settings.getProperty(VAR_CLASSPATH) != null) {
			classpath += this.settings.getProperty(VAR_CLASSPATH);
		}
		return classpath;
	}
	
	private String getPath() {
		String path = "";
		if (this.settings.getProperty(VAR_PATH) != null) {
			path += this.settings.getProperty(VAR_PATH)+File.pathSeparator;
		}
		path +=
			"/bin"+File.pathSeparator+ 
			"/usr/bin"+File.pathSeparator+
			"/usr/local/bin";
		if (this.settings.getProperty(VAR_BINDIR) != null) {
			path += File.pathSeparator+this.settings.getProperty(VAR_BINDIR);
		}
		return path;
	}
	
	/**
	 * Sets the path to the directory with the source files the user
	 * wants to compile.
	 * 
	 * @param path
	 */
	public void setSourceDir(File path) {
		this.settings.setProperty(VAR_SOURCEDIR, path.getAbsolutePath());
		// guess run command from source directory name
		this.settings.setProperty(VAR_RUNCLASS, path.getName()+".Main");
	}
	
	/**
	 * Return the current source directory.
	 * 
	 * @return
	 */
	public File getSourceDir() {
		String sourcedir = this.settings.getProperty(VAR_SOURCEDIR);
		if (sourcedir == null) {
			return null;
		}
		return new File(sourcedir);
	}
	
	/**
	 * Return the current spoon directory.
	 * 
	 * @return
	 */	
	public File getSpoonDir() {
		File sourcedir = this.getSourceDir();
		if (sourcedir == null) {
			return null;
		}
		return new File(sourcedir.getAbsolutePath()+File.separator+SPOON_DIR_NAME);
	}
	
	/**
	 * Set the path to the directory under which lime libraries and other
	 * necessary jar files can be found.
	 * 
	 * @param path
	 */
	public void setLibDir(File path) {
		this.settings.setProperty(VAR_LIBDIR, path.getAbsolutePath());
	}
	
	/**
	 * Return currently set lib directory.
	 * 
	 * @return
	 */
	public File getLibDir() {
		String libdir = this.settings.getProperty(VAR_LIBDIR);
		if (libdir == null) {
			return null;
		}
		return new File(libdir);
	}
	
	/**
	 * Set the path to the directory where lime scripts and
	 * scheck can be found.
	 * 
	 * @param path
	 */	
	public void setBinDir(File path) {
		this.settings.setProperty(VAR_BINDIR, path.getAbsolutePath());
	}

	/**
	 * Return currently set bin directory.
	 * 
	 * @return
	 */
	public File getBinDir() {
		String toolpath = this.settings.getProperty(VAR_BINDIR);
		if (toolpath == null) {
			return null;
		}
		return new File(toolpath);
	}

	
	/**
	 * Returns environment variables used when running commands.
	 * 
	 * @return
	 */
	public String[] getEnvironment() {
		return new String[]{
				"PATH="+this.getPath(), 
				"CLASSPATH="+this.getClasspath(),
				"TERM=xterm",
				"JRELIBPATH=" + System.getProperty("java.home") + File.separator + "lib"};
	}
	
	public Command getLimejcCommand() {
		return new Command(new String[] { "bash", "-c",
				this.getBinDir().getAbsolutePath()+File.separator+"limejc ."}, 
				this.getEnvironment(),
				this.getSourceDir(), 
				"Instrumenting and compiling files in "+this.getSourceDir().getAbsolutePath()+"...", 
				"Finished.",
				"An error occured.");
	}
	
	public Command getLimejavaCommand() {
		return new Command(new String[] { "bash", "-c",
				this.getBinDir().getAbsolutePath()+File.separator+"limejava "+
				this.settings.getProperty(VAR_RUNCLASS, DEF_RUNCLASS)+" 2>&1 | "+
				this.getBinDir().getAbsolutePath()+File.separator+"beautify.py"}, 
				this.getEnvironment(),
				this.getSpoonDir(), 
				"Running "+this.settings.getProperty(VAR_RUNCLASS, DEF_RUNCLASS)+"...\n--output-start--", 
				"---output-end---",
				"An error occured.");
	}
	
	// TODO: try to get this working correctly

	public Command getCCompileCommand() {
		return new Command(new String[]{ "bash", "-c", 
				this.getBinDir().getAbsolutePath()+File.separator+"limec ."},
				null, 
				this.getSourceDir(),
				"Instrumenting and compiling files in "+this.getSourceDir().getAbsolutePath()+"...", 
				"Finished.", 
				"An error occured.");
	}
	
	// TODO: try to get this working correctly

	public Command getCRunCommand() {
		return new Command(new String[]{ "bash", "-c", 
				this.getSourceDir()+File.separator+"a.out"},
				null, 
				this.getSourceDir(),
				"Running the instrumented program...\n--output-start--", 
				"---output-end---", 
				"An error occured.");
	}
	
	/**
	 * Sets the current class to be run with "run" command.
	 * 
	 * @param cmd
	 */
	public void setRunClass(String cmd) {
		this.settings.setProperty(VAR_RUNCLASS, cmd);
	}
	
	/**
	 * Returns a text representation of the current class to be run with
	 * "run" command.
	 * 
	 * @return
	 */
	public String getRunClassText() {
		return this.settings.getProperty(VAR_RUNCLASS, DEF_RUNCLASS);
	}
	
	/**
	 * Adds a custom run command with specified properties.
	 * 
	 * @param name
	 * @param command
	 * @return
	 */
	public Command addCustomRunCmd(String name, String command, String directory) {
		if (this.settings.get(CMD_PREFIX+name+CMD_NAME_SUFFIX) != null) {
			// if a command with the same name exists, abort
			// TODO: could also do something sensible
			return null;
		}
		Command cmd = new Command(new String[]{ "bash", "-c", command}, 
				this.getEnvironment(), 
				new File(directory),
				"Running '"+name+"' failed.");
		this.customcmds.put(name, cmd);
		this.settings.setProperty(CMD_PREFIX+name+CMD_CMD_SUFFIX, command);
		this.settings.setProperty(CMD_PREFIX+name+CMD_NAME_SUFFIX, name);
		this.settings.setProperty(CMD_PREFIX+name+CMD_DIR_SUFFIX, directory);
		this.updateCustomCommandList();
		return cmd;
	}
	
	/**
	 * Removes a previously added custom run command.
	 * 
	 * @param name
	 */
	public void removeCustomRunCmd(String name) {
		if (this.customcmds.remove(name) == null) {
			System.out.println("tried to remove a command that doesn't exists: "+name);
			return;
		}
		this.settings.remove(CMD_PREFIX+name+CMD_NAME_SUFFIX);
		this.settings.remove(CMD_PREFIX+name+CMD_CMD_SUFFIX);
		this.settings.remove(CMD_PREFIX+name+CMD_DIR_SUFFIX);
		this.updateCustomCommandList();
	}
	
	/**
	 * Updates the command list variable which is necessary to recreate the
	 * custom commands when starting the program.
	 */
	private void updateCustomCommandList() {
		String commandlist = "";
		for (String cmd : this.customcmds.keySet()) {
			if (commandlist != "") {
				commandlist += CMD_SEPARATOR;
			}
			commandlist += cmd;
		}
		this.settings.setProperty(VAR_CMDLIST, commandlist);
	}
	
	/**
	 * Tells if the program is ready to compile (if all necessary paths have
	 * been set).
	 * 
	 * @return  true if program is ready to be compiled
	 */
	public boolean readyToCompile() {
		if (this.getLibDir() != null && this.getBinDir() != null && this.getSourceDir() != null) {
			return true;
		}
		return false;
	}
	
	public boolean cReadyToCompile() {
		if (this.getLibDir() != null && this.getBinDir() != null && this.getSourceDir() != null) {
			return true;
		}
		return false;
	}
	
	/**
	 * Tells if the program is ready to be run (if it has been compiled <=>
	 * if spoon directory exists).
	 * 
	 * @return true if program is ready to be run
	 */
	public boolean readyToRun() {
		if (this.getSpoonDir() != null && this.getSpoonDir().exists()) {
			return true;
		}
		return false;
	}
	
	public boolean cReadyToRun() {
		if (new File(this.getSourceDir().getAbsolutePath()+File.separator+"a.out").exists()) {
			return true;
		}
		return false;
	}
	
	/**
	 * A method for setting additional locations to classpath.
	 * 
	 * @param extra_classpath
	 */
	public void addExtraClasspath(String extra_classpath) {
		this.settings.setProperty(VAR_CLASSPATH, extra_classpath);
	}
	
	public String getExtraClasspath() {
		return this.settings.getProperty(VAR_CLASSPATH);
	}
	
	/**
	 * A method for setting additional locations to path.
	 * 
	 * @param extra_path
	 */	
	public void addExtraPath(String extra_path) {
		this.settings.setProperty(VAR_PATH, extra_path);
	}
	
	public String getExtraPath() {
		return this.settings.getProperty(VAR_PATH);
	}

	// Stuff moved over from the old LCTConfig and LjutConfig classes

	public void setLCTinstrumentpath(File path) {
		this.settings.setProperty(VAR_LCTINSTRUPATH, path.getAbsolutePath());
	}
	
	public File getLCTinstrumentPath() {
		String sourcedir = this.settings.getProperty(VAR_LCTINSTRUPATH);
		if (sourcedir == null) {
			return null;
		}
		return new File(sourcedir);
	}
	
	public void setPropertyDir(File path) {
		this.settings.setProperty(VAR_PROPERTYDIR, path.getAbsolutePath());
	}
	
	public File getPropertyDir() {
		String propertydir = this.settings.getProperty(VAR_PROPERTYDIR);
		if (propertydir == null) {
			return null;
		}
		return new File(propertydir);
	}

	public void setParameterDir(File path) {
		this.settings.setProperty(VAR_PARAMETERDIR, path.getAbsolutePath());
	}

	public File getParameterDir() {
		String parameterdir = this.settings.getProperty(VAR_PARAMETERDIR);
		if (parameterdir == null) {
			return null;
		}
		return new File(parameterdir);
	}
	
	public void setUseCoreClassReplacement(boolean value) {
		settings.setProperty(VAR_CORE_CLASS_SETTING, Boolean.toString(value));
	}
	
	public boolean getUseCoreClassReplacement() {
		String value = settings.getProperty(VAR_CORE_CLASS_SETTING);		
		if (value == null)
			return false;
		else
			return Boolean.parseBoolean(value);
	}
	
	public Command getStopCmd() {
		String[] cmd = {"bash", "-c", getBinDir().getAbsolutePath() + File.separator + "LCTstop"};
		return new Command(cmd, this.getEnvironment(), this.getBinDir(), "Failed to stop LCTserver.");
	}
	
	public Command getServerCmd() {
		String[] cmd = new String[2];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "LCTserver";
		return new Command(cmd, this.getEnvironment(), new File(this
				.getBinDir().getAbsolutePath()), "-- Starting LCT server --",
				"-- Stopping LCT server --", "-- LCT server error -- ");
	}

	public Command getCompileCmd(File file) {

		String[] cmd = new String[3];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "LCTcompile";
		cmd[2] = file.getAbsolutePath();
		return new Command(cmd, this.getEnvironment(), this.getLCTinstrumentPath(), 
				"Compiling "+file.getAbsolutePath()+"...",
				"Done.", 
				"An error occured. ");
	}

	public Command getInstrumentCmd(File file) {
		
		// strip lct instrument path from filename
		String target = file.getAbsolutePath().replace(this.getLCTinstrumentPath().getAbsolutePath(), "");
		// remove the leading '/'
		target = target.substring(1);
		// remove .class suffix (if it exists)
		if (target.endsWith(".class"))
			target = target.substring(0, target.indexOf(".class"));
		// replace remaining '/'s with '.'s
		target = target.replace('/', '.');

		boolean useCoreClassReplacement = getUseCoreClassReplacement();
		String[] cmd;
		if (!this.getUseCoreClassReplacement())
			cmd = new String[4];
		else
			cmd = new String[3];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "LCTinstrument";
		cmd[2] = target;
		if (!this.getUseCoreClassReplacement())
			cmd[3] = "-noreplacement";

		return new Command(cmd, this.getEnvironment(), this.getLCTinstrumentPath(), 
				"Instrumenting "+file.getAbsolutePath()+"...",
				"Done.", 
				"An error occured. ");
	}

	public Command getRunCmd(File file, String arg) {
		
		// strip lct instrument path from filename
		String target = file.getAbsolutePath().replace(this.getLCTinstrumentPath().getAbsolutePath(), "");
		// remove the leading '/output/'
		target = target.substring(8);
		// remove .class suffix (if it exists)
		if (target.endsWith(".class"))
			target = target.substring(0, target.indexOf(".class"));
		// replace remaining '/'s with '.'s
		target = target.replace('/', '.');

		String[] cmd = new String[4];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "LCTrun";
		cmd[2] = target;
		cmd[3] = arg;
		
		File workingdir = new File(this.getLCTinstrumentPath().toString()
				+ File.separator + "output");
		
		return new Command(cmd, this.getEnvironment(), workingdir,
				"-- Starting LCT run --", 
				"-- Stopping LCT run --",
				"-- LCT run error -- ");
	}
	
	// command to run ljut-simple
	public Command getSimpleCmd(String constructorname, String methodname) {

		String[] cmd = new String[5];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "ljut-simple";
		cmd[2] = "--verbose";
		cmd[3] = constructorname.replaceAll(" ", "");
		cmd[4] = methodname.replaceAll(" ", "");
		return new Command(cmd, this.getEnvironment(), getLCTinstrumentPath(),
				"-- Starting simple test code generator --",
				"-- Stopping simple test code generator --",
				"-- Simple test code generator error -- ");
	}

	// command to run ljut-interface
	public Command getInterfaceCmd(String interfacename, String constructorname, int iterations) {

		String[] cmd = new String[7];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "ljut-interface";
                cmd[2] = "--verbose";
		cmd[3] = "--override-exceptions";
		cmd[4] = interfacename.replaceAll(" ", "");
		cmd[5] = constructorname.replaceAll(" ", "");
		cmd[6] = Integer.toString(iterations);
		return new Command(cmd, this.getEnvironment(), getLCTinstrumentPath(),
				"-- Starting interface test code generator --",
				"-- Stopping interface test code generator --",
				"-- Interface test code generator error -- ");
	}

	// command to run ljut-junit
	public Command getJunitCmd() {

		String[] cmd = new String[6];
		cmd[0] = "/bin/bash";
		cmd[1] = getBinDir().getAbsolutePath() + File.separator + "ljut-junit";
		cmd[2] = "--verbose";
		cmd[3] = "--parameters-file";
		cmd[4] = this.getParameterDir().getAbsolutePath();
		cmd[5] = this.getPropertyDir().getAbsolutePath();
		return new Command(cmd, this.getEnvironment(), this.getPropertyDir().getParentFile(), 
				"-- Starting junit test code generator --",
				"-- Stopping junit test code generator --",
				"-- Junit test code generator error -- ");

	}
	
	// two helper methods to make LCT bearable to use in the UI
	
	public void saveLCTTestClassName(String classname) {
		this.settings.setProperty(VAR_LCT_TMP_TESTCLASS, classname);
	}
	
	public String getLCTTestClassName() {
		return this.settings.getProperty(VAR_LCT_TMP_TESTCLASS);
	}
	
}
