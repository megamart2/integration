package fi.hut.ics.lime.limec.aspect;

/** 
 * Represents an AspeCt-oriented C (ACC) aspect. ACC was chosen to implement
 * aspects when the host language of ISL is C.
 * 
 * @author lharpf
 */

import java.util.Map.Entry;

import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.components.Advice;
import fi.hut.ics.lime.common.aspect.components.AspectMethod;
import fi.hut.ics.lime.limec.aspect.components.CInitializer;

public class ACCAspect extends Aspect {

	private CInitializer initializer;
	
	public ACCAspect(String name) {
		super(name);
	}
	
	/**
	 * Before the aspect is run, some initialization needs to be done (a few
	 * variables set and so on). CInitializer represents the initializer that
	 * takes care of the above.
	 * 
	 * @return the initializer associated with this ACC aspect
	 */
	public CInitializer getInitializer() {
		return this.initializer;
	}
	
	/**
	 * Sets the CInitializer that contains the code needed to initialize the
	 * aspect before it can be run.
	 * 
	 * @param initializer the initializer to be associated with this ACC aspect
	 */
	public void setInitializer(CInitializer initializer) {
		this.initializer = initializer;
	}
	
	/**
	 * Generate AspeCt-oriented C code for this aspect.
	 * @author jalampin
	 */
	@Override
	public String toString() {
		String string = "";
		String advicesString = "";
		
		if(comment != null) {
			string += "/*"+comment+"*/\n";
		}
		
		// Declare variables that have file scope
		for(Entry<String, String> entry : variables.entrySet()) {
			string += "static "+ entry.getValue() +" "+entry.getKey()+";\n";
		}
		
		// Declare function prototypes
		for(AspectMethod method : methods) {
			string += method.getVisibility() + " " + method.getReturnType() + " ";
			string += method.getName() + "(";
			
			for(int i=0; i < method.getArguments().size(); i++) {
				string += method.getArguments().get(i);
				
				if (i < (method.getArguments().size() - 1)) {
					// More arguments to come, let's add a comma
					string += ", ";
				}
			}
			
			string += ");\n";
			
		}
		
		if(initializer != null)
			string += initializer.toString();
		
		for(Advice advice : advices) {
			advicesString += (advice == null ? "" : advice.toString() + "\n");
		}
			
		string += advicesString;
		
		for (AspectMethod method : methods) {
			string += method.toString();
			string += "\n";
		}

		return string;
	}
	
}
