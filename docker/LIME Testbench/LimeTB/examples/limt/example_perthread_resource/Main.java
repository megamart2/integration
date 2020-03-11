package example_perthread_resource;

public class Main {
	static Object monitor = new Object();
	static boolean thread1Started = false;
	static PerthreadResource resource = new PerthreadResourceImpl();

	public static void main(String[] args) throws InterruptedException {
		Thread thread1 = new Thread(new Thread1());
		Thread thread2 = new Thread(new Thread2());
		
		System.out.println("Calling PerthreadResource from different threads...");
		
		thread1.start();
		thread2.start();
		thread1.join();
		thread2.join();

		System.out.println("Trying the same sequence from one thread...");

		System.out.println("Acquiring resource from thread " + Thread.currentThread().getId());
		resource.acquire();
		System.out.println("Acquiring resource from thread " + Thread.currentThread().getId());
		resource.acquire();
		System.out.println("Releasing resource from thread " + Thread.currentThread().getId());
		resource.release();
		System.out.println("Releasing resource from thread " + Thread.currentThread().getId());
		resource.release();
	}
}
