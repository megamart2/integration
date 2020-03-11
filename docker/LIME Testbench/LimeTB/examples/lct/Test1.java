import fi.hut.ics.lime.tester.LCT;

public class Test1
{
   
	public static String foobar(String daa) {
		return daa;
	}
	
    public static void main(String args[]) 
    {
        int i = LCT.getInteger();

        int j = LCT.getInteger();

        boolean b = LCT.getBoolean();
        
        if (b) {
            System.out.println("b = true");

            if (i < j) {
            	System.out.println(foobar("daa"));
                System.out.println("i < j");
            }
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
