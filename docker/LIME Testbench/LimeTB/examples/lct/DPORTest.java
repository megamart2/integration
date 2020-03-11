public class DPORTest
{
    static int a, b, c;

    public static void main(String args[])
    {
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run()
            {
                synchronized (this) { a = 0; }
                synchronized (this) { a = 1; }
                synchronized (this) { a = 2; }
                synchronized (this) { a = 3; }
                synchronized (this) { a = 4; }

                synchronized (DPORTest.class) { b = 5; }
            }
        });

        thread.start();

        synchronized (DPORTest.class) { System.out.println("b == " + b); }

        Object obj = new Object();

        synchronized (obj) { c = 1; }
        synchronized (obj) { c = 2; }
        synchronized (obj) { c = 3; }
        synchronized (obj) { c = 4; }
        synchronized (obj) { c = 5; }
    }
}
