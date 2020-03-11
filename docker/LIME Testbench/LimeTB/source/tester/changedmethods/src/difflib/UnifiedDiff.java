package difflib;

import java.util.ArrayList;
import java.util.List;

public class UnifiedDiff {
	private List<String> lines = new ArrayList<String>();
	private String original_filename;
	private String revised_filename;
	
	public void setOriginalFilename(String filename) {
		this.original_filename = filename;
	}
	
	public String getOriginalFilename() {
		return this.original_filename;
	}
	
	public void setRevisedFilename(String filename) {
		this.revised_filename = filename;
	}
	
	public String getRevisedFilename() {
		return this.revised_filename;
	}
	
	
	
	public void addLine(String line) {
		this.lines.add(line);
	}
	
	public List<String> getLines() {
		return this.lines;
	}
}
