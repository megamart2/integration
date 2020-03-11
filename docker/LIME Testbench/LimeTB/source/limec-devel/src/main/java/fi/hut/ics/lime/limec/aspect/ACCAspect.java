package fi.hut.ics.lime.limec.aspect;

/** 
 * Represents an AspeCt-oriented C (ACC) aspect. ACC was chosen to implement
 * aspects when the host language of ISL is C.
 * 
 * @author lharpf
 */

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.HashSet;

import fi.hut.ics.lime.limec.CUtils;
import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.components.Advice;
import fi.hut.ics.lime.common.aspect.components.AspectMethod;
import fi.hut.ics.lime.limec.aspect.components.CAspectVariable;

public class ACCAspect extends Aspect {
	
	private List<CAspectVariable> cvariables;
	private Set<String> includes;
	private Set<String> structures;
	private Set<String> typedefs;
	
	public ACCAspect(String name) {
		super(name);
		// TODO: this is pretty ugly, would need to create AspectVariable
		// in common and change aspect monitor accordingly to make this prettier
		this.cvariables = new ArrayList<CAspectVariable>();
		this.includes = new HashSet<String>();
		this.structures = new HashSet<String>();
		this.typedefs = new HashSet<String>();
	}
	
	public void addInclude(String name) {
		this.includes.add(name);
	}
	
	public void addStructCode(String structcode) {
		this.structures.add(structcode);
	}
	
	public void addTypeDef(String typedef) {
		this.typedefs.add(typedef);
	} 
	
	public List<CAspectVariable> getCVariables() {
		return this.cvariables;
	}
	
	public void addCVariable(CAspectVariable var) {
		this.cvariables.add(var);
	}
	
	public CAspectVariable getPre(String name) {
		for (CAspectVariable var : this.cvariables) {
			if (var.getName().contains(name)) {
				return var;
			}
		}
		return null;
	}
	
	/**
	 * Generate AspeCt-oriented C code for this aspect.
	 * @author jalampin
	 */
	@Override
	public String toString() {
		
		StringBuilder code = new StringBuilder();
		
		if (this.comment != null) {
			code.append("/*"+this.comment+"*/\n");
		}
		
		// TODO: ugly
		for (String foobar : this.includes) {
			if (foobar.startsWith("<"))
				code.append("#include "+foobar+"\n");
		}
		for (String foobar : this.includes) {
			if (foobar.startsWith("\""))
				code.append("#include "+foobar+"\n");
		}
		code.append("\n");
		
		code.append(CUtils.getObserverStruct(this.cvariables));
		code.append(CUtils.getObserverInitializer(this.cvariables));
		
		// the observer variable definitions
		
		// lime_obs is the most recently used observer instance, 
		// pointing to 0 means it's not initialized
		code.append("static lime_observer_t* lime_obs = 0;\n");
		// lime_root is the first created observer in the list, 
		// pointing to 0 means it's not initialized
		//code.append("static lime_instance_t* lime_root = 0;\n");
		
		code.append("static int lime_enabled = 1;");
		
		// other variable definitions
		for(Entry<String, String> entry : variables.entrySet()) {
			code.append(entry.getValue()+" "+entry.getKey()+";\n");
		}
		code.append("\n");
		
		// structures and typedefs
		
		for (String foobar : this.structures) {
			code.append(foobar.toString());
		}
		for (String foobar : this.typedefs) {
			code.append(foobar);
		}
		
		for (AspectMethod method : this.methods) {
			code.append(method.getVisibility()+" "+method.getReturnType()+" "+method.getName()+"(");
			
			for (int i = 0; i < method.getArguments().size(); i++) {
				if (i != 0) {
					code.append(", ");
				}
				code.append(method.getArguments().get(i));
			}
			
			code.append(");\n");
		}
		code.append("\n");
		
		for(Advice advice : this.advices) {
			code.append(advice.toString() + "\n");
		}
		
		for (AspectMethod method : this.methods) {
			code.append(method.toString() + "\n");
		}

		return code.toString();
	}
	
}
