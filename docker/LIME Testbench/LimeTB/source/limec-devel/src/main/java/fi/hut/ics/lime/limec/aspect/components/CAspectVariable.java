package fi.hut.ics.lime.limec.aspect.components;

import fi.hut.ics.lime.common.aspect.components.AspectMethod;
import fi.hut.ics.lime.common.sourcecode.Visibility;

public class CAspectVariable {
	
	private String name;
	private String type;
	private String value;

	public CAspectVariable(String name, String type, String value) {
		this.name = name;
		this.type = type;
		this.value = value;
	}
	
	public CAspectVariable(String name, String type) {
		this.name = name;
		this.type = type;
		this.value = null;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getType() {
		return this.type;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return this.value;
	}
	
}
