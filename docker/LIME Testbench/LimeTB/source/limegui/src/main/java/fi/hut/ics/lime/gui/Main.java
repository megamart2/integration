package fi.hut.ics.lime.gui;

public class Main {

	/**
	 * Creates one program frame and shows it.
	 */
	private static void createAndShowGUI(boolean CLang) {
		MainWindow mainwindow = new MainWindow();
		if (CLang)
			mainwindow.createAndShowC();
		else
			mainwindow.createAndShow();
	}

	/**
	 * Launches the UI.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		// start the c ui instead if requested
		if (args.length > 0 && args[0].equals("-c")) {
			javax.swing.SwingUtilities.invokeLater(new Runnable()  {
				public void run() {
					createAndShowGUI(true);
				}
			});
		}
		else {
			javax.swing.SwingUtilities.invokeLater(new Runnable()  {
				public void run() {
					createAndShowGUI(false);
				}
			});
		}
	}

}
