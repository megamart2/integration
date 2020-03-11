package fi.hut.ics.lime.gui;

import javax.swing.SpinnerNumberModel;

public class InterfaceDriverGenDialog extends javax.swing.JDialog {

    public InterfaceDriverGenDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();		
    }

    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        interfaceArea = new javax.swing.JTextArea();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        constructorArea = new javax.swing.JTextArea();
        interation = new javax.swing.JSpinner();
        jLabel3 = new javax.swing.JLabel();
        okButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(531, 336));
		this.setTitle("Generate LCT Test Code from interface");
		addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });
		
        jLabel1.setText("Interface name:");

        jScrollPane1.setAutoscrolls(true);

        interfaceArea.setColumns(20);
        interfaceArea.setLineWrap(true);
        interfaceArea.setRows(5);
        jScrollPane1.setViewportView(interfaceArea);

        jLabel2.setText("Constructor name:");

        constructorArea.setColumns(20);
        constructorArea.setLineWrap(true);
        constructorArea.setRows(5);
        jScrollPane2.setViewportView(constructorArea);

        interation.setModel(new javax.swing.SpinnerNumberModel(Integer.valueOf(2), Integer.valueOf(1), null, Integer.valueOf(1)));
        interation.setToolTipText("The testing time increases as interation number increases");
        interation.setAutoscrolls(true);
        interation.setEditor(new javax.swing.JSpinner.NumberEditor(interation, ""));
        interation.setValue(2);

        jLabel3.setText("Interation number: (the number of methods to call on each testing pass)");

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

        jLabel4.setText("(a fully qualified name of an interface)");
        
        jLabel5.setText("<qualified name> or <qualified name>(<parameters>), where <parameters>");
        jLabel6.setText("is a comma separated list of qualified parameter class names, e.g.");
        jLabel7.setText(" \"java.lang.Integer(int)\" or \"java.lang.String\".");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 507, Short.MAX_VALUE)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 507, Short.MAX_VALUE)
                            .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel6, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.LEADING))
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(interation, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 314, Short.MAX_VALUE)
                        .addComponent(okButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cancelButton)
                        .addContainerGap())))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {cancelButton, okButton});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 46, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 46, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(interation, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cancelButton)
                    .addComponent(okButton))
                .addContainerGap())
        );

        pack();
	}
	
	private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {
		// TODO add your handling code here:
		constructorName = this.constructorArea.getText().trim();
		interfaceName = this.interfaceArea.getText().trim();
		//iterationNum = mymodel.getNumber().intValue();
                iterationNum = ((Integer)interation.getValue()).intValue();
		System.out.println(iterationNum);
		setVisible(false);
	}

	private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {
		// TODO add your handling code here:
		constructorName = null;
		interfaceName = null;
		constructorArea.setText("");
		interfaceArea.setText("");
		setVisible(false);
	}

	private void formWindowClosing(java.awt.event.WindowEvent evt) {
		// TODO add your handling code here:
		constructorName = null;
		interfaceName = null;
		constructorArea.setText("");
		interfaceArea.setText("");
		setVisible(false);
	}
	
	public String getInterfaceName() {
		return this.interfaceName;
	}
	
	public String getConstructorName() {
		return this.constructorName;
	}

	public int getIterationNum() {
		return this.iterationNum;
	}

	private String constructorName = null;
	private String interfaceName = null;
	// default amount of iterations is 2
	private int iterationNum = 2;
    // variables declaration - do not modify
    private javax.swing.JButton cancelButton;
    private javax.swing.JTextArea constructorArea;
    private javax.swing.JSpinner interation;
    private javax.swing.JTextArea interfaceArea;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton okButton;
    // End of variables declaration

}
