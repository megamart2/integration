package example_past;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.Observe;

@CallSpecifications(
		pltl = { "ProperStarts ::= G (start() -> O(ignite()))" }
)
public class Car {
	@Observe(
	  specs = {"ProperStarts"},
	  callException = RuntimeException.class
	)
	public void start() {}
	@Observe(
	  specs = {"ProperStarts"},
	  callException = RuntimeException.class
	)
	public void ignite() {}

}
