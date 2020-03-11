package fi.hut.ics.lime.ljut.junitgen.parser;

/**
 * Represents a null parameter value.
 * 
 * @author osaariki
 */
public class NullParameter implements Parameter {

	@Override
	public String getExpression() {
		return "null";
	}
}
