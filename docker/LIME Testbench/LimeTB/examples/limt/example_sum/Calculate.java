package example_sum;

import fi.hut.ics.lime.aspectmonitor.annotation.ReturnSpecifications;

/**
 * A test specification for a method that takes more than
 * one parameter.
 * @author jalampin
 */

@ReturnSpecifications(
	pltl = { "ProperSum ::= G (sum() -> <{ #result == #i + #j }>)"}
)
public interface Calculate {
	public int sum(int i, int j);
}
