package example_perthread_resource;

public class PerthreadResourceImpl implements PerthreadResource {
	public void acquire() {
		System.out.println("Resource acquired from thread " + Thread.currentThread().getId());
	}

	public void release() {
		System.out.println("Resource released from thread " + Thread.currentThread().getId());
	}
}
