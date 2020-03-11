import fi.hut.ics.lime.tester.LCT;

public class ScheduledObjTest2
{
    static volatile boolean x;

    public static void main(String args[])
    {
        ScheduledObjTest2 l1 = (ScheduledObjTest2) LCT.getObject("ScheduledObjTest2");

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run()
            {
                x = false;
            }
        });

        thread.start();

        if (l1 == null) {
            System.out.println("Foo");
        }
    }
}
