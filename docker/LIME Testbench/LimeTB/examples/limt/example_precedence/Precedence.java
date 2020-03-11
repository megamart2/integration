package example_precedence;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;

/**
 * A class that contains an interface specification that requires
 * s() to precedes p() between q() and r().
 * 
 * Source: http://patterns.projects.cis.ksu.edu/
 * @author jalampin
 */

@CallSpecifications (
	pltl = {
		"betweenQandRSprecedesP ::= G((q() && F r()) -> (! p() U (s() || r())))"
	}
)
public class Precedence {
	public void p()  {}
	public void q()  {}
	public void r()  {}
	public void s()  {}
}
