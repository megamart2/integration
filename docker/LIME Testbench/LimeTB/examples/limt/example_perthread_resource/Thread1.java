package example_perthread_resource;

public class Thread1 implements Runnable {

	public void run() {
		try {
			synchronized (Main.monitor) {
				System.out.println("Acquiring resource from thread " + Thread.currentThread().getId());
				Main.resource.acquire();

				Main.thread1Started = true;
				Main.monitor.notify();
				Main.monitor.wait();

				System.out.println("Releasing resource from thread " + Thread.currentThread().getId());
				Main.resource.release();

				Main.monitor.notify();
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}
}
