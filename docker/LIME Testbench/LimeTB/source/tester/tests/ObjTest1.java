import fi.hut.ics.lime.tester.LCT;

public class ObjTest1
{
    public int v;

    public ObjTest1 next;

    public static int f (int x)
    {
        return 2*x + 1;
    }

    public static void main(String args[])
    {
        ObjTest1 l1 = (ObjTest1)LCT.getObject("ObjTest1");
        ObjTest1 l2 = (ObjTest1)LCT.getObject("ObjTest1");
        int y       = LCT.getInteger();

        if (l1 != null && l2 != null)
            if (l1.v == l2.v) {
                if (y == 100)
                    System.out.println("y = 100");
                else
                    System.out.println("y != 100");

                if (l1 == l2)
                    System.out.println("Foo");
                else
                    System.out.println("Bar");

            }

        System.out.println("END");
    }
}
