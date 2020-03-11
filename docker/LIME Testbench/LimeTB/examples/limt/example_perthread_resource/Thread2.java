package example_perthread_resource;

public class Thread2 implements Runnable {
	public void run() {
		try {
			synchronized (Main.monitor) {
				while (!Main.thread1Started) {
					Main.monitor.wait();
				}

				System.out.println("Acquiring resource from thread " + Thread.currentThread().getId());
				Main.resource.acquire();

				Main.monitor.notify();
				Main.monitor.wait();

				System.out.println("Releasing resource from thread " + Thread.currentThread().getId());
				Main.resource.release();
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}
}
