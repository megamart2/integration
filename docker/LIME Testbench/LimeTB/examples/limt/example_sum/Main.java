package example_sum;

/**
 * Place holder class to avoid unvowen advice warnings
 * @author jalampin
 */

public class Main {

	public static void main(String[] args) {
		Calculate calculate = new CalculateImpl();
		calculate.sum(1, 1);
		calculate = new FaultyCalculateImpl();
		calculate.sum(2, 2);
	}

}
