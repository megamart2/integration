package example_lock;

public class Main {

    public void testme (int x, int y) {
        Lock lock = new LockImpl();

        lock.lock();

        System.out.println("x = " + x + ", y = " + y);

        if (x > y)
            if (x * y == 1452)
                if (x >> 1 == 5)
                    lock.lock();
        
        lock.unlock();
    }

    public static void main(String[] args) {
       Main m = new Main();

       if (args.length < 2) {
           System.out.println("please give two integers as arguments");
           System.exit(1);
       }

       int x = Integer.parseInt(args[0]);
       int y = Integer.parseInt(args[1]);

       m.testme(x, y);
       System.exit(0);
    }
}
