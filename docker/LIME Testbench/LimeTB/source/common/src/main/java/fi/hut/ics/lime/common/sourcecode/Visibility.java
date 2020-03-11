package fi.hut.ics.lime.common.sourcecode;

public enum Visibility {

	/* Java visibility modifiers */
	PUBLIC("public"), PROTECTED("protected"), DEFAULT(""), PRIVATE("private"),
	
	/* C visibility modifiers */
	STATIC("static"), NONSTATIC("");
	
	private String name;
	
	private Visibility(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return this.name;
	}
	
	
}
