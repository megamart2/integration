/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * lctconnectset.java
 *	lct menu connect setting menuitem
 * Created on Jul 20, 2009, 3:40:59 PM
 */

package fi.hut.ics.lime.gui;

import java.util.Properties;
import java.io.*;

/**
 *
 * @author xichen1
 */
public class LCTConnectSettingsDialog extends javax.swing.JDialog {

	private Config config;
    private Properties properties;
	private File LCTpath = null;
	private String userFilePath="null";
	private boolean openFile = true;
	
    public LCTConnectSettingsDialog(java.awt.Frame parent, boolean modal, Config lctconfig) {
        super(parent, modal);
		this.config = lctconfig;
        initComponents();
    }


    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        serverIP = new javax.swing.JTextField();
        serverPort = new javax.swing.JTextField();
        okButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Connection Settings");
        setResizable(false);

        jLabel2.setText("ServerIP");

        jLabel3.setText("ServerPort");

        properties = new java.util.Properties();

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
			openFile = false;
		}
		
		if (openFile) {
			serverIP.setText(properties.getProperty("serverIP"));
			serverPort.setText(properties.getProperty("serverPort"));
		}

        okButton.setText("OK");

        okButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                okButtonActionPerformed(evt);
            }
        });

		getRootPane().setDefaultButton(okButton);

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
                    .addComponent(jLabel2)
                    .addComponent(jLabel3))
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(okButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cancelButton))
                    .addComponent(serverIP, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 127, Short.MAX_VALUE)
                    .addComponent(serverPort, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 127, Short.MAX_VALUE))
                .addContainerGap())
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {cancelButton, okButton});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(serverIP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(serverPort, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(okButton))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }

	private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {
		setVisible(false);
	}

	private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {
        /* Loading settings */

		properties.setProperty("serverPort", serverPort.getText());
		properties.setProperty("serverIP", serverIP.getText());

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

	public boolean isFileValid() {
		return openFile;
	}

    // Variables declaration - do not modify
    private javax.swing.JButton cancelButton;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JButton okButton;
    private javax.swing.JTextField serverIP;
    private javax.swing.JTextField serverPort;
    // End of variables declaration

}
