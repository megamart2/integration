package example_nfa;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.Observe;

@CallSpecifications(
	callPropositions = {
			"start ::= start()",
			"ignite ::= ignite()"
	},
	nfa = {
		"ProperStartsA ::= " +
		"  always_nfa {" +
		"    state1_init: " +
		"      if " +
		"        :: (start) -> goto reject_state2; " +
		"        :: (ignite) -> goto state3; " +
		"        :: ((!start) && (!ignite)) -> goto state1_init;" +
		"      fi; " +
		"    reject_state2: " +
		"      if " +
		"        :: (1) -> goto reject_state2; " +
		"      fi; " +
		"    state3: " +
		"      if " +
		"        :: (1) -> goto state3; " +
		"      fi; " +
		"  }"
	}
)
public class Car {
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void start() {}
	
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void ignite() {}

}
