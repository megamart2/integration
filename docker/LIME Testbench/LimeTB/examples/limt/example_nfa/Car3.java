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
		"        :: ((!start && start) || start || 0) -> goto reject_state2; " +
		"        :: (!(ignite == ignite) || ignite) -> goto state3; " +
		"        :: (start == ignite && ignite == 0) -> goto state1_init;" +
		"      fi; " +
		"    reject_state2: " +
		"      if " +
		"        :: (ignite || (!ignite)) -> goto reject_state2; " +
		"      fi; " +
		"    state3: " +
		"      if " +
		"        :: (!0) -> goto state3; " +
		"      fi; " +
		"  }"
	}
)
public class Car3 {
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void start() {}
	
	@Observe(
			  specs = {"ProperStartsA"},
			  callException = RuntimeException.class)
	public void ignite() {}

}
