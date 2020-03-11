package example_lock;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.Observe;

@CallSpecifications(
	valuePropositions = { "l ::= #locked" },
	regexp = { "ProperSets ::= (l  ; ! l)" }
)
public interface SetterLock {
	@Observe(
		specs = { "ProperSets" }
	)
	public boolean setLocked(boolean locked);
}
