import fi.hut.ics.lime.tester.LCT;

public class ScheduledObjTest1
{
    static volatile boolean x;
    public int              v;

    public ScheduledObjTest1 next;

    public static int f(int x)
    {
        return 2 * x + 1;
    }

    public static void main(String args[])
    {
        ScheduledObjTest1 l1 = (ScheduledObjTest1) LCT.getObject("ScheduledObjTest1");
        ScheduledObjTest1 l2 = (ScheduledObjTest1) LCT.getObject("ScheduledObjTest1");
        int y = LCT.getInteger();
        x = true;

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run()
            {
                x = false;
            }
        });

        thread.start();

        if (l1 != null && l2 != null)
            if (l1.v == l2.v) {
                if (y == 100)
                    System.out.println("y == 100");
                else
                    System.out.println("y != 100");

                if (l1 == l2)
                    System.out.println("Foo");
                else
                    System.out.println("Bar");

                if (x)
                    System.out.println(" x");
                else
                    System.out.println("!x");
            }

        System.out.println("END");
    }
}
