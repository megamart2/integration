package fi.hut.ics.lime.ljut.junitgen.tokenizer;

/**
 * @author osaariki
 */
public class ValueToken implements Token {

	/**
	 * Initializes a new value token with the specified data.
	 * 
	 * @param data
	 */
	public ValueToken(String data) {
		this.data = data;
	}

	/**
	 * @return the data.
	 */
	public String getData() {
		return data;
	}

	private String data;
}
