import fi.hut.ics.lime.tester.LCT;

public class ScheduledTest3
{
    static Object  objA = new Object();
    static int     a    = 0;

    static Object  objB = new Object();
    static boolean b    = false;

    public static void main(String args[])
    {
        Thread thread = new Thread() {
            @Override
            public void run()
            {
                synchronized (objB) {
                    synchronized (objA) {
                        if (b)
                            a = LCT.getInteger();
                        else
                            a = LCT.getInteger(0, 100);
                    }
                }
            }
        };

        thread.start();

        synchronized (objB) {
            b = LCT.getBoolean();
        }

        synchronized (objA) {
            if (a == 200)
                System.out.println("a == 200");
            else
                System.out.println("a != 200");
        }
    }
}
