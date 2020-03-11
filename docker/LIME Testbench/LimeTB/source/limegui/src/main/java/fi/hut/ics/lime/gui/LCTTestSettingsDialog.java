/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * lcttestset.java
 * the lct test strategies setting
 * Created on Jul 20, 2009, 3:33:28 PM
 */

package fi.hut.ics.lime.gui;

import java.util.Properties;
import java.io.*;

/**
 *
 * @author xichen1
 */
public class LCTTestSettingsDialog extends javax.swing.JDialog {

	private Config config;
	private File LCTpath = null;
	private String userFilePath = "null";
	private Properties properties;
	private boolean openFile = true;
	
    public LCTTestSettingsDialog(java.awt.Frame parent, boolean modal, Config config) {
        super(parent, modal);
		this.config = config;
        initComponents();
    }

    private void initComponents() {

        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        seed = new javax.swing.JTextField();
        strategy = new javax.swing.JComboBox();
        maxDepth = new javax.swing.JSpinner();
        ServerVerbosity = new javax.swing.JSpinner();
        testRuns = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        okButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();
		maxDefects = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Test strategies");
        setMinimumSize(new java.awt.Dimension(0, 317));
        setResizable(false);

        jLabel8.setText("Seed");

        jLabel9.setText("Strategy");

        jLabel10.setText("maxDepth");

        jLabel11.setText("ServerVerbosity");

        jLabel12.setText("testRuns");

        

        strategy.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "random priority", "DFS", "random" }));

        maxDepth.setModel(new javax.swing.SpinnerNumberModel(Integer.valueOf(5000), Integer.valueOf(0), null, Integer.valueOf(1)));

        ServerVerbosity.setModel(new javax.swing.SpinnerNumberModel(Integer.valueOf(1), null, null, Integer.valueOf(1)));


        jLabel1.setText("maxDefects");


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
		} catch (Exception e) {	
			this.openFile = false;
		}
		
		if (openFile) {
			seed.setText(properties.getProperty("seed"));
			maxDepth.setValue(Integer.valueOf(properties.getProperty("maxDepth")));
			ServerVerbosity.setValue(Integer.valueOf(properties.getProperty("serverVerbosity")));
			testRuns.setText(properties.getProperty("testRuns"));
			maxDefects.setText(properties.getProperty("maxDefects"));
			strategy.setSelectedItem(properties.getProperty("strategy"));
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
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel10)
                            .addComponent(jLabel1)
                            .addComponent(jLabel12)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)
                            .addComponent(jLabel11))
                        .addGap(20, 20, 20)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(maxDefects, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE)
                                    .addComponent(testRuns, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE)
                                    .addComponent(seed, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE)
                                    .addComponent(strategy, 0, 139, Short.MAX_VALUE)
                                    .addComponent(maxDepth, javax.swing.GroupLayout.DEFAULT_SIZE, 139, Short.MAX_VALUE))
                                .addGap(13, 13, 13))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(ServerVerbosity, javax.swing.GroupLayout.DEFAULT_SIZE, 140, Short.MAX_VALUE)
                                .addContainerGap())))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(okButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cancelButton)
                        .addContainerGap())))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {cancelButton, okButton});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(seed, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8))
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(strategy, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(maxDepth, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ServerVerbosity, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel12)
                    .addComponent(testRuns, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(maxDefects, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(okButton))
                .addContainerGap(18, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {ServerVerbosity, maxDefects, maxDepth, seed, strategy, testRuns});

        pack();
    }

	private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {

		properties.setProperty("seed", seed.getText());
		properties.setProperty("testRuns", testRuns.getText());
		properties.setProperty("maxDefects", maxDefects.getText());
		properties.setProperty("maxDepth", maxDepth.getValue().toString());
		properties.setProperty("serverVerbosity", ServerVerbosity.getValue().toString());
		properties.setProperty("strategy", strategy.getSelectedItem().toString());

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
    private javax.swing.JSpinner ServerVerbosity;
    private javax.swing.JButton cancelButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JTextField maxDefects;
    private javax.swing.JSpinner maxDepth;
    private javax.swing.JButton okButton;
    private javax.swing.JTextField seed;
    private javax.swing.JComboBox strategy;
    private javax.swing.JTextField testRuns;
    // End of variables declaration

}
