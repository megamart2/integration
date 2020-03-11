package fi.hut.ics.lime.common.pltl.scheck;

import java.io.*;

import fi.hut.ics.lime.common.utils.Debug;


/**
 * A wrapper for SCheck binary.
 * Takes the (regexp) input to SCheck as a string and gives the output as a string.
 * This is further parsed into a DFA by GuardedTransitionAutomatonFactory.
 * @author jalampin
 */
public class SCheckInvocation {
	private ProcessBuilder processBuilder;
	private StringBuffer automata;

	/**
	 * Constructor. Invoke SCheck with the given regexp and construct an automaton
	 * from it.
	 * @param s input for SCheck; a regular expression
	 * @throws SCheckException on an error
	 */
	public SCheckInvocation(String s) throws SCheckException {
		Debug.println("+SCheckInvocation()");
		Debug.println("SCheckInvocation: Input is: "+s);
		processBuilder = new ProcessBuilder("scheck2", "-d");
		automata = new StringBuffer();
		Process sCheckProcess = null;
		BufferedWriter sCheckProcessWriter;
		BufferedReader sCheckProcessReader;
		
		try {
			sCheckProcess = processBuilder.start();
		} catch(IOException e) {
			throw new SCheckException(e.getMessage());
		}
		sCheckProcessWriter = new BufferedWriter(new OutputStreamWriter(sCheckProcess.getOutputStream()));
		
		try {
			sCheckProcessWriter.write(s);
			sCheckProcessWriter.flush();
			sCheckProcessWriter.close();
		} catch(IOException e) {
			throw new SCheckException(e.getMessage());
		}
		Debug.println("SCheckInvocation: input written; reading scheck output...");
		sCheckProcessReader = new BufferedReader(new InputStreamReader(sCheckProcess.getInputStream()));
		
		try {
			while(true) {
				String line = sCheckProcessReader.readLine();
				if (line == null)
					break;
				automata.append(line+"\n");
			}
		} catch(IOException e) {
			throw new SCheckException(e.getMessage());
		}
		try {
			Debug.println("SCheckInvocation: waiting for scheck to quit...");
			sCheckProcess.waitFor();
		} catch(InterruptedException e) {
			throw new SCheckException(e.getMessage());
		}
		Debug.println("-SCheckInvocation()");
	}
	
	/**
	 * @return the automaton returned by SCheck, as a string
	 */
	public String getAutomataText() {
		return automata.toString();
	}
}
