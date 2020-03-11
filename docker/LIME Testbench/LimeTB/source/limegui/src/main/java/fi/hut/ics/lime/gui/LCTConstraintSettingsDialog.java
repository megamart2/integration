/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * lctconstraintsetting.java
 * lct menu constraint solver menu item
 * Created on Jul 22, 2009, 12:48:10 PM
 */

package fi.hut.ics.lime.gui;

import java.util.Properties;
import java.io.*;

/**
 *
 * @author xichen1
 */
public class LCTConstraintSettingsDialog extends javax.swing.JDialog {

    private Config config;
	private File LCTpath = null;
	private String userFilePath = "null";
	private Properties properties;
	private boolean openFile = true;

    public LCTConstraintSettingsDialog(java.awt.Frame parent, boolean modal, Config config) {
        super(parent, modal);
		this.config = config;
        initComponents();
    }


    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        solver = new javax.swing.JComboBox();
        okButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Constraint solver settings");
        setResizable(false);

        jLabel1.setText("solver");

        solver.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Boolector", "Yices" }));
		getRootPane().setDefaultButton(okButton);

		this.properties = new java.util.Properties();
		LCTpath = config.getBinDir();

		if (LCTpath!=null) {
			userFilePath = LCTpath.getParent() +File.separator+"testerproperties/usersettings.properties";
		} else {
			userFilePath = "testerproperties/usersettings.properties";
		}
		
		try {
			BufferedReader fileReader = new BufferedReader(new FileReader(userFilePath));
			properties.load(fileReader);
		} catch(Exception e) {
			this.openFile = false;
		}
		
		if (openFile) {
			solver.setSelectedItem(properties.getProperty("solver"));
		}

        okButton.setText("OK");
        okButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                okButtonActionPerformed(evt);
            }
        });

        cancelButton.setMnemonic('C');
        cancelButton.setText("Cancel");
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel1)
                .addGap(27, 27, 27)
                .addComponent(solver, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(72, Short.MAX_VALUE)
                .addComponent(okButton)
                .addGap(18, 18, 18)
                .addComponent(cancelButton)
                .addContainerGap())
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {cancelButton, okButton});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(solver, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(okButton))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {cancelButton, okButton});

        pack();
    }

	private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {

		properties.setProperty("solver", solver.getSelectedItem().toString());

		try {

			BufferedWriter fileWriter = new BufferedWriter(
					new FileWriter(userFilePath));
			properties.store(fileWriter, "LCT settings");
			fileWriter.close();
		}
		catch (Exception e) {
			System.out.println("write failed: "+e);
		}

		setVisible(false);
	}

	private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {
		setVisible(false);
	}

	public boolean isFileValid() {
		return openFile;
	}

    // Variables declaration - do not modify
    private javax.swing.JButton cancelButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JButton okButton;
    private javax.swing.JComboBox solver;
    // End of variables declaration

}
