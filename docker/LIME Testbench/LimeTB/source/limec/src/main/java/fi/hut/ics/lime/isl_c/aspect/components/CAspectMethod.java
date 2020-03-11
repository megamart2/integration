package fi.hut.ics.lime.isl_c.aspect.components;

import fi.hut.ics.lime.common.aspect.components.AspectMethod;
import fi.hut.ics.lime.common.sourcecode.Visibility;

public class CAspectMethod extends AspectMethod {

	public CAspectMethod(String name, Visibility visibility) {
		super(name, visibility);
	}
	
	/**
	 * Method as a String representation. All subclasses of AspectMethod
	 * override toString in order to give a suitable language-specific
	 * (in this case, C) representation of the method.
	 */
	@Override
	public String toString() {
		String string = "";
		String args = null;
		string += visibility.toString() + " ";
		string += returnType+" "+name+"(";
		
		for(String arg : argList) {
			args = (args == null ? arg : args+", "+arg);
		}
		
		string += args == null ? "" : args;
		string += ") {\n";
		string += body.toString();
		string += "}\n";
		
		return string;
	}
	
}
