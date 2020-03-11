package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Interface for all parameter implementations.
 * 
 * @author osaariki
 */
public interface Parameter {

	/**
	 * @return the expression that evaluates to the value of this parameter.
	 */
	public abstract String getExpression();
}
