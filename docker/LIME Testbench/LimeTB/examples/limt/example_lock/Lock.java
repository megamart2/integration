package example_lock;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;

@CallSpecifications(
	regexp = {
			"StrictAlteration ::= (lock() ; unlock())* ; done()"
	}
)
public interface Lock {
	public void lock();
	public void unlock();
	public void done();
}
