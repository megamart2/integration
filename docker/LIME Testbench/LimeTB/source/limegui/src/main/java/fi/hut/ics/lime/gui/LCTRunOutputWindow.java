package fi.hut.ics.lime.gui;

import java.awt.Dimension;
import java.awt.Point;
import java.awt.event.WindowAdapter;

import javax.swing.Action;
import javax.swing.JButton;
import javax.swing.JScrollPane;

import net.miginfocom.swing.MigLayout;

public class LCTRunOutputWindow extends OutputWindow {

	private JButton stopButton;
	
	public LCTRunOutputWindow(String title, Point pos, Action stopLCTServerAction) {
		super(title, pos);
		stopButton = new JButton(stopLCTServerAction);
		myInitComponents();
	}

	@Override
	protected void initComponents() {
		// Intentionally blank
	}
	
	private void myInitComponents() {
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

		MigLayout layout = new MigLayout("", // Layout constraints
				"[grow]", // Column constraints
				"[grow][]" // Row constraints
		);

		getContentPane().setLayout(layout);
		
		add(scrollpane, "grow, wrap");
		add(stopButton, "");
		
		setMinimumSize(new Dimension(500, 300)); 
		/*
		 * TODO: This is the wrong way
		 * to do this. (Possibly
		 * platform dependent etc.)
		 */
		setPreferredSize(layout.preferredLayoutSize(this));
		setMaximumSize(layout.maximumLayoutSize(this));

		this.pack();
	}
}
