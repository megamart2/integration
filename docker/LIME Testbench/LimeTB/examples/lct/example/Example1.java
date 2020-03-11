package example;

import fi.hut.ics.lime.tester.LCT;

public class Example1
{

		public static void foo (int a, int b) {
			if (a > b)
				System.out.println("a > b");
      else if (a == 5421)
        System.out.println(a);
      else
        System.out.println(a);      
		}   

    public static void main(String args[]) 
    {
				int x = 2 * LCT.getInteger();
				int y = 3 * LCT.getInteger();

				Example1.foo(x, y);

				System.out.println("end.");				
    }
}
