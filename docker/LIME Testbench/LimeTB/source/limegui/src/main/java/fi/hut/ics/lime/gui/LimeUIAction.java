package fi.hut.ics.lime.gui;

import java.awt.event.ActionEvent;
import java.io.File;
import java.util.HashMap;

import javax.swing.AbstractAction;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

//to define new actions, should extend LimeUIAction, create a constructor and
//and add an actionPerformed() method that does what the action should do.
//this way the same actions can be used in two places at one time in the UI
//(like a button in the menu and in the toolbar if we make one) 

abstract class LimeUIAction extends AbstractAction {

	public LimeUIAction(String text, ImageIcon icon, String desc,
			Integer mnemonic) {
		super(text, icon);
		putValue(SHORT_DESCRIPTION, desc);
		putValue(MNEMONIC_KEY, mnemonic);
	}

}
// the following actions are for limt
class SetSourceDirAction extends LimeUIAction {

	private JFileChooser filechooser;
	private JFrame mainframe;
	private RunHelper helper;
	private Config config;

	public SetSourceDirAction(JFileChooser filechooser, JFrame mainframe,
			RunHelper helper, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.filechooser = filechooser;
		this.mainframe = mainframe;
		this.helper = helper;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		// if the dir was set previously set the filechooser to show that dir
		if (this.config.getSourceDir() != null && this.config.getSourceDir().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getSourceDir());
		}
		else {
			this.filechooser.setCurrentDirectory(null);
		}
		this.filechooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		int retval = this.filechooser.showOpenDialog(mainframe);
		if (retval == JFileChooser.APPROVE_OPTION) {
			File selected = this.filechooser.getSelectedFile();
			this.config.setSourceDir(selected);
			// also, we can set LCT instrumentation path to
			// point to the (soon to be created) spoon directory
			this.config.setLCTinstrumentpath(this.config.getSpoonDir());
			this.helper.setStatusLocation(selected.getAbsolutePath());
			this.helper.statusClean();
		}

	}
}

class ExitAction extends LimeUIAction {

	public ExitAction(String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
	}

	public void actionPerformed(ActionEvent e) {
		System.exit(0);
	}
}

class CompileAction extends LimeUIAction {

	private static String CAN_NOT_COMPILE = "Couldn't compile.\n\n"
			+ "Please make sure the toolkit path and\n"
			+ "the source directory are set correctly\n"
			+ "before compiling.";

	private Config config;
	private Runner runner;
	private JFrame mainframe;

	public CompileAction(JFrame mainframe, Runner runner, Config config,
			String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		if (!this.config.readyToCompile()) {
			JOptionPane.showMessageDialog(mainframe, CAN_NOT_COMPILE);
			return;
		}
		this.runner.limeCompile();
	}
}

class CompileCAction extends LimeUIAction {

	private static String CAN_NOT_COMPILE = "Couldn't compile.\n\n"
		+ "Please make sure the toolkit path and\n"
		+ "the source directory are set correctly\n"
		+ "before compiling.";

	private Config config;
	private Runner runner;
	private JFrame mainframe;

	public CompileCAction(JFrame mainframe, Runner runner, Config config,
			String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		if (!this.config.cReadyToCompile()) {
			JOptionPane.showMessageDialog(mainframe, CAN_NOT_COMPILE);
			return;
		}
		this.runner.limeCCompile();
	}
}

class RunAction extends LimeUIAction {

	private static String CAN_NOT_RUN = "Couldn't run the program.\n\n"
			+ "Please make sure you have compiled the\n"
			+ "program before running it.";

	private Config config;
	private Runner runner;
	private JFrame mainframe;

	public RunAction(JFrame mainframe, Runner runner, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		if (!this.config.readyToRun()) {
			JOptionPane.showMessageDialog(mainframe, CAN_NOT_RUN);
			return;
		}
		this.runner.limeRun();
	}
}

class RunCAction extends LimeUIAction {

	private static String CAN_NOT_RUN = "Couldn't run the program.\n\n"
			+ "Please make sure you have compiled the\n"
			+ "program before running it.";

	private Config config;
	private Runner runner;
	private JFrame mainframe;

	public RunCAction(JFrame mainframe, Runner runner, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		if (!this.config.cReadyToRun()) {
			JOptionPane.showMessageDialog(mainframe, CAN_NOT_RUN);
			return;
		}
		this.runner.limeCRun();
	}
}

class SetRunAction extends LimeUIAction {

	private static String DIALOG_TEXT = "Set name of the main class for the tool to run. \n\n"
			+ "This classname should be in form <packagename>.<classname>.";

	private Config config;
	private JFrame mainframe;

	public SetRunAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.config = config;
		this.mainframe = mainframe;
	}

	public void actionPerformed(ActionEvent e) {
		String input = (String) JOptionPane.showInputDialog(mainframe,
				DIALOG_TEXT, config.getRunClassText());

		if (input != null && input.length() > 0) {
			this.config.setRunClass(input);
		}
	}
}

class RunEmacsAction extends LimeUIAction {

	private Runner runner;

	public RunEmacsAction(Runner runner, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.runner = runner;
	}

	public void actionPerformed(ActionEvent e) {
		this.runner.runEmacsForOutput();
	}
}

class SetExtraClasspathAction extends LimeUIAction {

	private static String DIALOG_TEXT = "If you need something special in the CLASSPATH, \n"
			+ "please add it here.\n\n"
			+ "syntax: /path/to/somewhere:/path/to/somewhere/else\n"
			+ "(no leading or trailing ':')";

	private JFrame mainframe;
	private Config config;

	public SetExtraClasspathAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		String input = (String) JOptionPane.showInputDialog(mainframe,
				DIALOG_TEXT, this.config.getExtraClasspath());
		if (input != null) {
			this.config.addExtraClasspath(input);
		}
	}
}

class SetExtraPathAction extends LimeUIAction {

	private static String DIALOG_TEXT = "If you need something special in the PATH, \n"
			+ "please add it here.\n\n"
			+ "syntax: /path/to/somewhere:/path/to/somewhere/else\n"
			+ "(no leading or trailing ':')";

	private JFrame mainframe;
	private Config config;

	public SetExtraPathAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		String input = (String) JOptionPane.showInputDialog(mainframe,
				DIALOG_TEXT, this.config.getExtraPath());
		if (input != null) {
			this.config.addExtraPath(input);
		}
	}
}

class AddCustomCmdAction extends LimeUIAction {

	private static String CMD_ALREADY_EXISTS = "Command with that name already exists.";

	private Config config;
	private Runner runner;
	private JFrame mainframe;
	private JMenu menu;

	public AddCustomCmdAction(JFrame mainframe, JMenu menu, Runner runner,
			Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.config = config;
		this.runner = runner;
		this.mainframe = mainframe;
		this.menu = menu;
	}

	public void actionPerformed(ActionEvent e) {

		AddCmd dialog = new AddCmd(this.mainframe);
		dialog.setVisible(true);

		if (dialog.getResult() == OkCancelDialogResult.OK) {
			String nameinput = dialog.getNameText();
			String dirinput = dialog.getDirText();
			String cmdinput = dialog.getCommandText();
			
			Command command = this.config.addCustomRunCmd(nameinput, cmdinput, dirinput);
			if (command == null) {
				// adding command failed, show a warning
				JOptionPane.showMessageDialog(mainframe, CMD_ALREADY_EXISTS);
				return;
			}

			JMenuItem commanditem = new JMenuItem(new RunCustomCmdAction(
					this.runner, command, nameinput + " (" + command.getCommandText() + ")", null));

			commanditem.setName(nameinput);

			String tmpName = nameinput;
			String tmpCmd = cmdinput;

			if (nameinput.length() > 20)
				tmpName = nameinput.substring(0, 16) + "...";
			if (cmdinput.length() > 20)
				tmpCmd = cmdinput.substring(0, 16) + "...";

			commanditem.setText(tmpName + " (" + tmpCmd + ")");

			this.menu.add(commanditem);
		}
	}
}

class RemoveCustomCmdAction extends LimeUIAction {

	private static String DIALOG_TEXT = "Select the command to be removed.";

	private Config config;
	private JFrame mainframe;
	private JMenu menu;

	public RemoveCustomCmdAction(JFrame mainframe, JMenu menu, Config config,
			String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.config = config;
		this.mainframe = mainframe;
		this.menu = menu;
	}

	public void actionPerformed(ActionEvent e) {
		// build a map of all the RunCustomCmdAction menuitems in the menu
		HashMap<String, JMenuItem> runcommands = new HashMap<String, JMenuItem>();
		for (int i = 0; i < this.menu.getItemCount(); i++) {
			
			JMenuItem current = this.menu.getItem(i);
			if (current != null
					&& current.getAction().getClass().equals(
							RunCustomCmdAction.class)) {
				runcommands.put(current.getName(), current);
			}
		}
		Object[] options = runcommands.keySet().toArray();
		String nameinput = (String) JOptionPane.showInputDialog(mainframe,
				DIALOG_TEXT, "Remove command", JOptionPane.PLAIN_MESSAGE, null,
				options, null);
		if (nameinput != null && nameinput.length() > 0) {
			// remove the command from configuration
			this.config.removeCustomRunCmd(nameinput);
			// remove the item from menu
			this.menu.remove(runcommands.get(nameinput));
		} else {
			// cancel or empty string
			return;
		}
	}
}

class RunCustomCmdAction extends LimeUIAction {

	private Runner runner;
	private Command cmd;

	public RunCustomCmdAction(Runner runner, Command cmd, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.runner = runner;
		this.cmd = cmd;
	}

	public void actionPerformed(ActionEvent e) {
		this.runner.runCustomCommand(this.cmd);
	}

}

class StartTracerAction extends LimeUIAction{

	private Tracergui tracergui;

	public StartTracerAction(JFileChooser filechooser, Config config, Runner runner, String text, Integer mnemonic){
		super(text, null, null, mnemonic);
		this.tracergui = new Tracergui(config, runner, filechooser);

	}
	public void actionPerformed(ActionEvent ae) {
		this.tracergui.updateAndShow();
	}
}

class LCTConnectionSettingAction extends LimeUIAction{

	private LCTConnectSettingsDialog dialog;
	private JFrame mainframe;
	private Config config;
	public LCTConnectionSettingAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}
	public void actionPerformed(ActionEvent ae) {
		dialog = new LCTConnectSettingsDialog(mainframe, true, config);
		if(dialog.isFileValid()) {
			dialog.setVisible(true);
		} else {
			JOptionPane.showMessageDialog(mainframe,
					"Unable to open usersettings.properties, please " +
					"check the file.");
		}
	}
}

class LCTTestSettingAction extends LimeUIAction{

	private LCTTestSettingsDialog dialog;
	private JFrame mainframe;
	private Config config;
	public LCTTestSettingAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}
	public void actionPerformed(ActionEvent ae) {
		dialog = new LCTTestSettingsDialog(mainframe, true, config);
		if(dialog.isFileValid()) {
			dialog.setVisible(true);
		} else {
			JOptionPane.showMessageDialog(mainframe,
					"Unable to open usersettings.properties, please " +
					"check the file.");
		}
		
	}
}

class LCTInstrumentSettingAction extends LimeUIAction{
	
	private LCTInstrumentSettingsDialog dialog;
	private JFrame mainframe;
	private Config config;
	public LCTInstrumentSettingAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}
	public void actionPerformed(ActionEvent ae) {
		dialog = new LCTInstrumentSettingsDialog(mainframe, true, config);
		if(dialog.isFileValid()) {
			dialog.setVisible(true);
		} else {
			JOptionPane.showMessageDialog(mainframe,
					"Unable to open usersettings.properties, please " +
					"check the file.");
		}

	}
}

class LCTSolverSettingAction extends LimeUIAction{
	
	private LCTConstraintSettingsDialog dialog;
	private JFrame mainframe;
	private Config config;
	public LCTSolverSettingAction(JFrame mainframe, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.config = config;
	}
	public void actionPerformed(ActionEvent ae) {
		dialog = new LCTConstraintSettingsDialog(mainframe, true, config);
		if(dialog.isFileValid()) {
			dialog.setVisible(true);
		} else {
			JOptionPane.showMessageDialog(mainframe,
					"Unable to open usersettings.properties, please " +
					"check the file.");
		}

	}
}

class LCTSetInstrumentPathAction extends LimeUIAction {
	
	private JFrame mainframe;
	private Config config;
	private JFileChooser filechooser;
	
	public LCTSetInstrumentPathAction(JFrame mainframe, JFileChooser filechooser, 
			Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.mainframe = mainframe;
		this.filechooser = filechooser;
		this.config = config;
	}
	
	public void actionPerformed(ActionEvent ae) {
		this.filechooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		// some 'clever' guessing about the directories user might want to set here
		if (this.config.getLCTinstrumentPath() != null && this.config.getLCTinstrumentPath().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getLCTinstrumentPath());
		}
		else if (this.config.getSpoonDir() != null && this.config.getSpoonDir().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getSpoonDir());
		}
		else if (this.config.getSourceDir() != null && this.config.getSourceDir().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getSourceDir());
		}
		else {
			this.filechooser.setCurrentDirectory(null);
		}
		int retrival = filechooser.showOpenDialog(this.mainframe);
		if(retrival == JFileChooser.APPROVE_OPTION) {
			File selected = filechooser.getSelectedFile();
			this.config.setLCTinstrumentpath(selected);
		}
	}	
}

class LCTCompileAndInstrumentAction extends LimeUIAction {

	private JFileChooser filechooser;
	private JFrame mainframe;
	private Runner runner;
	private Config config;

	public LCTCompileAndInstrumentAction(JFrame mainframe, JFileChooser filechooser, 
			Runner runner, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.filechooser = filechooser;
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		
		// check that instrument path is set
		if (this.config.getLCTTestClassName() != null) {
			
		}
		if (this.config.getLCTinstrumentPath() == null) {
			JOptionPane.showMessageDialog(mainframe, "Please set tester path first.");
			return;
		}
		else if (!this.config.getLCTinstrumentPath().exists()) {
			JOptionPane.showMessageDialog(mainframe, "Tester directory\n'" +
					this.config.getLCTinstrumentPath().getAbsolutePath() +
					"'\ndoesn't exist, please choose a different directory.");
			return;
		}
		
		this.filechooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
		
		// some 'clever' guessing about the files user might want to set here
		this.filechooser.setCurrentDirectory(this.config.getLCTinstrumentPath());
		if (this.config.getLCTTestClassName() != null) {
			File testfile_class = new File(
					this.config.getLCTinstrumentPath().getAbsolutePath()+
					File.separator+this.config.getLCTTestClassName()+".class");
			File testfile_java = new File(
					this.config.getLCTinstrumentPath().getAbsolutePath()+
					File.separator+this.config.getLCTTestClassName()+".java");
			if (testfile_class.exists()) {
				this.filechooser.setSelectedFile(testfile_class);
			}
			else if (testfile_java.exists()) {
				this.filechooser.setSelectedFile(testfile_java);
			}
		}
		
		int retval = this.filechooser.showOpenDialog(this.mainframe);
		if (retval == JFileChooser.APPROVE_OPTION) {
			
			File selected = this.filechooser.getSelectedFile();
			// reset the selected file in filechooser
			this.filechooser.setSelectedFile(null);
			
			// check if the file is "viable" in relation to the instrument path
			if (!selected.getAbsolutePath().contains(this.config.getLCTinstrumentPath().getAbsolutePath())) {
				JOptionPane.showMessageDialog(mainframe, "Selected file was not in test path.");
				return;
			}
			
			if (selected.getName().endsWith(".class")) {
				// user selected a .class file, which can just be instrumented
				this.runner.lctinstrument(selected);
			} else if (selected.getName().endsWith(".java")){
				// user selected a .java file, which must be compiled 
				// before instrumentation
				this.runner.lctcompileandinstrument(selected);
			} else {
				// the file selected wasn't a .java or .class file
				JOptionPane.showMessageDialog(mainframe, "Please choose a .java or .class file");
			}
			
			// save the name of the file being processed (without the trailing .class or .java)
			// for later use
			String name = selected.getAbsolutePath();
			// strip lct instrument path from filename
			name = name.replace(this.config.getLCTinstrumentPath().getAbsolutePath(), "");
			// remove the leading '/'
			name = name.substring(1);
			// remove .class suffix (if it exists)
			if (name.endsWith(".class"))
				name = name.substring(0, name.indexOf(".class"));
			// remove .java suffix (if it exists)
			if (name.endsWith(".java"))
				name = name.substring(0, name.indexOf(".java"));
			
			this.config.saveLCTTestClassName(name);
		}
	}
}

class LCTStopAction extends LimeUIAction {

	private Runner runner;

	public LCTStopAction(Runner runner, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.runner = runner;
	}

	public void actionPerformed(ActionEvent e) {
		this.runner.lctStop();
	}
}

class LCTServerAndRunAction extends LimeUIAction {

	private JFileChooser filechooser;
	private JFrame mainframe;
	private Runner runner;
	private Config config;

	public LCTServerAndRunAction(JFrame mainframe, JFileChooser filechooser, 
			Runner runner, Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.filechooser = filechooser;
		this.mainframe = mainframe;
		this.runner = runner;
		this.config = config;
	}
	
	public void actionPerformed(ActionEvent e) {
		
		// check that instrument path is set
		if (this.config.getLCTinstrumentPath() == null) {
			JOptionPane.showMessageDialog(mainframe, "Please set tester path first.");
			return;
		}
		else if (!this.config.getLCTinstrumentPath().exists()) {
			JOptionPane.showMessageDialog(mainframe, "Tester directory\n'" +
					this.config.getLCTinstrumentPath().getAbsolutePath() +
					"'\ndoesn't exist, please choose a different directory.");
			return;
		}
		
		this.filechooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
		
		// some 'clever' guessing about the files user might want to set here
		this.filechooser.setCurrentDirectory(this.config.getLCTinstrumentPath());
		if (this.config.getLCTTestClassName() != null) {
			File testfile = new File(
					this.config.getLCTinstrumentPath().getAbsolutePath()+
					File.separator+"output"+
					File.separator+this.config.getLCTTestClassName()+".class");
			if (testfile.exists()) {
				this.filechooser.setSelectedFile(testfile);
			}
		}
		
		int retval = this.filechooser.showOpenDialog(this.mainframe);
		if (retval == JFileChooser.APPROVE_OPTION) {
			
			File selected = this.filechooser.getSelectedFile();
			// reset the selected file in filechooser
			this.filechooser.setSelectedFile(null);

			String arg = "all";
			
			// check if the file was selected from the "output" directory as it should
			if (!selected.getAbsolutePath().contains(this.config.getLCTinstrumentPath()
					.getAbsolutePath()+File.separator+"output")) {
				JOptionPane.showMessageDialog(mainframe, "Please select a class " +
						"file under the 'output' directory.\n" +
						"("+this.config.getLCTinstrumentPath()
						.getAbsolutePath()+File.separator+"output)");
				return;
			}
			
			this.runner.lctserverandrun(selected, arg);
		}
	}
}

// the following actions are for the ljut

class GenerateSimpleTestCodeAction extends LimeUIAction {
	
	private Config config;
	private Runner runner;
	private JFrame mainframe;
	private SimpleDriverGenDialog dialog;

	public GenerateSimpleTestCodeAction(JFrame mainframe, Runner runner,
			Config config, String text, Integer mnemonic) {

		super(text, null,null,mnemonic);
		this.config = config;
		this.runner = runner;
		this.mainframe = mainframe;
		this.dialog = null;
	}
			

	public void actionPerformed(ActionEvent e) {

		if (this.dialog == null)
			this.dialog = new SimpleDriverGenDialog(mainframe, true);
		this.dialog.setVisible(true);

		String constructorname = this.dialog.getConstructorName();
		String methodname = this.dialog.getMethodName();

		if (constructorname != null && methodname != null) {
			// TODO: This will not work if the naming scheme used by the ljut tool is changed.
			String[] qualifiedNameParts = constructorname.split("\\(")[0].split("\\.");
			String className = qualifiedNameParts[qualifiedNameParts.length - 1];
			File propertiesFile = new File(config.getLCTinstrumentPath(), className+"LCTDriver.properties");
			config.setPropertyDir(propertiesFile);
			this.runner.ljtoolsGenerateSimple(constructorname, methodname);
		}

	}
}


class GenerateInterfaceTestCodeAction extends LimeUIAction {

	private Config config;
	private Runner runner;
	private JFrame mainframe;
	private InterfaceDriverGenDialog dialog;

	public GenerateInterfaceTestCodeAction(JFrame mainframe, Runner runner,
			Config config, String text, Integer mnemonic) {

		super(text, null,null,mnemonic);
		this.config = config;
		this.runner = runner;
		this.mainframe = mainframe;
		this.dialog = null;
	}


	public void actionPerformed(ActionEvent e) {

		if (this.dialog == null)
			this.dialog = new InterfaceDriverGenDialog(mainframe, true);
		this.dialog.setVisible(true);

		String interfacename = this.dialog.getInterfaceName();
		String constructorname = this.dialog.getConstructorName();
		int iterations = this.dialog.getIterationNum();
		
		// if either nameinput or cmdinput is null, user pressed cancel
		if (interfacename != null && constructorname != null) {
			// TODO: This will not work if the naming scheme used by the ljut tool is changed.
			String[] qualifiedNameParts = constructorname.split("\\(")[0].split("\\.");
			String className = qualifiedNameParts[qualifiedNameParts.length - 1];
			File propertiesFile = new File(config.getLCTinstrumentPath(), className+"LCTDriver.properties");
			config.setPropertyDir(propertiesFile);
			this.runner.ljtoolsGenerateInterfaceTest(interfacename, constructorname, iterations);
		}
	}
}


class JUnitTestGenerationAction extends LimeUIAction {

	private Runner runner;

	public JUnitTestGenerationAction(Runner runner, String text, Integer mnemonic) {

		super(text, null,null,mnemonic);
		this.runner = runner;
	}

	public void actionPerformed(ActionEvent e) {
			this.runner.JunitTestGenerator();
	}
}

class SetToolkitAction extends LimeUIAction {

	private JFileChooser filechooser;
	private JFrame mainframe;
	private Config config;

	public SetToolkitAction(JFileChooser filechooser, JFrame mainframe,
			Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.filechooser = filechooser;
		this.mainframe = mainframe;
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		this.filechooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		this.filechooser.setCurrentDirectory(null);
		int retval = this.filechooser.showOpenDialog(mainframe);
		if (retval == JFileChooser.APPROVE_OPTION) {
			String binpath = this.filechooser.getSelectedFile().getAbsolutePath()+File.separator+"bin";
			File binpathFile = new File(binpath);
			this.config.setBinDir(binpathFile);
			String libpath = this.filechooser.getSelectedFile().getAbsolutePath()+File.separator+"lib";
			File libpathFile = new File(libpath);
			this.config.setLibDir(libpathFile);
		}
	}
}


class SaveConfigAction extends LimeUIAction {

	private Config config;

	public SaveConfigAction(Config config, String text, Integer mnemonic) {
		super(text, null, null, mnemonic);
		this.config = config;
	}

	public void actionPerformed(ActionEvent e) {
		this.config.saveSettings();
	}
}
