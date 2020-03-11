package example_file;

public class Main {

	public static void main(String[] args) {
		LogFile logFile = new FileImpl();
		logFile.write("something");
		logFile = new FaultyFileImpl();
		logFile.write("something"); // line 12
	}

}
