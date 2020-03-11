

package fi.hut.ics.lime.gui;

/**
 * the dialog for the ljut-simple command 
 * @author xichen1
 */
public class SimpleDriverGenDialog extends javax.swing.JDialog {

    /** Creates new form simpleGenDialog */
    public SimpleDriverGenDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }


    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        constructorTextArea = new javax.swing.JTextArea();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        methodTextArea = new javax.swing.JTextArea();
        cancelButton = new javax.swing.JButton();
        OKButton = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("LCT code generate input");
        setMinimumSize(new java.awt.Dimension(598, 342));

/*		addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });*/

        jLabel1.setText("Class constructor:");

        constructorTextArea.setColumns(20);
        constructorTextArea.setLineWrap(true);
        constructorTextArea.setRows(5);
        jScrollPane1.setViewportView(constructorTextArea);

        jLabel2.setText("Method name:");

        methodTextArea.setColumns(20);
        methodTextArea.setLineWrap(true);
        methodTextArea.setRows(5);
        jScrollPane2.setViewportView(methodTextArea);

        cancelButton.setMnemonic('C');
        cancelButton.setText("Cancel");
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancleButtonActionPerformed(evt);
            }
        });

        OKButton.setText("OK");
        OKButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                OKButtonActionPerformed(evt);
            }
        });

        jLabel3.setText("<qualified name> or <qualified name>(<parameters>), where <parameters>");
        jLabel4.setText("is a comma separated list  of qualified parameter class names, e.g.");
        jLabel6.setText("\"java.lang.Integer(int)\" or \"java.lang.String\".");
        
        jLabel7.setText("<qualified name> or  <qualified name>(<parameters>), <parameters> is a comma ");
        jLabel8.setText("separated list of qualified parameter class names, e.g. \"foo(int,java.lang.String)\".");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 575, Short.MAX_VALUE)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 575, Short.MAX_VALUE)
                            .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel6, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(11, 11, 11))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(OKButton)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cancelButton)
                        .addContainerGap())))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {OKButton, cancelButton});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 27, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 27, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cancelButton)
                    .addComponent(OKButton))
                .addContainerGap())
        );

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {OKButton, cancelButton});

        pack();
    }

	private void OKButtonActionPerformed(java.awt.event.ActionEvent evt) {
		// TODO add your handling code here:
		constructorName = this.constructorTextArea.getText();
		methodName = this.methodTextArea.getText();

		setVisible(false);
	}

	private void cancleButtonActionPerformed(java.awt.event.ActionEvent evt) {
		// TODO add your handling code here:
/*		constructorName = null;
		methodName = null;
		constructorTextArea.setText("");
		methodTextArea.setText("");*/
		setVisible(false);
	}

	private void formWindowClosing(java.awt.event.WindowEvent evt) {
		// TODO add your handling code here:
		constructorName = null;
		methodName = null;
		constructorTextArea.setText("");
		methodTextArea.setText("");
		setVisible(false);

	}

	public String getConstructorName() {
		return this.constructorName;
	}

	public String getMethodName() {
		return this.methodName;
	}

	private String constructorName = null;
	private String methodName = null;
    // Variables declaration - do not modify
    private javax.swing.JButton OKButton;
    private javax.swing.JButton cancelButton;
    private javax.swing.JTextArea constructorTextArea;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea methodTextArea;
    // End of variables declaration

}
