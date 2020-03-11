package example_lock;

import fi.hut.ics.lime.tester.LCT;

public class MainLCT {

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

       int x = LCT.getInteger();
       int y = LCT.getInteger();

       m.testme(x, y);
       System.exit(0);
    }
}
