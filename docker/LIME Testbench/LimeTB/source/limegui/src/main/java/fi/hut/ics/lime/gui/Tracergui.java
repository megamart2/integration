package fi.hut.ics.lime.gui;

import javax.swing.JFileChooser;
import javax.swing.text.DefaultEditorKit;
import javax.swing.JPopupMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.JTextField;
import javax.swing.JTextArea;
import java.awt.event.*;
import java.io.*;

public class Tracergui extends javax.swing.JFrame {
	
	private static final String LOGFILENAME = "runlog";

	private Config config;
	private Runner runner;
	private JFileChooser filechooser;
	private File logfile;
	
	public Tracergui(Config config, Runner runner, JFileChooser filechooser) {
		this.config = config;
		this.runner = runner;
		this.filechooser = filechooser;
		this.logfile = null;

		initComponents();

		this.getRootPane().setDefaultButton(showButton);

		outputarea.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e)
			{
				if (e.isPopupTrigger())
				{
					JPopupMenu popup = getOutputPopup(outputarea);
					popup.show(e.getComponent(), e.getX(), e.getY());
				}
			}
		});

		specifications.addMouseListener(new MouseAdapter() {
			
			private JPopupMenu popup = getFieldPopup(specifications);
			
			public void mousePressed(MouseEvent e)
			{
				if (e.isPopupTrigger())
				{
					this.popup.show(e.getComponent(), e.getX(), e.getY());
				}
			}
		});

		observers.addMouseListener(new MouseAdapter() {
			
			private JPopupMenu popup = getFieldPopup(observers);
			
			public void mousePressed(MouseEvent e)
			{
				if (e.isPopupTrigger())
				{
					this.popup.show(e.getComponent(), e.getX(), e.getY());
				}
			}
		});
	}
	
	public void updateAndShow() {
		this.logfile = null;
		this.outputarea.setText("");
		this.logfilefield.setText("");
		this.setVisible(true);
		
		if (this.config.getSpoonDir() != null && this.config.getSpoonDir().exists()) {
			File tmpfile = new File(this.config.getSpoonDir().getAbsolutePath()+File.separator+LOGFILENAME);
			if (tmpfile != null && tmpfile.exists()) {
				this.logfile = tmpfile;
				this.logfilefield.setText(this.logfile.getAbsolutePath());
				this.runner.runTracer(this.getOutputArea(), this.getTracerCmd());
			}
		}
	}
    
	public Command getTracerCmd() {

		String[] cmd = new String[8];
		cmd[0] = "/bin/bash";
		cmd[1] = this.config.getBinDir() + File.separator + "tracer";
		cmd[2] = this.logfile.getAbsolutePath();
		cmd[3] = "";
		cmd[4] = "";
		cmd[5] = "";
		cmd[6] = "";
		cmd[7] = "";
		if(this.summary.isSelected()) cmd[3] = "-i";
		if(this.noindent.isSelected()) cmd[4] = "-n";
		int verb = this.verbosity.getSelectedIndex();
		if (verb == 1)
			cmd[5] = "-v";
		else if (verb == 2)
			cmd[5] = "-vv";
		String specparameter = specifications.getText().trim().replaceAll(" ", "");
		if(!specparameter.equals("")) cmd[6] = "-ws"+specparameter;
		String observerparameter = observers.getText().trim().replaceAll(" ", "");
		if(!observerparameter.equals("")) cmd[7] = "-wo"+observerparameter;
		
		return new Command(cmd, this.config.getEnvironment(), this.config.getSourceDir(), 
				"Encountered an error.");
	}

	private void initComponents() {

		chooseButton = new javax.swing.JButton();
		showButton = new javax.swing.JButton();
		outputscrollpane = new javax.swing.JScrollPane();
		outputarea = new javax.swing.JTextArea();
		logfilelabel = new javax.swing.JLabel();
		logfilefield = new javax.swing.JTextField();
		speclabel = new javax.swing.JLabel();
		specifications = new javax.swing.JTextField();
		observerlabel = new javax.swing.JLabel();
		observers = new javax.swing.JTextField();
		verbositylabel = new javax.swing.JLabel();
		noindent = new javax.swing.JCheckBox();
		summary = new javax.swing.JCheckBox();

		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
		setTitle("Tracer");

		chooseButton.setText("Browse...");
		chooseButton.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				chooseButtonActionPerformed(evt);
			}
		});

		showButton.setText("Show");
		showButton.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				showButtonActionPerformed(evt);
			}
		});

		outputarea.setColumns(20);
		outputarea.setEditable(false);
		outputarea.setLineWrap(true);
		outputarea.setRows(5);
		outputscrollpane.setViewportView(outputarea);

		logfilelabel.setText("Log file");

		logfilefield.setEditable(false);
		logfilefield.setMinimumSize(new java.awt.Dimension(0, 0));

		speclabel.setText("Specifications");

		observerlabel.setText("Observers");

		noindent.setText("No indent");

		summary.setText("Summary");

		verbositylabel.setText("Verbosity:");
		
		String[] verbositylevels = { "simple", "propositions", "stacktraces" };
		verbosity = new javax.swing.JComboBox(verbositylevels);
		verbosity.setSelectedIndex(0);

		javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addComponent(outputscrollpane, javax.swing.GroupLayout.DEFAULT_SIZE, 713, Short.MAX_VALUE)
				.addGroup(layout.createSequentialGroup()
						.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
								.addGroup(layout.createSequentialGroup()
										.addContainerGap()
										.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
												.addComponent(logfilelabel)
												.addComponent(speclabel))
												.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
												.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
														.addComponent(logfilefield, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 425, Short.MAX_VALUE)
														.addComponent(specifications, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 425, Short.MAX_VALUE)
														.addComponent(observers, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 425, Short.MAX_VALUE)))
														.addGroup(layout.createSequentialGroup()
																.addGap(12, 12, 12)
																.addComponent(observerlabel)
																.addGap(460, 460, 460)))
																.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
																		.addGroup(layout.createSequentialGroup()
																				.addComponent(chooseButton)
																				.addGap(18, 18, 18)
																				.addComponent(showButton))
																		.addGroup(layout.createSequentialGroup()
																				.addComponent(noindent)
																				.addGap(10, 10, 10)
																				.addComponent(summary))
																		.addGroup(layout.createSequentialGroup()
																				.addComponent(verbositylabel)
																				.addGap(10, 10, 10)
																				.addComponent(verbosity)))
																				.addContainerGap())
		);

		layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {chooseButton, showButton});

		layout.setVerticalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addGroup(layout.createSequentialGroup()
						.addContainerGap()
						.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
								.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE, false)
										.addComponent(logfilelabel)
										.addComponent(logfilefield, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
										.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
												.addComponent(showButton)
												.addComponent(chooseButton)))
												.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
												.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
														.addComponent(speclabel)
														.addComponent(specifications, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
														.addComponent(noindent)
														.addComponent(summary))
														.addGap(12, 12, 12)
														.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
																.addComponent(observerlabel)
																.addComponent(observers, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
																.addComponent(verbositylabel)
																.addComponent(verbosity))
																.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
																.addComponent(outputscrollpane, javax.swing.GroupLayout.DEFAULT_SIZE, 369, Short.MAX_VALUE))
		);

		pack();
	}

	private void chooseButtonActionPerformed(java.awt.event.ActionEvent evt) {
		this.filechooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
		// some guessing about where the log file might be
		if (this.config.getSpoonDir() != null && this.config.getSpoonDir().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getSpoonDir());
		}
		else if (this.config.getSourceDir() != null && this.config.getSourceDir().exists()) {
			this.filechooser.setCurrentDirectory(this.config.getSourceDir());
		}
		else {
			this.filechooser.setCurrentDirectory(null);
		}
		int retval = filechooser.showOpenDialog(this);
		if (retval == JFileChooser.APPROVE_OPTION) {
			this.logfile = filechooser.getSelectedFile();
			this.logfilefield.setText(this.logfile.getAbsolutePath());
		}
	}

	private void showButtonActionPerformed(java.awt.event.ActionEvent evt) {
		this.outputarea.setText("");
		if(this.logfile != null) {
			this.runner.runTracer(this.getOutputArea(), this.getTracerCmd());
		} else {
			JOptionPane.showMessageDialog(this, "Pleas choose a valid log file first.");
		}
	}

	private JPopupMenu getOutputPopup(final JTextArea outputarea) {
		
		JPopupMenu outputpopup = new JPopupMenu();
		Action copyAction = new AbstractAction(DefaultEditorKit.copyAction) {
			public void actionPerformed(ActionEvent e) {
				outputarea.copy();
			}
		};
		copyAction.putValue(Action.NAME, "Copy");

		JMenuItem copy = new JMenuItem(copyAction);
		outputpopup.add(copy);

		return outputpopup;
		
	}

	private JPopupMenu getFieldPopup(final JTextField jtextField) {

		JPopupMenu fieldpopup = new JPopupMenu();
		Action copyAction = new AbstractAction(DefaultEditorKit.copyAction) {
			public void actionPerformed(ActionEvent e) {
				jtextField.copy();
			}
		};
		copyAction.putValue(Action.NAME, "Copy");

		Action pasteAction = new AbstractAction(DefaultEditorKit.pasteAction) {
			public void actionPerformed(ActionEvent e) {
				jtextField.paste();
			}
		};
		pasteAction.putValue(Action.NAME, "Paste");

		JMenuItem copy = new JMenuItem(copyAction);
		fieldpopup.add(copy);
		JMenuItem paste = new JMenuItem(pasteAction);
		fieldpopup.add(paste);

		return fieldpopup;
		
	}
	
	public JTextArea getOutputArea() {
		return this.outputarea;
	}

	private javax.swing.JButton chooseButton;
	private javax.swing.JButton showButton;
	private javax.swing.JLabel logfilelabel;
	private javax.swing.JLabel speclabel;
	private javax.swing.JLabel observerlabel;
	private javax.swing.JLabel verbositylabel;
	private javax.swing.JComboBox verbosity;
	private javax.swing.JScrollPane outputscrollpane;
	private javax.swing.JTextField logfilefield;
	private javax.swing.JTextField specifications;
	private javax.swing.JTextField observers;
	private javax.swing.JTextArea outputarea;
	private javax.swing.JCheckBox summary;
	private javax.swing.JCheckBox noindent;

}
