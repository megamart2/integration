

public interface File {

	public int length();

	public void write(String s);

	public String read();

	public void close();

	public void open(int number);
}
