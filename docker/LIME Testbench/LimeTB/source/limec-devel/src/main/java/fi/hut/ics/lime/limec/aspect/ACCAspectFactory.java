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
import fi.hut.ics.lime.limec.CUtils;
import fi.hut.ics.lime.limec.aspect.components.CAspectVariable;
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
	
	protected Map<Specification, Aspect> aspects = new Hashtable<Specification, Aspect>();
	protected static final PropositionFactory propositionFactory = PropositionFactory.getInstance();
	
	private static class ACCAspectFactoryHolder {
		private static final ACCAspectFactory INSTANCE = new ACCAspectFactory();
	}
	
	public static ACCAspectFactory getInstance() {
		return ACCAspectFactoryHolder.INSTANCE;
	}
	
	/**
	 * Getter for the created aspects.
	 * 
	 * @return mapping from specifications to their corresponding
	 * generated aspects.
	 */
	public Map<Specification, Aspect> getAspects() {
		return this.aspects;
	}
	
	/**
	 * Getter for all generated aspects.
	 * 
	 * @return the aspects generated.
	 */
	public Collection<Aspect> getAllAspects() {
		return this.aspects.values();
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
		
		CodeGenerator generator = new CodeGenerator(specification);
		
		ACCAspect newaspect = new ACCAspect(
				(specification.getSpecType() == SpecType.CALL ? "Call" : "Return")+
				"Specification"+specification.getSourceType().getSimpleName()+specification.getName());
		
		String comment = "";
		comment += specification.getName()+" ::= "+specification.getDeclared()+"\n";
		comment += "Which is in parsed form "+specification.getParsed()+"\n";
		comment += "And internally represented as "+specification.getInternal()+"\n";
		
		newaspect.setComment(comment);
		
		initAspect(specification, newaspect);
			
		aspects.put(specification, newaspect);
		
		if (specification instanceof PltlSpecification) {
			initVariables((PltlSpecification)specification, newaspect);
		} else if (specification instanceof BricsAutomatonSpecification) {
			initVariables((BricsAutomatonSpecification)specification, newaspect);
		} else {
		   throw new AssertionError("Unknown Specification type encountered.");
		}
		
		addIncludes(newaspect, specification);
		addStructures(newaspect, specification);
		addTypeDefs(newaspect, specification);
		
		generator.addToAspect(newaspect);
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
	private void initVariables(PltlSpecification specification, ACCAspect aspect) {

		GuardedTransitionAutomaton automaton = specification.getAutomaton();
		int numberOfPtFormulas = specification.getNumberOfPastTimeOperators();
		
		if(numberOfPtFormulas > 0) {
			// all state variables need to be added both to the initializer and to the aspect
			aspect.addCVariable(new CAspectVariable(specification.getPre()+"["+numberOfPtFormulas+"]", "int"));
			aspect.addCVariable(new CAspectVariable(specification.getNow()+"["+numberOfPtFormulas+"]", "int"));
			//aspect.getInitializer().addStateVariable("int "+ specification.getPre()+"["+numberOfPtFormulas+"]");
			//aspect.getInitializer().addStateVariable("int "+ specification.getNow()+"["+numberOfPtFormulas+"]");
		}
		
		if(automaton != null) {
			int defaultstate = automaton.getInitialState().getNumber();
			//String stateVariable = "state = "+automaton.getInitialState().getNumber();
			aspect.addCVariable(new CAspectVariable("state", "int", Integer.toString(defaultstate)));
			//aspect.getInitializer().addStateVariable("int state;");
			//aspect.getInitializer().addCode("state = "+defaultstate+";");
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
	private void initVariables(BricsAutomatonSpecification specification, ACCAspect aspect) {
		
		BricsAutomatonAdapter adapter = specification.getAdapter();
		Automaton automaton = adapter.getComplementAutomaton();
		
		if(automaton != null) {
			int defaultstate = adapter.getStateMap().get(automaton.getInitialState());
			//String stateVariable = "state = "+adapter.getStateMap().get(automaton.getInitialState());
			aspect.addCVariable(new CAspectVariable("state", "int", Integer.toString(defaultstate)));
			//aspect.getInitializer().addStateVariable("int state;");
			//aspect.getInitializer().addCode("state = "+defaultstate+";");
		}
		
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
	 * Basic initialization method for all aspects.
	 * 
	 * AspeCt-oriented C doesn't support Privileged or Pertarget
	 * aspects, nor does it support precedence in a way similar
	 * to AspectJ. Thus, these properties are not set. 
	 */
	private void initAspect(Specification specification, Aspect aspect) 
		throws AspectException {
		
		Pointcut pointcut = null; 
		Pointcut pointcut2;
		
		//aspects.put(specification, aspect);
		
		for (Method method : specification.getEnforcedMethods()) {
			pointcut2 = methodToPointcut(method);
			if(pointcut == null)
				pointcut = pointcut2;
			else
				pointcut = pointcut.or(pointcut2);
		}
		
		// TODO: should the pointcut information be stored somewhere?
		
	}
	
	private void addIncludes(ACCAspect aspect, Specification specification) {

		CSource sourceFile = (CSource)specification.getSourceType();
		Map<String, Boolean> includes = sourceFile.getIncludedFiles();
		
		for (Entry<String, Boolean> include : includes.entrySet()) {
			
			if (include.getValue().booleanValue() == true) {
				// #include "example.h"
				aspect.addInclude("\""+include.getKey()+"\"");
			} else {
				// #include <example.h>
				aspect.addInclude("<"+include.getKey()+">");
			}
		}
		
		// if stdlib is needed, add it too
		if (CUtils.errorexit > 0 || CUtils.violationexit > 0 || CUtils.obslimit <= 0) {
			aspect.addInclude("<stdlib.h>");
		}
	}
	
	private void addStructures(ACCAspect aspect, Specification specification) {
		
		CSource sourceFile = (CSource)specification.getSourceType();
		Set<CDataStructure> dataStructures = sourceFile.getDataStructures();
		
		StringBuilder code = new StringBuilder();
		
		for (CDataStructure dataStructure : dataStructures) {
			
			if (dataStructure instanceof CStruct) {
				// This data structure represents a struct statement
				code.append("struct ");
			} else if (dataStructure instanceof CUnion) {
				// This data structure represents an union statement
				code.append("union ");
			} else {
				assert false : "Expecting only CUnion and CStruct data " +
							   "structures, but encountered something else.";
			}
			
			code.append(dataStructure.getSimpleName() + " {\n");
			
			for (Variable var : dataStructure.getAllVariables()) {
				code.append("\t");
				code.append(var.getType() + " ");
				code.append(var.getSimpleName() + " ");
				code.append(var.getTypeDetails() + ";\n");
			}
		
			code.append("};\n");
			
			aspect.addStructCode(code.toString());
		}
	}
	
	private void addTypeDefs(ACCAspect aspect, Specification specification) {
		
		CSource sourceFile = (CSource)specification.getSourceType();
		Set<String> typedefs = sourceFile.getTypeDefs();
		
		for(String typedef : typedefs) {
			aspect.addTypeDef(typedef + ";\n");
		}
	}
}
