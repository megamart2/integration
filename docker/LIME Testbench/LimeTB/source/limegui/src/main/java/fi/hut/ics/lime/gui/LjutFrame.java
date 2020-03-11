package fi.hut.ics.lime.gui;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.io.File;

import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JToolBar;

import net.miginfocom.swing.MigLayout;

public class LjutFrame extends JFrame {

	public LjutFrame(Config config, Action actualInterfaceGenAction,
			Action actualSimpleGenAction, Action actualJUnitGenAction) {
		super("Test drivers and JUnit tests");
		initComponents(config.getPropertyDir(), config.getParameterDir());
		createLayout();
		createActions(actualInterfaceGenAction, actualSimpleGenAction,
				actualJUnitGenAction, config);
		setDefaultCloseOperation(HIDE_ON_CLOSE);
	}

	private void initComponents(File defaultPropertiesFilePath,
			File defaultParametersFilePath) {
		propertiesFileLabel = new JLabel("Driver properties file:");
		propertiesFilePathField = new JTextField(
				defaultPropertiesFilePath == null ? ""
						: defaultPropertiesFilePath.getAbsolutePath());
		choosePropertiesFileButton = new JButton();
		parametersFileLabel = new JLabel("Test parameters file:");
		parametersFilePathField = new JTextField(
				defaultParametersFilePath == null ? ""
						: defaultParametersFilePath.getAbsolutePath());
		chooseParametersFileButton = new JButton();
		generateInterfaceTestDriverButton = new JButton();
		generateSimpleTestDriverButton = new JButton();
		generateJUnitTestsButton = new JButton();
		toolPanel = new JToolBar();
		toolPanel.setFloatable(false);
		toolPanel.add(generateSimpleTestDriverButton);
		toolPanel.add(generateInterfaceTestDriverButton);
		toolPanel.add(generateJUnitTestsButton);
	}

	private void createLayout() {
		MigLayout layout = new MigLayout("", // Layout constraints
				"[grow][]", // Column constraints
				"u[]r[]u[]r[]" // Row constraints
		);

		setLayout(layout);

		add(toolPanel, "north");

		add(propertiesFileLabel, "wrap");
		add(propertiesFilePathField, "width 100::, growx");
		add(choosePropertiesFileButton, "wrap");
		add(parametersFileLabel, "wrap");
		add(parametersFilePathField, "width 100::, growx");
		add(chooseParametersFileButton, "wrap");

		setMinimumSize(new Dimension(600, 200)); 
		/*
		 * TODO: This is the wrong way
		 * to do this. (Possibly
		 * platform dependent etc.)
		 */
		setPreferredSize(layout.preferredLayoutSize(this));
		setMaximumSize(layout.maximumLayoutSize(this));

		pack();
	}

	private void createActions(final Action actualInterfaceGenAction,
			final Action actualSimpleGenAction,
			final Action actualJUnitGenAction, final Config config) {
		choosePropertiesFile = new AbstractAction("Choose...") {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser chooser = new JFileChooser();
				chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
				if (chooser.showOpenDialog(LjutFrame.this) == JFileChooser.APPROVE_OPTION) {
					propertiesFilePathField.setText(chooser.getSelectedFile()
							.getAbsolutePath());
				}
			}
		};
		choosePropertiesFileButton.setAction(choosePropertiesFile);

		chooseParametersFile = new AbstractAction("Choose...") {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser chooser = new JFileChooser();
				chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
				if (chooser.showOpenDialog(LjutFrame.this) == JFileChooser.APPROVE_OPTION) {
					parametersFilePathField.setText(chooser.getSelectedFile()
							.getAbsolutePath());
				}
			}
		};
		chooseParametersFileButton.setAction(chooseParametersFile);

		generateInterfaceTestDriver = new AbstractAction(
				"Generate interface test driver...") {
			@Override
			public void actionPerformed(ActionEvent e) {
				actualInterfaceGenAction.actionPerformed(e);
				if (config.getPropertyDir() != null)
					propertiesFilePathField.setText(config.getPropertyDir()
						.getAbsolutePath());
			}
		};
		generateInterfaceTestDriverButton
				.setAction(generateInterfaceTestDriver);

		generateSimpleTestDriver = new AbstractAction(
				"Generate method unit test driver...") {
			@Override
			public void actionPerformed(ActionEvent e) {
				actualSimpleGenAction.actionPerformed(e);
				if (config.getPropertyDir() != null)
					propertiesFilePathField.setText(config.getPropertyDir()
						.getAbsolutePath());
			}
		};
		generateSimpleTestDriverButton.setAction(generateSimpleTestDriver);

		generateJUnitTests = new AbstractAction("Save as JUnit tests...") {
			@Override
			public void actionPerformed(ActionEvent e) {
				File propertiesFile = new File(propertiesFilePathField
						.getText());
				if (!propertiesFile.exists()) {
					JOptionPane.showMessageDialog(LjutFrame.this,
							"The properties file "
									+ propertiesFilePathField.getText()
									+ " does not exist.");
				}
				config.setPropertyDir(propertiesFile);
				File parametersFile = new File(parametersFilePathField
						.getText());
				if (!parametersFile.exists()) {
					JOptionPane.showMessageDialog(LjutFrame.this,
							"The parameters file "
									+ parametersFilePathField.getText()
									+ " does not exist.");
				}
				config.setParameterDir(parametersFile);
				actualJUnitGenAction.actionPerformed(e);
			}
		};
		generateJUnitTestsButton.setAction(generateJUnitTests);
	}

	private Action choosePropertiesFile;
	private Action chooseParametersFile;
	private Action generateInterfaceTestDriver;
	private Action generateSimpleTestDriver;
	private Action generateJUnitTests;

	private JLabel propertiesFileLabel;
	private JTextField propertiesFilePathField;
	private JButton choosePropertiesFileButton;
	private JLabel parametersFileLabel;
	private JTextField parametersFilePathField;
	private JButton chooseParametersFileButton;
	private JToolBar toolPanel;
	private JButton generateInterfaceTestDriverButton;
	private JButton generateSimpleTestDriverButton;
	private JButton generateJUnitTestsButton;
}
