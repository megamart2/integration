import fi.hut.ics.lime.tester.LCT;

public class ObjTest2
{
    public static void main(String args[])
    {
        ObjTest2 o = (ObjTest2) LCT.getObject("ObjTest2");

        int i = LCT.getInteger();

        if (o == null)
            System.out.println("o == null");
        else
            System.out.println("o != null");

        if (i == 100)
            System.out.println("i == 100");
        else
            System.out.println("i != 100");
    }
}
