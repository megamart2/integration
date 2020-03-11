package example_perthread_resource;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;

@CallSpecifications(
	regexp = {
			"perthread StrictAlteration ::= (acquire() ; release())*"
	}
)
public interface PerthreadResource {
	public void acquire();
	public void release();
}
