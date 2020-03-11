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
		"        :: (ignite) -> goto state3; " +
		"      fi; " +
		"    state3: " +
		"      if " +
		"        :: (1) -> goto state3; " +
		"      fi; " +
		"    reject_state4: " +
		"      if " +
		"        :: (!!1) -> goto state1_init;" +
		"        :: (!!ignite && ((!start)) || 0) -> goto state3;" +
		"        :: (0) -> goto reject_state4; " +
		"        :: (0 != 1 || 1 == ignite) -> goto reject_state4; " +
		"      fi; "+
		"  }"
	}
)
public class Car2 {
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void start() {}
	
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void ignite() {}

}
