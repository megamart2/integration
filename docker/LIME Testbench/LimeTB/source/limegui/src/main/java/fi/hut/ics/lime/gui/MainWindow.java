package fi.hut.ics.lime.gui;

import javax.swing.*;
import javax.swing.text.*;

import java.awt.*;
import java.awt.event.*;

import java.io.File;
import java.util.HashMap;

public class MainWindow {

	private Runner runner;
	private JTextArea logarea;
	private JLabel statusline;
	private RunHelper helper;
	private Config config;

	private JMenu commandmenu;
	private JFrame mainframe;
	private JFileChooser filechooser;
	private LjutFrame ljutFrame;

	private HashMap<Object, Action> actions;

	public MainWindow() {
		this.logarea = new JTextArea();
		this.statusline = new JLabel();
		this.helper = new RunHelper(this.logarea, this.statusline);
		this.config = new Config();
		this.runner = new Runner(helper, config);
		helper.setRunner(runner);
	}

	/**
	 * This is where all the important UI stuff happens. Creates all the
	 * necessary components and sets them visible.
	 */
	public void createAndShow() {

		// first create the main frame
		this.mainframe = new JFrame();

		mainframe.setTitle("LIME Interface Testbench");
		this.mainframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// also initialize the filechooser
		this.filechooser = new JFileChooser();
		
		// create menubar
		JMenuBar menubar = new JMenuBar();
		menubar.setOpaque(true);
		menubar.setBackground(new Color(255, 255, 255));
		menubar.setPreferredSize(new Dimension(300, 20));

		this.mainframe.setJMenuBar(menubar);

		// create and populate menus for the menubar one at a time

		// first the 'Monitor' menu and necessary buttons
		JMenu menu = new JMenu("Monitor");
		menu.setMnemonic(KeyEvent.VK_M);

		Action setsourceaction = new SetSourceDirAction(this.filechooser,
				this.mainframe, this.helper, this.config,
				"Open source directory...", KeyEvent.VK_O);
		menu.add(new JMenuItem(setsourceaction));
		
		menu.addSeparator();
		
		// this is a critical action
		Action compileaction = new CompileAction(this.mainframe, this.runner,
				this.config, "Compile", KeyEvent.VK_C);
		this.helper.addCritAction(compileaction);
		menu.add(new JMenuItem(compileaction));
		
		Action setrunaction = new SetRunAction(this.mainframe, this.config,
				"Set main class...", KeyEvent.VK_M);
		menu.add(new JMenuItem(setrunaction));
		
		// this is a critical action
		Action runaction = new RunAction(this.mainframe, this.runner,
				this.config, "Run", KeyEvent.VK_R);
		this.helper.addCritAction(runaction);
		menu.add(new JMenuItem(runaction));
		
		menu.addSeparator();
		
		Action emacsaction = new RunEmacsAction(this.runner,
				"Run emacs on current output", KeyEvent.VK_E);
		menu.add(new JMenuItem(emacsaction));
		
		Action startTracer = new StartTracerAction(this.filechooser, 
				this.config, this.runner, "Start tracer", KeyEvent.VK_T);
		menu.add(startTracer);
		
		menu.addSeparator();
		
		Action exitaction = new ExitAction("Exit", KeyEvent.VK_X);
		menu.add(new JMenuItem(exitaction));

		menubar.add(menu);

		// then the 'Tester' menu and necessary buttons
		menu = new JMenu("Tester");
		menu.setMnemonic(KeyEvent.VK_S);

		Action lctsetinstrumentpath = new LCTSetInstrumentPathAction(mainframe, this.filechooser, config, "Set test path...", KeyEvent.VK_T);
		menu.add(lctsetinstrumentpath);

		menu.addSeparator();

		Action lctcompileandinstrument = new LCTCompileAndInstrumentAction(mainframe,
				filechooser, runner, config, "Compile and/or instrument...", KeyEvent.VK_I);
		menu.add(new JMenuItem(lctcompileandinstrument));

		Action lctrun = new LCTServerAndRunAction(mainframe,
				filechooser, runner, config, "Run...", KeyEvent.VK_R);
		menu.add(new JMenuItem(lctrun));
		
		// Additions by osaariki
		final Action generateSimpleAction = new GenerateSimpleTestCodeAction(
				mainframe, runner, config,
				"Generate test driver for methods...", KeyEvent.VK_M);
		final Action generateInterfaceAction = new GenerateInterfaceTestCodeAction(
				mainframe, runner, config,
				"Generate test driver for interface...", KeyEvent.VK_I);
		final Action junittestAction = new JUnitTestGenerationAction(runner,
				"Generate Junit tests...", KeyEvent.VK_J);
		menu.addSeparator();
		Action openLjutFrame = new AbstractAction("Test drivers and JUnit tests...") {

			{
				putValue(MNEMONIC_KEY, KeyEvent.VK_D);
			}
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if (ljutFrame == null) {
					config.setParameterDir(new File(config.getBinDir(), "testcases"));
					ljutFrame = new LjutFrame(config, generateInterfaceAction, generateSimpleAction, junittestAction);
				}
				ljutFrame.setVisible(true);
				ljutFrame.toFront();
			}
			
		};
		menu.add(openLjutFrame);
		
		menu.addSeparator();
		
		JMenu LCTconfigmenu = new JMenu("Tester configuration");
		
		menu.add(LCTconfigmenu);

		JCheckBoxMenuItem toggleCoreClassReplacement = new JCheckBoxMenuItem("Use core class replacement");
		toggleCoreClassReplacement.addItemListener(new ItemListener() {

			@Override
			public void itemStateChanged(ItemEvent e) {
				config.setUseCoreClassReplacement(e.getStateChange() == ItemEvent.SELECTED);
			}
		});
		LCTconfigmenu.add(toggleCoreClassReplacement);

		Action setLCTconnection = new LCTConnectionSettingAction(mainframe, config,"Set Tester connection properties...", null);
		JMenuItem lctconnection = new JMenuItem(setLCTconnection);
		LCTconfigmenu.add(lctconnection);

//		menu.add(setLCTconnection);


		Action LCTinstrusetting = new LCTInstrumentSettingAction(mainframe, config, "Set Tester instrumentation properties...", null);
		JMenuItem lctinstrusetting = new JMenuItem(LCTinstrusetting);
		LCTconfigmenu.add(lctinstrusetting);
		
//		menu.add(LCTinstrusetting);

		Action LCTtestsetting = new LCTTestSettingAction(mainframe, config, "Set Tester test strategies...", null);
		JMenuItem lcttestsetting = new JMenuItem(LCTtestsetting);
		LCTconfigmenu.add(lcttestsetting);

//		menu.add(LCTtestsetting);

		Action LCTsolversetting = new LCTSolverSettingAction(mainframe, config, "Set Tester constraint solver...", null);
		JMenuItem lctsolver = new JMenuItem(LCTsolversetting);
		LCTconfigmenu.add(lctsolver);
		
//		menu.add(LCTsolversetting);

		menubar.add(menu);

		// then the custom run command menu
		this.commandmenu = new JMenu("Commands");
		this.commandmenu.setMnemonic(KeyEvent.VK_M);
		menubar.add(this.commandmenu);

		// custom run commands
		Action addcustomaction = new AddCustomCmdAction(this.mainframe,
				this.commandmenu, this.runner, this.config,
				"Add custom run command...", KeyEvent.VK_A);
		this.commandmenu.add(new JMenuItem(addcustomaction));
		Action removecustomaction = new RemoveCustomCmdAction(this.mainframe,
				this.commandmenu, this.config, "Remove custom run command...", KeyEvent.VK_R);
		this.commandmenu.add(new JMenuItem(removecustomaction));
		this.commandmenu.addSeparator();
		Action extraclasspathaction = new SetExtraClasspathAction(
				this.mainframe, this.config, "Change CLASSPATH variable...", KeyEvent.VK_C);
		this.commandmenu.add(new JMenuItem(extraclasspathaction));
		Action extrapathaction = new SetExtraPathAction(this.mainframe,
				this.config, "Change PATH variable...", KeyEvent.VK_P);
		this.commandmenu.add(new JMenuItem(extrapathaction));
		
		this.commandmenu.addSeparator();
		
		// if some custom commands were loaded from the config file, add them
		// to the menu
		HashMap<String, Command> commands = this.config.getCommands();
		for (String i : commands.keySet()) {
			JMenuItem commanditem = new JMenuItem(new RunCustomCmdAction(
					this.runner, commands.get(i),
					i + " (" + commands.get(i).getCommandText() + ")", null));
			commanditem.setName(i);
			this.commandmenu.add(commanditem);
		}

		//configuration menu
		menu = new JMenu("Configuration");
		menu.setMnemonic(KeyEvent.VK_F);
		menubar.add(menu);
		//set the toolkit path, that is the folder of the whole package
		Action setpathaction = new SetToolkitAction(this.filechooser,
				this.mainframe, this.config,
				"Set toolkit path...", KeyEvent.VK_T);
		menu.add(new JMenuItem(setpathaction));
		menu.addSeparator();
		Action saveallconfigaction = new SaveConfigAction(this.config, "Save config", KeyEvent.VK_S);
		menu.add(new JMenuItem(saveallconfigaction));		

		// Create the toolbar.
		JToolBar toolBar = new JToolBar("Toolbar");
		// make the toolbar immovable
		toolBar.setFloatable(false);

		// the only actions we really need in the toolbar are the ones that
		// are used the most
		JButton button = null;
		// open button
		button = new JButton(setsourceaction);
		button.setText("   Open    ");
		toolBar.add(button);

		toolBar.addSeparator();

		// compile button
		button = new JButton(compileaction);
		button.setText("  Compile  ");
		toolBar.add(button);

		// run button
		button = new JButton(runaction);
		button.setText("    Run    ");
		toolBar.add(button);

		// emacs button
		button = new JButton(emacsaction);
		button.setText("   Emacs   ");
		toolBar.add(button);

		button = new JButton(startTracer);
		button.setText("   Tracer  ");
		toolBar.add(button);
		
		// set up the output text area
		this.logarea.setColumns(20);
		this.logarea.setRows(5);
		this.logarea.setBackground(new Color(255, 255, 255));
		this.logarea.setForeground(new Color(0, 0, 0));
		this.logarea.setEditable(false);
		this.logarea.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 16));
		this.actions = createActionTable(this.logarea);

		// Create the popup menu.
		JPopupMenu popup = new JPopupMenu();
		// add copy action to the popup menu
		JMenuItem menuItem = new JMenuItem(
				getActionByName(DefaultEditorKit.copyAction));
		menuItem.setText("Copy");
		popup.add(menuItem);

		// Add listener to the text area so the popup menu can come up.
		MouseListener popupListener = new PopupListener(popup);
		this.logarea.addMouseListener(popupListener);

		// in order to make the text area scrollable, we need to add it inside
		// a scrollpane
		JScrollPane scrollpane = new JScrollPane(this.logarea);

		// set up the status line
		this.statusline.setBackground(new Color(255, 255, 255));

		// if some directory was opened already, set the statuslocation
		File source = this.config.getSourceDir();
		if (source != null) {
			this.helper.setStatusLocation(source.getAbsolutePath());
		}
		this.helper.statusClean();

		// automatically generated (?) layout code
		GroupLayout layout = new GroupLayout(mainframe.getContentPane());
		mainframe.getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout.createParallelGroup(
				javax.swing.GroupLayout.Alignment.LEADING).addComponent(
				toolBar, javax.swing.GroupLayout.DEFAULT_SIZE, 500,
				Short.MAX_VALUE).addComponent(scrollpane,
				javax.swing.GroupLayout.DEFAULT_SIZE, 500, Short.MAX_VALUE)
				.addComponent(statusline, javax.swing.GroupLayout.DEFAULT_SIZE,
						500, Short.MAX_VALUE));
		layout
				.setVerticalGroup(layout
						.createParallelGroup(
								javax.swing.GroupLayout.Alignment.LEADING)
						.addGroup(
								layout
										.createSequentialGroup()
										.addComponent(
												toolBar,
												javax.swing.GroupLayout.PREFERRED_SIZE,
												25,
												javax.swing.GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(
												scrollpane,
												javax.swing.GroupLayout.DEFAULT_SIZE,
												400, Short.MAX_VALUE)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(
												statusline,
												javax.swing.GroupLayout.PREFERRED_SIZE,
												15,
												javax.swing.GroupLayout.PREFERRED_SIZE)
										.addContainerGap()));

		// finally finalize and show the frame
		this.mainframe.pack();
		this.mainframe.setVisible(true);
	}
	
	public void createAndShowC() {
		// first create the main frame
		this.mainframe = new JFrame();

		mainframe.setTitle("LIME Interface Testbench");
		this.mainframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// also initialize the filechooser
		this.filechooser = new JFileChooser();
		
		// create menubar
		JMenuBar menubar = new JMenuBar();
		menubar.setOpaque(true);
		menubar.setBackground(new Color(255, 255, 255));
		menubar.setPreferredSize(new Dimension(300, 20));

		this.mainframe.setJMenuBar(menubar);

		// create and populate menus for the menubar one at a time

		// first the 'Monitor' menu and necessary buttons
		JMenu menu = new JMenu("Monitor");
		menu.setMnemonic(KeyEvent.VK_M);

		Action setsourceaction = new SetSourceDirAction(this.filechooser,
				this.mainframe, this.helper, this.config,
				"Open source directory...", KeyEvent.VK_O);
		menu.add(new JMenuItem(setsourceaction));
		
		menu.addSeparator();
		
		// this is a critical action
		Action compileaction = new CompileCAction(this.mainframe, this.runner,
				this.config, "Compile", KeyEvent.VK_C);
		this.helper.addCritAction(compileaction);
		menu.add(new JMenuItem(compileaction));
		
		// this is a critical action
		Action runaction = new RunCAction(this.mainframe, this.runner,
				this.config, "Run", KeyEvent.VK_R);
		this.helper.addCritAction(runaction);
		menu.add(new JMenuItem(runaction));
		
		menu.addSeparator();
		
		Action exitaction = new ExitAction("Exit", KeyEvent.VK_X);
		menu.add(new JMenuItem(exitaction));

		menubar.add(menu);

		// then the custom run command menu
		this.commandmenu = new JMenu("Commands");
		this.commandmenu.setMnemonic(KeyEvent.VK_M);
		menubar.add(this.commandmenu);

		// custom run commands
		Action addcustomaction = new AddCustomCmdAction(this.mainframe,
				this.commandmenu, this.runner, this.config,
				"Add custom run command...", KeyEvent.VK_A);
		this.commandmenu.add(new JMenuItem(addcustomaction));
		Action removecustomaction = new RemoveCustomCmdAction(this.mainframe,
				this.commandmenu, this.config, "Remove custom run command...", KeyEvent.VK_R);
		this.commandmenu.add(new JMenuItem(removecustomaction));
		this.commandmenu.addSeparator();
		Action extraclasspathaction = new SetExtraClasspathAction(
				this.mainframe, this.config, "Add to CLASSPATH...", KeyEvent.VK_C);
		this.commandmenu.add(new JMenuItem(extraclasspathaction));
		Action extrapathaction = new SetExtraPathAction(this.mainframe,
				this.config, "Add to PATH...", KeyEvent.VK_P);
		this.commandmenu.add(new JMenuItem(extrapathaction));
		
		this.commandmenu.addSeparator();
		
		// if some custom commands were loaded from the config file, add them
		// to the menu
		HashMap<String, Command> commands = this.config.getCommands();
		for (String i : commands.keySet()) {
			JMenuItem commanditem = new JMenuItem(new RunCustomCmdAction(
					this.runner, commands.get(i),
					i + " (" + commands.get(i).getCommandText() + ")", null));
			commanditem.setName(i);
			this.commandmenu.add(commanditem);
		}

		//configuration menu
		menu = new JMenu("Configuration");
		menu.setMnemonic(KeyEvent.VK_F);
		menubar.add(menu);
		//set the toolkit path, that is the folder of the whole package
		Action setpathaction = new SetToolkitAction(this.filechooser,
				this.mainframe, this.config,
				"Set toolkit path...", KeyEvent.VK_T);
		menu.add(new JMenuItem(setpathaction));
		menu.addSeparator();
		Action saveallconfigaction = new SaveConfigAction(this.config, "Save config", KeyEvent.VK_S);
		menu.add(new JMenuItem(saveallconfigaction));		

		// Create the toolbar.
		JToolBar toolBar = new JToolBar("Toolbar");
		// make the toolbar immovable
		toolBar.setFloatable(false);

		// the only actions we really need in the toolbar are the ones that
		// are used the most
		JButton button = null;
		// open button
		button = new JButton(setsourceaction);
		button.setText("   Open    ");
		toolBar.add(button);

		toolBar.addSeparator();

		// compile button
		button = new JButton(compileaction);
		button.setText("  Compile  ");
		toolBar.add(button);

		// run button
		button = new JButton(runaction);
		button.setText("    Run    ");
		toolBar.add(button);
		
		// set up the output text area
		this.logarea.setColumns(20);
		this.logarea.setRows(5);
		this.logarea.setBackground(new Color(255, 255, 255));
		this.logarea.setForeground(new Color(0, 0, 0));
		this.logarea.setEditable(false);
		this.logarea.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 16));
		this.actions = createActionTable(this.logarea);

		// Create the popup menu.
		JPopupMenu popup = new JPopupMenu();
		// add copy action to the popup menu
		JMenuItem menuItem = new JMenuItem(
				getActionByName(DefaultEditorKit.copyAction));
		menuItem.setText("Copy");
		popup.add(menuItem);

		// Add listener to the text area so the popup menu can come up.
		MouseListener popupListener = new PopupListener(popup);
		this.logarea.addMouseListener(popupListener);

		// in order to make the text area scrollable, we need to add it inside
		// a scrollpane
		JScrollPane scrollpane = new JScrollPane(this.logarea);

		// set up the status line
		this.statusline.setBackground(new Color(255, 255, 255));

		// if some directory was opened already, set the statuslocation
		File source = this.config.getSourceDir();
		if (source != null) {
			this.helper.setStatusLocation(source.getAbsolutePath());
		}
		this.helper.statusClean();

		// automatically generated (?) layout code
		GroupLayout layout = new GroupLayout(mainframe.getContentPane());
		mainframe.getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout.createParallelGroup(
				javax.swing.GroupLayout.Alignment.LEADING).addComponent(
				toolBar, javax.swing.GroupLayout.DEFAULT_SIZE, 500,
				Short.MAX_VALUE).addComponent(scrollpane,
				javax.swing.GroupLayout.DEFAULT_SIZE, 500, Short.MAX_VALUE)
				.addComponent(statusline, javax.swing.GroupLayout.DEFAULT_SIZE,
						500, Short.MAX_VALUE));
		layout
				.setVerticalGroup(layout
						.createParallelGroup(
								javax.swing.GroupLayout.Alignment.LEADING)
						.addGroup(
								layout
										.createSequentialGroup()
										.addComponent(
												toolBar,
												javax.swing.GroupLayout.PREFERRED_SIZE,
												25,
												javax.swing.GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(
												scrollpane,
												javax.swing.GroupLayout.DEFAULT_SIZE,
												400, Short.MAX_VALUE)
										.addPreferredGap(
												javax.swing.LayoutStyle.ComponentPlacement.RELATED)
										.addComponent(
												statusline,
												javax.swing.GroupLayout.PREFERRED_SIZE,
												15,
												javax.swing.GroupLayout.PREFERRED_SIZE)
										.addContainerGap()));

		// finally finalize and show the frame
		this.mainframe.pack();
		this.mainframe.setVisible(true);
	}

	// The following two methods allow us to find an
	// action provided by the editor kit by its name.
	private HashMap<Object, Action> createActionTable(
			JTextComponent textComponent) {
		HashMap<Object, Action> actions = new HashMap<Object, Action>();
		Action[] actionsArray = textComponent.getActions();
		for (int i = 0; i < actionsArray.length; i++) {
			Action a = actionsArray[i];
			actions.put(a.getValue(Action.NAME), a);
		}
		return actions;
	}

	private Action getActionByName(String name) {
		return actions.get(name);
	}

}

class PopupListener extends MouseAdapter {
	JPopupMenu popup;

	PopupListener(JPopupMenu popupMenu) {
		popup = popupMenu;
	}

	public void mousePressed(MouseEvent e) {
		maybeShowPopup(e);
	}

	public void mouseReleased(MouseEvent e) {
		maybeShowPopup(e);
	}

	private void maybeShowPopup(MouseEvent e) {
		if (e.isPopupTrigger()) {
			popup.show(e.getComponent(), e.getX(), e.getY());
		}
	}
}
