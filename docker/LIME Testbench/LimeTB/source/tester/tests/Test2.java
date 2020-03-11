import fi.hut.ics.lime.tester.LCT;

public class Test2
{
   
    public int[] foo()
    {
        int[] myArray = new int[10];
        
        for (int i = 0; i < 10; i++)
            myArray[i] = LCT.getInteger();

        return myArray;
    }

    public static void main(String args[]) 
    {
        Test2 t = new Test2();

        int[] bar = t.foo();

        if (bar.length > 5)
            if (bar[2] == bar[3])
                for (int i = 0; i < bar.length; i++)
                    System.out.println(bar[i]);
            else
                for (int i = 0; i < bar.length; i++)
                    System.out.println(bar[i]);
    }
}
