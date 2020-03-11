

public class FileImpl implements File {

	public void close() {
		
	}

	public int length() {
		return length;
	}

	public void open(int number) {
		length = 0;
	}

	public String read() {
		return null;
	}

	public void write(String s) {
		length += s.length();
	}

	int length;
}
