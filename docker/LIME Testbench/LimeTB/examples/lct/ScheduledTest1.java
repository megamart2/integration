import fi.hut.ics.lime.tester.LCT;

public class ScheduledTest1
{
    static volatile int j;

    public static void main(String args[])
    {
        int i = LCT.getInteger();

        boolean b = LCT.getBoolean();

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run()
            {
                j = 3;
            }
        });

        thread.start();

        j = 1;

        if (b) {
            System.out.println("b = true");

            if (i < j)
                System.out.println("i < j");
            else
                System.out.println("i >= j");
        } else {
            System.out.println("b = false");

            // % operator not supported (yices) => approximation
            i = i % j;

            if (i == 2)
                System.out.println("i == 2");
            else
                System.out.println("i != 2");
        }
    }
}
