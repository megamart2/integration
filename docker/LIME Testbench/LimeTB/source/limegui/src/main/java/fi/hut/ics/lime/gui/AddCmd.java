package fi.hut.ics.lime.gui;

import java.awt.Component;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JRootPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
import javax.swing.SwingConstants;
import javax.swing.WindowConstants;

import java.io.*;

/**
 * the dialog of add a command in "Command" menu
 * 
 * @author xichen1
 */
public class AddCmd extends JDialog {

	private static final String FILL_FIELDS_MESSAGE = 
		"Please fill in all the fields and make\n" +
		"sure the working directory is a directory.";

	/** Creates new form addCmd */
	public AddCmd(Frame parent) {
		super(parent, true);
		initComponents();
	}

	private void initComponents() {
		nameLabel = new JLabel();
		dirLabel = new JLabel();
		commandLabel = new JLabel();
		nameField = new JTextField();
		dirField = new JTextField();
		commandScrollPane = new JScrollPane();
		commandArea = new JTextArea();
		cancelButton = new JButton();
		okButton = new JButton();

		setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		setTitle("Add a new command");

		nameLabel.setText("Name: (only used as an identifier in the UI)");
		
		dirLabel.setText("Working directory: (where the command should be run)");

		commandLabel.setText("Command: (the actual command to run, should be found in PATH)");

		nameField.setFont(new java.awt.Font("DejaVu Sans", 0, 14)); // NOI18N
		
		dirField.setFont(new java.awt.Font("DejaVu Sans", 0, 14)); // NOI18N

		commandArea.setColumns(20);
		commandArea.setFont(new java.awt.Font("DejaVu Sans", 0, 14)); // NOI18N
		commandArea.setLineWrap(true);
		commandArea.setRows(5);
		commandScrollPane.setViewportView(commandArea);
		JRootPane rp = this.getRootPane();
		rp.setDefaultButton(okButton);

		cancelButton.setMnemonic('C');
		cancelButton.setText("Cancel");
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				cancelButtonActionPerformed(evt);
			}
		});

		okButton.setText("OK");
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				okButtonActionPerformed(evt);
			}
		});
		
		GroupLayout layout = new GroupLayout(getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
				.addGroup(GroupLayout.Alignment.TRAILING,
				layout.createSequentialGroup().addContainerGap().addGroup(
						layout.createParallelGroup(GroupLayout.Alignment.TRAILING)
						.addComponent(nameField, GroupLayout.Alignment.LEADING,
								GroupLayout.DEFAULT_SIZE, 376, Short.MAX_VALUE)
						.addComponent(dirField, GroupLayout.Alignment.LEADING,
								GroupLayout.DEFAULT_SIZE, 376, Short.MAX_VALUE)
						.addComponent(commandScrollPane, GroupLayout.Alignment.LEADING, 
								GroupLayout.DEFAULT_SIZE, 376, Short.MAX_VALUE)
						.addComponent(nameLabel,
								GroupLayout.Alignment.LEADING)
						.addComponent(dirLabel,
								GroupLayout.Alignment.LEADING)
						.addComponent(commandLabel,
								GroupLayout.Alignment.LEADING)
								.addGroup(
										layout.createSequentialGroup()
												.addComponent(okButton)
												.addGap(18, 18, 18)
												.addComponent(cancelButton)))
						.addContainerGap()));

		layout.linkSize(SwingConstants.HORIZONTAL, new Component[] {
				cancelButton, okButton });

		layout.setVerticalGroup(layout.createParallelGroup(
				GroupLayout.Alignment.LEADING).addGroup(
				layout.createSequentialGroup().addContainerGap().addComponent(
						nameLabel).addPreferredGap(
						LayoutStyle.ComponentPlacement.UNRELATED).addComponent(
						nameField, GroupLayout.PREFERRED_SIZE, 27,
						GroupLayout.PREFERRED_SIZE).addPreferredGap(
						LayoutStyle.ComponentPlacement.UNRELATED).addComponent(
						dirLabel).addPreferredGap(
						LayoutStyle.ComponentPlacement.UNRELATED).addComponent(
						dirField, GroupLayout.PREFERRED_SIZE, 27,
						GroupLayout.PREFERRED_SIZE).addPreferredGap(
						LayoutStyle.ComponentPlacement.UNRELATED).addComponent(
						commandLabel).addPreferredGap(
						LayoutStyle.ComponentPlacement.RELATED).addComponent(
						commandScrollPane).addPreferredGap(
						LayoutStyle.ComponentPlacement.RELATED).addGroup(
						layout.createParallelGroup(
								GroupLayout.Alignment.BASELINE).addComponent(
								cancelButton).addComponent(okButton))
						.addContainerGap()));

		pack();
	}

	public void clear() {
		nameField.setText(null);
		commandArea.setText(null);
		result = null;
	}

	public OkCancelDialogResult getResult() {
		return result;
	}

	public String getNameText() {
		return nameField.getText();
	}
	
	public String getDirText() {
		return dirField.getText();
	}

	public String getCommandText() {
		return commandArea.getText();
	}

	private boolean validateInput() {
		File workdir = new File(dirField.getText());
		return !(nameField.getText().trim().length() == 0 || commandArea
				.getText().trim().length() == 0 || !workdir.exists() || !workdir.isDirectory());
	}

	private void okButtonActionPerformed(ActionEvent evt) {
		if (validateInput()) {
			result = OkCancelDialogResult.OK;
			this.setVisible(false);
			this.dispose();
		} else {
			JOptionPane.showMessageDialog(this, FILL_FIELDS_MESSAGE);
		}
	}

	private void cancelButtonActionPerformed(ActionEvent evt) {
		nameField.setText(null);
		commandArea.setText(null);
		result = OkCancelDialogResult.CANCEL;
		this.setVisible(false);
		this.dispose();
	}

	private JButton cancelButton;
	private JTextArea commandArea;
	private JLabel nameLabel;
	private JLabel dirLabel;
	private JLabel commandLabel;
	private JScrollPane commandScrollPane;
	private JTextField nameField;
	private JTextField dirField;
	private JButton okButton;
	private OkCancelDialogResult result;
}
