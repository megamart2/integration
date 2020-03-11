import fi.hut.ics.lime.tester.LCT;

public class ScheduledTest2
{
    static volatile int a;

    public static void main(String args[])
    {
        int i = LCT.getInteger();

        a = 1;

        Thread thread = new Thread() {
            @Override
            public void run()
            {
                a = 0;
            }
        };

        thread.start();

        if (i == 100) {
            System.out.println("i == 100");

            if (a == 0)
                System.out.println("a == 0");
            else
                System.out.println("a != 0");
        } else
            System.out.println("i != 100");
    }
}
