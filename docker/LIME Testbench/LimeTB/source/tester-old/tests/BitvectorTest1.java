import fi.hut.ics.lime.tester.LCT;

/*
 * This example illustrates that when using bit vectors to solve path
 * contraints, LCT is able to generate test cases more accurately.
 *
 * For example, in LCT 0.0.5 when using Yices (linear integer arithmetic)
 * LCT generates 3 test cases. When using Boolector (bit vectors), LCT
 * generates 7 test cases.
 */
public class BitvectorTest1
{
    public byte[] foo;
    public int makedonia;

    public static void testMethod (int x, int y) {
        int t;

        if (y > 0) {
            t = x % y;
            System.out.println("A");
        }
        else {
            t = x + y;
            System.out.println("B");
        }


        if (t == 124) {
            x = x << 2;

            if (x > 20 && x < y)
                System.out.println("1");
            else
                System.out.println("2");
        }
        else
            System.out.println("3");
    }
    
    public static void main(String args[]) 
    {
        int x = LCT.getInteger();
        int y = LCT.getInteger();

        BitvectorTest1.testMethod(x,y);
    }
}
