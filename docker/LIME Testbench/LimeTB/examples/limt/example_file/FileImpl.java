package example_file;

public class FileImpl implements LogFile {
	private String s;
	public FileImpl() {
		s = "";
	}
	public int length() {
		return s.length();
	}

	public void write(String s) {
		this.s += s;
	}

}
