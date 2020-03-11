package fi.hut.ics.lime.common.specification;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * This class is used in (at least) the parser to report errors.
 * @author sliedes
 */
public class ErrorReporter {
	private String parserInput;
	private String propertyName;
	
	static int LINE_LEN=-1;
	
	private int getTerminalWidth() {
		final int DEFAULT = 80;
		
		String cols = System.getenv("COLUMNS");

		if (cols == null) {
			// That wasn't likely to succeed anyway; try another way.
			try {
				Process proc = new ProcessBuilder("stty", "-F/dev/tty", "size").start();
				BufferedReader r = new BufferedReader(new InputStreamReader(
						proc.getInputStream()));
				cols = r.readLine();
				int i = cols.indexOf(' ');
				cols = cols.substring(i+1);
				proc.waitFor();
			} catch (IOException e) {
				// well, at least we tried
			} catch (InterruptedException e) {
				// empty
			}
		}

		int len = DEFAULT;

		if (cols != null) {
			try {
				len = Integer.parseInt(cols);
			} catch (NumberFormatException e) {
			}
		}
		return len-2;
	}
	
	public ErrorReporter(String propertyName, String parserInput) {
		this.parserInput = parserInput;
		this.propertyName = propertyName;
		
		if (LINE_LEN == -1)
			LINE_LEN = getTerminalWidth();
	}
	
	public void report(String msg, java_cup.runtime.Symbol err_token) {
		String input = parserInput;
		int left = err_token.left;
		int len = err_token.right-err_token.left;
		
		if (left > LINE_LEN/2-1) {
			input = input.substring(left-(LINE_LEN/2-1));
			left = LINE_LEN/2-1;
		}
		
		if (input.length() > LINE_LEN-2)
			input = input.substring(0, LINE_LEN-2);
		
		StringBuffer sb = new StringBuffer();
		
		for (int i=0; i<left; i++)
			sb.append(' ');
		for (int i=0; i<len; i++)
			sb.append('^');
		
		System.err.println(propertyName+": "+msg+" at characters "+
				(err_token.left+1)+"-"+(err_token.right));
		System.err.println("\""+input+"\"");
		System.err.println(" "+sb.toString());
	}
}
