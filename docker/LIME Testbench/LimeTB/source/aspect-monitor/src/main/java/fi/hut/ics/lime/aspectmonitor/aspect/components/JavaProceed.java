package fi.hut.ics.lime.aspectmonitor.aspect.components;

/**
 * Proceed statement in an around aspect.
 * 
 * @author jalampin
 *
 */
public class JavaProceed {
	private String param; 
	
	/**
	 * Creates an empty proceed statement "proceed();"
	 * without a return type or parameters.
	 *
	 */
	public JavaProceed() {
		param = "";
	}
	
	/**
	 * Getter for parameters of the proceed call. 
	 * @return parameters as a String.
	 */
	public String getParam() {
		return param;
	}
	
	/**
	 * Setter for the parameters of the proceed call.
	 * For example, setParam("a, b") creates the proceed call "proceed(a, b);". 
	 * @param param a textual representation of the parameter list, as in AspectJ.
	 */
	public void setParam(String param) {
		this.param = param;
	}
	
	/**
	 * String representation of the proceed statement.
	 */
	@Override
	public String toString() {
		return "proceed("+param+")";
	}
}
