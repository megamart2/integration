package fi.hut.ics.lime.gui;

import java.awt.event.WindowAdapter;
import java.awt.Point;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;
import javax.swing.GroupLayout;

public class OutputWindow extends javax.swing.JFrame {

	private LimeTask task;
	protected JTextArea outputarea;

	public OutputWindow(String title, Point pos) {
		super(title);
		this.task = null;
		this.outputarea = new JTextArea();
		this.initComponents();
		this.setLocation(pos);
	}

	/**
	 * Make the window aware of what it is running if necessary (in the case
	 * of LCT server this is needed to make the server killable)
	 * 
	 * @param task
	 */
	public void setTask(LimeTask task) {
		this.task = task;
	}
	
	public JTextArea getOutputArea() {
		return this.outputarea;
	}

	protected void initComponents() {
		
		// set the default close operation and add a window listener to
		// kill the process of this output window on close if it is set
		// (required by the lctserver)
		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
		
		addWindowListener(new WindowAdapter() {
			public void windowClosed(java.awt.event.WindowEvent e) {
				closeWindow();
			}
		});
		
		this.outputarea.setColumns(20);
		this.outputarea.setRows(5);

		JScrollPane scrollpane = new javax.swing.JScrollPane();

		scrollpane.setViewportView(outputarea);

		GroupLayout layout = new GroupLayout(getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addComponent(scrollpane, javax.swing.GroupLayout.DEFAULT_SIZE, 500, Short.MAX_VALUE)
		);
		layout.setVerticalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addComponent(scrollpane, javax.swing.GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
		);

		this.pack();
	}

	protected void closeWindow() {
		this.outputarea.setText("");
		if(this.task != null) {
			this.task.kill();
		}
	}
	
	public void cleanOutputArea() {
		this.outputarea.setText("");
	}

}
