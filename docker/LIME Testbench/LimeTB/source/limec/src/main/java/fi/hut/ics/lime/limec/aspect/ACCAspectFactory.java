package fi.hut.ics.lime.limec.aspect;

import java.util.Collection;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import dk.brics.automaton.Automaton;

import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.aspect.components.Pointcut;
import fi.hut.ics.lime.common.automaton.BricsAutomatonAdapter;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomaton;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Variable;
import fi.hut.ics.lime.common.specification.BricsAutomatonSpecification;
import fi.hut.ics.lime.common.specification.PltlSpecification;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.propositions.PropositionFactory;
import fi.hut.ics.lime.limec.aspect.components.CInitializer;
import fi.hut.ics.lime.limec.aspect.generator.CodeGenerator;
import fi.hut.ics.lime.limec.sourcecode.CDataStructure;
import fi.hut.ics.lime.limec.sourcecode.CSource;
import fi.hut.ics.lime.limec.sourcecode.CStruct;
import fi.hut.ics.lime.limec.sourcecode.CUnion;

/**
 * A factory for creating AspeCt-oriented C compatible aspects from
 * specifications.
 * 
 * @author lharpf
 */

public class ACCAspectFactory {

	protected static final ACCAspectFactory instance = new ACCAspectFactory();
	protected Map<Specification, Aspect> aspects = new Hashtable<Specification, Aspect>();;
	protected static final PropositionFactory propositionFactory = PropositionFactory.getInstance();
	
	/**
	 * Global access point for the aspect factory instance.
	 * 
	 * @return the aspect factory instance.
	 */
	public static ACCAspectFactory instance() {
		return instance;
	}
	
	/**
	 * Getter for the created aspects.
	 * 
	 * @return mapping from specifications to their corresponding
	 * generated aspects.
	 */
	public Map<Specification, Aspect> getAspects() {
		return aspects;
	}
	
	/**
	 * Getter for all generated aspects.
	 * 
	 * @return the aspects generated.
	 */
	public Collection<Aspect> getAllAspects() {
		return aspects.values();
	}
	
	/**
	 * Create an aspect from a PLTL or a regular expression specification.
	 * 
	 * Because both PLTL and BricsAutomaton aspects need the same initializer,
	 * we also create the initializer here and pass it on. The initializer used 
	 * to include helper functions and \#includes into the aspect
	 * 
	 * @param specification The specification from which the aspect is created.
	 * @throws AspectException If aspect construction is unsuccessful.
	 */
	public void createAspect(Specification specification) throws AspectException {		
		
		// Create an initializer, which sets up the initial state of the aspect
		CInitializer initializer = createAspectInitializer(specification);
		
		Aspect aspect = makeAspect(specification);	
		aspects.put(specification, aspect);
		((ACCAspect)aspect).setInitializer(initializer);
		
		if (specification instanceof PltlSpecification) {
			initVariables((PltlSpecification)specification,
					      aspect, initializer);
		} else if (specification instanceof BricsAutomatonSpecification) {
			initVariables((BricsAutomatonSpecification)specification, 
				          aspect);
		} else {
		   throw new AssertionError("Unknown Specification type encountered.");
		}
		
		new CodeGenerator(specification, aspect);
	}
	
	/**
	 * Initializes the constructor of the aspect corresponding to the PLTL specification.
	 * If the PLTL formula contains past subformulas boolean arrays are allocated to
	 * accommodate them. The initial state of the DFA is initialized in the 
	 * constructor.
	 * 
	 * @param specification PLTL specification
	 * @param aspect The aspect where the code will be generated
	 * @param initializer The constructor object where code will be generated
	 */
	private void initVariables(PltlSpecification specification, Aspect aspect,
							   CInitializer initializer) {

		GuardedTransitionAutomaton automaton = specification.getAutomaton();
		int numberOfPtFormulas = specification.getNumberOfPastTimeOperators();
		
		if(numberOfPtFormulas > 0) {
			// TODO: Used with past time formulas. Ensure that these work with C.
			// DONE: they do not
			//aspect.addVariable((int[].class).getCanonicalName(), specification.getNow());
			//aspect.addVariable((int[].class).getCanonicalName(), specification.getPre());
			initializer.addCodeToBeginning("static int "+specification.getPre()+"["+numberOfPtFormulas+"];\n");
			initializer.addCodeToBeginning("static int "+specification.getNow()+"["+numberOfPtFormulas+"];\n");
		}
		
		if(automaton != null) {
			// Sets the initial state of the automaton by adding a variable with
			// file scope
			//String stateVariable = "state = "+automaton.getInitialState().getNumber();
			aspect.addVariable("int", "lime_defaultstate = "+automaton.getInitialState().getNumber());
			aspect.addVariable("int *", "lime_state = 0;");
			aspect.addVariable("void *", "lime_root = 0;");
		}
		
	}
	
	/**
	 * Assigns initial state of the specification automaton in
	 * the aspect constructor. 
	 * 
	 * @param aspect the aspect currently being constructed
	 * @param specification regular expression specification 
	 * to which the aspect corresponds to.
	 */
	private void initVariables(BricsAutomatonSpecification specification,
							   Aspect aspect) {

		BricsAutomatonAdapter adapter = specification.getAdapter();
		Automaton automaton = adapter.getComplementAutomaton();
		
		if(automaton != null) {
			// Sets the initial state of the automaton by adding a variable with
			// file scope
			//String stateVariable = "state = "+adapter.getStateMap().get(automaton.getInitialState());
			aspect.addVariable("int", "lime_defaultstate = "+adapter.getStateMap().get(automaton.getInitialState()));
			aspect.addVariable("int *", "lime_state = 0;");
			aspect.addVariable("void *", "lime_root = 0;");
		}
		
	}
	
	/**
	 * Creates an Aspect object that represents the AspeCt-oriented C aspect.
	 * The Aspect is built to correspond to the Specification (CallSpecification
	 * or ReturnSpecification) given as a parameter.
	 * 
	 * @param specification The Specification object to construct an Aspect from
	 * @return an Aspect representing an AspeCt-oriented C aspect
	 * @throws AspectException
	 */
	protected Aspect makeAspect(Specification specification) 
	throws AspectException {
		String aspectName;
		Aspect aspect;
		String comment = "Generated from property: \n";
		
		aspectName = specification.getSpecType() == SpecType.CALL ? "Call" : "Return";
		aspectName+= "Specification"+specification.getSourceType().getSimpleName()+specification.getName();
		aspect = new ACCAspect(aspectName);
		comment += specification.getName()+" ::= "+specification.getDeclared()+"\n";
		comment += "Which is in parsed form "+specification.getParsed()+"\n";
		comment += "And internally represented as "+specification.getInternal()+"\n";
		
		Map<String, PropositionNode> namedPropositions = propositionFactory.getPropositionNodesByType(specification.getSourceType());
		
		if(namedPropositions != null && namedPropositions.size() > 0) {
			comment += "Named propositions and their values: \n";		
			for(String name : namedPropositions.keySet()) {
				PropositionNode node = namedPropositions.get(name);
				comment += "[NAMED]: "+name+" ::= ["+node.getPropositionKind().name()+"]: "+node.getProposition()+"\n";
			}
		}
		
		aspect.setComment(comment);
		initAspect(specification, aspect);
		return aspect;
	}
	
	/**
	 * Creates a call pointcut from a compile time representation
	 * of a method.
	 * 
	 * @param method representation of a method.
	 * @return call pointcut that corresponds to a call to the
	 * given method.
	 */
	public Pointcut methodToPointcut(Method method) {
		Pointcut pointcut = new Pointcut();
		String pString = "call(";
		
		if (method.getVisibility() != null) {
			pString += method.getVisibility().toString() + " ";
		}
		 
		pString += method.getReturnType() +" ";
		pString += method.getSimpleName() + "(";
		
		// AspeCt-oriented C needs parameters here; call(int foo(int)) instead
		//  of call(int foo(..)). We simply need the type, not the param name.
		
		for (int i=0; i < method.getParameters().size(); i++) {
			Parameter methodParameter = method.getParameters().get(i);
			
			pString += methodParameter.getTypeAsString();
			
			if (methodParameter.isArray()) {
				// The parameter is an array, we need to add brackets
				pString += " []";
			}
			
			if (i < (method.getParameters().size() - 1)) {
				// There are more parameters to come, we need a comma
				pString +=  ", ";
			}
			
		}
		
		pString += "))";
		
		pointcut.setPointcutString(pString);
		return pointcut;
	}
	
	/**
	 * Basic initilization method for all aspects.
	 * 
	 * AspeCt-oriented C doesn't support Privileged or Pertarget
	 * aspects, nor does it support precedence in a way similar
	 * to AspectJ. Thus, these properties are not set. 
	 */
	private void initAspect(Specification specification, Aspect aspect) 
											throws AspectException {
		Pointcut pointcut = null, pointcut2;
		
		aspects.put(specification, aspect);
		
		for (Method method : specification.getEnforcedMethods()) {
			pointcut2 = methodToPointcut(method);
			if(pointcut == null)
				pointcut = pointcut2;
			else
				pointcut = pointcut.or(pointcut2);
		}
		
	}
	
	/**
	 * Creates an initializer and returns it. The initializer is basically
	 * just a big String that by default contains a few helper functions we
	 * want to include in the aspect we are creating.
	 * 
	 * This function also adds the necessary \#include and typedef statements 
	 * to the initializer; the aspect we create needs to have the same 
	 * \#includes and typedefs as the original source file to ensure that 
	 * the aspect works.
	 * 
	 * @param specification The specification object to use to create the
	 * 		  initializer. A specification is associated with a C source code 
	 * 		  file, which we fetch the \#includes and typedefs from.  
	 * @return A CInitializer object that should later on be associated with
	 * 		   the Aspect we are creating (aspect.setInitializer(CInitializer))
	 */
	private CInitializer createAspectInitializer(Specification specification) {
		
		CSource sourceFile = (CSource)specification.getSourceType();
		
		// Set the properties of the initializer of the ACC aspect. By default,
		// our initializer contains a few helper functions we need.
		CInitializer initializer = new CInitializer();
		
		// Go through all the #include statements in the original C source file.
		// Our aspect file must have all the same #include statements, otherwise
		// we'll run into problems with FILE pointers and such.
		Map<String, Boolean> includes = sourceFile.getIncludedFiles();
		
		String codeToAdd = "";
		
		for (Entry<String, Boolean> include : includes.entrySet()) {
			codeToAdd += "#include ";
			
			if (include.getValue().booleanValue() == true) {
				// #include "example.h"
				codeToAdd += "\"" + include.getKey() + "\"\n";
			} else {
				// #include <example.h>
				codeToAdd += "<" + include.getKey() + ">\n";
			}
			
		}
	
		// We need stddef.h for the helper functions we have in CInitializer.
		// If the original C source file doesn't include stddef.h, we'll need
		// to include it anyhow.
		if (!includes.containsKey("stddef.h")) {
			codeToAdd += "#include <stddef.h>\n\n";
		}
		// IF WE NEED TO ADD <stdlib.h>, THIS IS WHERE TO DO IT
		
		// insert our own observer instance struct code here
		codeToAdd += createStructCode();
		
		// Insert structs and unions from the original source code into our 
		// aspect.
		Set<CDataStructure> dataStructures = sourceFile.getDataStructures();
		
		for (CDataStructure dataStructure : dataStructures) {
			
			if (dataStructure instanceof CStruct) {
				// This data structure represents a struct statement
				codeToAdd += "\nstruct ";
			} else if (dataStructure instanceof CUnion) {
				// This data structure represents an union statement
				codeToAdd += "\nunion ";
			} else {
				assert false : "Expecting only CUnion and CStruct data " +
							   "structures, but encountered something else.";
			}
			
			codeToAdd += dataStructure.getSimpleName() + " {\n";
			
			for (Variable var : dataStructure.getAllVariables()) {
				codeToAdd += "\t";
				codeToAdd += var.getType() + " ";
				codeToAdd += var.getSimpleName() + " ";
				codeToAdd += var.getTypeDetails() + ";\n";
			}
		
			codeToAdd += "};\n\n";
			
		}
		
		
		// Now add typedefs after the #includes and structs. We need these to 
		// ensure that any possible user-defined types in the original source 
		// file also work in the aspect.
		Set<String> typedefs = sourceFile.getTypeDefs();
		
		for(String typedef : typedefs) {
			codeToAdd += typedef + ";\n";
		}
		
		// the functions that create new instances of the observer and enable it
		codeToAdd += createObsMethod(specification.getName());
		codeToAdd += createObsInstMethod(specification.getName());
		codeToAdd += freeObsMethod(specification.getName());
		codeToAdd += freeObsInstMethod(specification.getName());
		
		initializer.addCodeToBeginning(codeToAdd);
		//initializer.addCode(codeToAdd);
		
		return initializer;
		
	}
	
	private String createStructCode() {
		String code ="";
		code += "typedef struct lime_instance {\n";
		code += "    unsigned long id;\n";
		code += "    int state;\n";
		code += "    struct lime_instance *next;\n";
		code += "    struct lime_instance *prev;\n";
		code += "} lime_instance_t;\n\n";
		
		code += "static lime_instance_t *lime_findinstance(unsigned long id) {\n";
		code += "    lime_instance_t *result = 0;\n";
		code += "    lime_instance_t *tmp = lime_root;\n";
		// note here that we don't start from root, but from the next node
		code += "    while (tmp->next) {\n";
		code += "        tmp = tmp->next;\n";
		code += "        if (tmp->id == id) {\n";
		code += "            result = tmp;\n";
		code += "            break;\n";
		code += "        }\n";
		code += "    }\n";
		code += "    return result;\n";
		code += "}\n\n";
		
		return code;
	}
	
	private String createObsMethod(String specName) {
		String code = "/* internal observer creation method */\n";
		code += "void "+specName+"_lime_create_obs() {\n";
		code += "    if (lime_root) {\n";
		code += "        printf(\"ERROR: Tried to create an observer when it already exists for specification: "+specName+", exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    lime_instance_t *tmp = malloc(sizeof(lime_instance_t));\n";
		code += "    tmp->id = 0;\n";
		code += "    tmp->state = lime_defaultstate;\n";
		code += "    tmp->next = 0;\n";
		code += "    tmp->prev = 0;\n";
		code += "    lime_root = tmp;\n";
		code += "    lime_state = &(tmp->state);\n";
		code += "}\n\n";
		return code;
	}
	
	private String createObsInstMethod(String specName) {
		String code = "/* internal observer instance creation method */\n";
		code += "void "+specName+"_lime_create_obs_inst(unsigned long id) {\n";
		code += "    if (!lime_root) {\n";
		code += "        printf(\"ERROR: Tried to create an observer instance of nonexistant observer for specification: "+specName+", exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    lime_instance_t *tmp = lime_root;\n";
		code += "    while(tmp->next)\n";
		code += "        tmp = tmp->next;\n";
		code += "    tmp->next = malloc(sizeof(lime_instance_t));\n";
		code += "    tmp->next->id = id;\n";
		code += "    tmp->next->state = lime_defaultstate;\n";
		code += "    tmp->next->next = 0;\n";
		code += "    tmp->next->prev = tmp;\n";
		code += "}\n\n";
		return code;
	}
	
	private String freeObsMethod(String specName) {
		String code = "/* internal observer destruction method */\n";
		code += "void "+specName+"_lime_free_obs() {\n";
		code += "    if (!lime_root) {\n";
		code += "        printf(\"ERROR: Tried to free an observer that doesn't exist for specification: "+specName+", exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    free(lime_root);\n";
		code += "    lime_root = 0;\n";
		code += "    lime_state = 0;\n";
		code += "}\n\n";
		return code;
	}
	
	private String freeObsInstMethod(String specName) {
		String code = "/* internal observer instance destruction method */\n";
		code += "void "+specName+"_lime_free_obs_inst(unsigned long id) {\n";
		code += "    if (!lime_root) {\n";
		code += "        printf(\"ERROR: Tried to free an observer instance of nonexistant observer for specification: "+specName+", exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    lime_instance_t *tmp = lime_findinstance(id);\n";
		code += "    if (!tmp) {\n";
		code += "        printf(\"ERROR: Tried to free an observer instance that doesn't exist for specification: "+specName+", exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    if (tmp->next) {\n";
		code += "        tmp->next->prev = tmp->prev;\n";
		code += "        tmp->prev->next = tmp->next;\n";
		code += "    } else {\n";
		code += "        tmp->prev->next = 0;\n";
		code += "    }\n";
		code += "    free(tmp);\n";
		code += "}\n\n";
		return code;
	}
	
}
