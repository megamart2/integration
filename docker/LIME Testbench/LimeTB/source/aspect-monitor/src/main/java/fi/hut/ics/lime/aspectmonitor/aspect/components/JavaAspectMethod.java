package fi.hut.ics.lime.aspectmonitor.aspect.components;

import fi.hut.ics.lime.common.aspect.Indent;
import fi.hut.ics.lime.common.aspect.components.AspectMethod;
import fi.hut.ics.lime.common.sourcecode.Visibility;

/**
 * Simple class for representing methods in aspects.
 * @author jalampin
 *
 */
public class JavaAspectMethod extends AspectMethod {

	public JavaAspectMethod(String name, Visibility visibility) {
		super(name, visibility);
	}
	
	/**
	 * Method as a String representation. All subclasses of AspectMethod
	 * override toString in order to give a suitable language-specific
	 * (in this case, Java) representation of the method.
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
		string += "    "+new Indent(body.toString());
		string += "\n}\n";
		
		return string;
	}
	
}
