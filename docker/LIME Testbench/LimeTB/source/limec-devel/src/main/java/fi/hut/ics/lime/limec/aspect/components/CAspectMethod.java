package fi.hut.ics.lime.limec.aspect.components;

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
		StringBuilder code = new StringBuilder();
		code.append(this.visibility.toString()+" ");
		code.append(this.returnType+" "+this.name+"(");
		for (int i = 0; i < this.argList.size(); i++) {
			if (i != 0) {
				code.append(", ");
			}
			code.append(this.argList.get(i));
		}
		code.append(") {\n");
		code.append(this.body.toString());
		code.append("}\n");
		
		return code.toString();
	}
	
}
