/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * lctinstrumentset.java
 *
 * Created on Jul 21, 2009, 10:10:28 AM
 */

package fi.hut.ics.lime.gui;

import java.util.Properties;
import java.io.*;

/**
 *
 * @author xichen1
 */
public class LCTInstrumentSettingsDialog extends javax.swing.JDialog {

    private Config config;
	private String userFilePath = "null";
	private Properties properties;
	private boolean openFile = true;
	private File LCTpath = null;

    public LCTInstrumentSettingsDialog(java.awt.Frame parent, boolean modal, Config config) {
        super(parent, modal);
		this.config = config;
        initComponents();
    }

    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        instrumentationType = new javax.swing.JComboBox();
        concurrency = new javax.swing.JComboBox();
        executionVerbosity = new javax.swing.JSpinner();
        instrumentationVerbosity = new javax.swing.JSpinner();
        okButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("Instrumentation type");

        jLabel2.setText("Concurrency");

        jLabel3.setText("Execution verbosity");

        jLabel4.setText("Instrumentation verbosity");

        instrumentationType.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "basic", "object" }));

        concurrency.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "false", "true" }));

        executionVerbosity.setModel(new javax.swing.SpinnerNumberModel(Integer.valueOf(1), Integer.valueOf(1), null, Integer.valueOf(1)));

        instrumentationVerbosity.setModel(new javax.swing.SpinnerNumberModel(Integer.valueOf(1), Integer.valueOf(1), null, Integer.valueOf(1)));
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
		
		if(openFile) {

			instrumentationType.setSelectedItem(properties.getProperty("instrumentationType"));
			concurrency.setSelectedItem(properties.getProperty("concurrency"));
			executionVerbosity.setValue(Integer.valueOf(properties.getProperty("executionVerbosity")));
			instrumentationVerbosity.setValue(Integer.valueOf(properties.getProperty("instrumentationVerbosity")));
			
		}
		
        okButton.setText("Ok");
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
        
		setTitle("Instrument settings");
		setResizable(false);
		
        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel3))
                                .addGap(42, 42, 42))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(instrumentationType, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(concurrency, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(executionVerbosity, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 76, Short.MAX_VALUE)
                            .addComponent(instrumentationVerbosity, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 76, Short.MAX_VALUE)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(okButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cancelButton)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {cancelButton, okButton});

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {concurrency, executionVerbosity, instrumentationType, instrumentationVerbosity});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(instrumentationType, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(concurrency, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(executionVerbosity, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(instrumentationVerbosity, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(okButton))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {concurrency, executionVerbosity, instrumentationType, instrumentationVerbosity});

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {cancelButton, okButton});

        pack();
    }

	//when ok, the settings will be written into the user setting file
	private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {

		properties.setProperty("instrumentationType", instrumentationType.getSelectedItem().toString());
		properties.setProperty("concurrency", concurrency.getSelectedItem().toString());
		properties.setProperty("executionVerbosity", executionVerbosity.getValue().toString());
		properties.setProperty("instrumentationVerbosity", instrumentationVerbosity.getValue().toString());

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
    private javax.swing.JComboBox concurrency;
    private javax.swing.JSpinner executionVerbosity;
    private javax.swing.JComboBox instrumentationType;
    private javax.swing.JSpinner instrumentationVerbosity;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JButton okButton;
    // End of variables declaration

}
