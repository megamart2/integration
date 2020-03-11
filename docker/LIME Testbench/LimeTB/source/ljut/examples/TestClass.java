public class TestClass {
	
	public TestClass() {
		
	}

	public TestClass(int a, short b) {
		System.out.println("TestClass(int a, short b): constructed with values " + a + ", " + b);
		if (a < b)
			System.out.println("TestClass(int a, short b): a < b");
		else
			System.out.println("TestClass(int a, short b): a >= b");
	}
	
	public void bah(Value a, Value b, int c) {
		if (a != null && b != null) {
			if (a.a == b.a) {
				if (c == 100)
					System.out.println("c == 100");
				else
					System.out.println("c != 100");
				
				if (a.next == b)
					System.out.println("a.next == b");
				else
					System.out.println("a.next != b");
			}
		}
	}

	public void foo(long a, int b) {
		if (a < 0) {
			System.out.println("foo(long a, int b): a < 0");
			if (b == 3)
				System.out.println("foo(long a, int b): b == 3");
			else
				System.out.println("foo(long a, int b): b != 3");
		} else {
			System.out.println("foo(long a, int b): a >= 0");
			if (b == 3)
				System.out.println("foo(long a, int b): b == 3");
			else
				System.out.println("foo(long a, int b): b != 3");
		}
	}

	public void foo(int a) {
		if (a * 2 >= 10)
			System.out.println("foo(int a): 2a >= 10");
		else
			System.out.println("foo(int a): 2a < 10");
	}

	public void bar() {
		System.out.println("bar(): called");
	}

	public void baa(Value a) {
		a.print();
	}
}
