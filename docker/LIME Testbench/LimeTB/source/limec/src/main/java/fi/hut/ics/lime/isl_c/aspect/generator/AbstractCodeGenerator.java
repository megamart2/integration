package fi.hut.ics.lime.isl_c.aspect.generator;

import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.generator.UndefinedValueException;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Variable;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.common.specification.AbstractSpecification;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.propositions.Proposition;
import fi.hut.ics.lime.isl_c.aspect.ACCAspect;
import fi.hut.ics.lime.isl_c.aspect.ACCAspectFactory;
import fi.hut.ics.lime.isl_c.aspect.components.CAroundAdvice;
import fi.hut.ics.lime.isl_c.aspect.components.CAspectMethod;
import fi.hut.ics.lime.isl_c.aspect.components.CInitializer;
import fi.hut.ics.lime.isl_c.sourcecode.CDataStructure;
import fi.hut.ics.lime.isl_c.sourcecode.CMethod; // necessary for instance associations
import fi.hut.ics.lime.isl_c.sourcecode.CSource;
import fi.hut.ics.lime.isl_c.staticaccessor.StaticAccessor;
// also necessary for instance association
import fi.hut.ics.lime.isl_c.ast.Annotation;
import fi.hut.ics.lime.isl_c.ast.AnnotationType;

/**
 * A superclass for AspeCt-oriented C code generators for regexps and PLTLs.
 * @author jalampin
 */
public abstract class AbstractCodeGenerator {
	private static final ACCAspectFactory aspectFactory = ACCAspectFactory.instance();
	private Map<Method, List<String>> generatedPropositions;
	// The specification to generate code for */
	protected Specification specification;

	// The advices known by this generator */
	protected Map<Method, CAroundAdvice> advices;

	// The method that implements the transition function.
	// Called by the advices.
	protected CAspectMethod transitionMethod;

	// The method that is called by default by the aspect when
	// the specification is violated. Called by the advices.
	protected CAspectMethod defaultExceptionMethod;
	
	/**
	 * Generates AspeCt-oriented C advice for the given specification and adds 
	 * it to the aspect.
	 * 
	 * @param specification the specification to generate advice for
	 * @param aspect the aspect where the generated advice is added
	 */
	protected AbstractCodeGenerator(Specification specification, Aspect aspect) {
		this.specification = specification;
		this.generatedPropositions = new Hashtable<Method, List<String>>();
		// advices:
		advices = new Hashtable<Method, CAroundAdvice>();
		for(Method method : specification.getEnforcedMethods()) {
			CAroundAdvice advice = new CAroundAdvice();
			advice.setPointcut(((ACCAspectFactory)aspectFactory).methodToPointcut(method));
			aspect.addAdvice(advice);
			advice.setReturnType(method.getReturnType());
			advices.put(method, advice);
			advice.setMethod(method);
			
			// associate instance definitions with corresponding methods' around advices
			CMethod func = (CMethod)method;
			for (Annotation annotation : func.getAssociatedAnnotations()) {
				if (annotation.getType() == AnnotationType.INSTANCE) {
					if (annotation.getAnnotationFields().length > 1) {
						System.out.println("WARNING: Too many fields in the instance definitions, only the first one is used.");
					}
					advice.setInstance(annotation.getAnnotationFields()[0].getFieldContents()[0]);
				}
			}
		}
		// Create the function that updates the state of the automaton and add
		// it to this aspect.
		transitionMethod = new CAspectMethod("refreshState", Visibility.STATIC);
		aspect.addMethod(transitionMethod);
		
		// Create the function that is called by default when the specification
		// is violated. Add the function to this aspect. The default function just
		// prints out some debugging info and exits.
		if (specification instanceof AbstractSpecification) {
			defaultExceptionMethod = new CAspectMethod(
				((AbstractSpecification)specification).getDefaultException(), 
				Visibility.STATIC);
		} else {
			assert false : "Cannot get type of default exception.";
		}
		
		defaultExceptionMethod.setReturnType("void");
		defaultExceptionMethod.addArgument("char *violationDetails");
		defaultExceptionMethod.addBegin("\tprintf(\"" + defaultExceptionMethod.getName());
		defaultExceptionMethod.addEnd(": %s\", violationDetails);\n");
		defaultExceptionMethod.addEnd("\tfree(violationDetails);\n");
		defaultExceptionMethod.addEnd("\texit(1);\n"); // TODO perhaps multiple exit states?
		aspect.addMethod(defaultExceptionMethod);

	}
	
	/**
	 * A no-op constructor
	 */
	protected AbstractCodeGenerator() {
		
	}
	
	/**
	 * Creates code that assigns truth values for propositions.
	 * 
	 * @param proposition a proposition to generate code from
	 * @param method a method the proposition is associated with
	 * @param aspect the aspect currently being created  
	 * @return C code for a truth assignment for the proposition
	 * @throws UndefinedValueException if a # expression refers to
	 * a variable that is not defined in the method.
	 */
	protected final String generatePropositionCode(Proposition proposition, 
						 Method method, Aspect aspect) 
						 throws UndefinedValueException {		
		// The int pX = something == otherThing; part of the aspect
		String code = "\tint "+proposition.getValue()+" = ";
		
		if(generatedPropositions.get(method) == null) {
			generatedPropositions.put(method, new LinkedList<String>());
		}
		if (proposition.getPropositionKind() == PropositionKind.NAMED)
			throw new AssertionError("Named propositions shouldn't reach this far");
		
		if(generatedPropositions.get(method).contains(proposition.getProposition())) {
			return "";
		} else {
			generatedPropositions.get(method).add(proposition.getProposition());
		}
		if(proposition.getPropositionKind() == PropositionKind.CALL) {
			
			if (proposition.matchesMethod(method)) {
				code += "1";
			} else {
				code += "0";
			}

		} else {
			
			// Slight difference to the Java side. In C, we don't use a this
			// pointer. ISL specifications may refer directly to non-automatic
			// variables as well as function arguments.
			if (!propositionArgumentExists(proposition, method, aspect)) {
				throw new UndefinedValueException();
			} else {
				String convertedCode = StaticAccessor.convertToAccessorCalls(
												proposition.getProposition(), 
												method.getDeclaringType());
				// Can be replaced with just 
				// code += proposition.getProposition()
				// as soon as the AspeCt-oriented C team starts supporting the
				// accessing of static functions and variables from aspects */
				code += convertedCode;
			}
		}
		code += "; /* "+proposition.toString()+" */\n";
		return code;
	}
	
	protected void createReturn(Method method) {
		CAroundAdvice advice = advices.get(method);
		if(advice == null)
			return;
		if(!method.getReturnType().equals("void")) {
			advice.getProceed().setType(method.getReturnType());
			advice.getPostProceedCode().addEnd("\treturn "+Proposition.RESULT+";\n");
		}
	}

	/**
	 * Checks whether the arguments of a proposition exist. The arguments of a
	 * proposition are considered to exist if they are formal arguments of the
	 * function, non-automatic (i.e. accessible) variables, non-automatic
	 * structs or unions or variables contained in those structs/unions.
	 * 
	 * @param proposition The proposition containing the arguments to check
	 * @param method The function the proposition is related to
	 * @param aspect The aspect currently being created
	 * @return true, if all arguments of proposition exist; false otherwise
	 */
	protected boolean propositionArgumentExists(Proposition proposition, 
												Method method, Aspect aspect) {
		
		CSource source = ((CSource)specification.getSourceType());
		
		// Create lists containing all the different acceptable things the 
		// proposition argument can refer to. These are formal parameters of 
		// the function, non-automatic variables of the source file, 
		// non-automatic structs or unions of the source file and any 
		// variables within those structs or unions.
		List<Parameter> functionParameters = method.getParameters();
		Set<Variable> nonAutomaticVariables = source.getAllVariables();
		Set<CDataStructure> dataStructures = source.getDataStructures();
		
		outer:
		for (String argument : proposition.getArguments()) {
			
			// Does the proposition argument refer to a function parameter?
			for (Parameter formalArgument : functionParameters) {
				if (formalArgument.getSimpleName().equals(argument)) {
					continue outer;
				}
			}
			
			// Does the proposition argument refer to a non-automatic variable?
			for (Variable var : nonAutomaticVariables) {
				if (var.getSimpleName().equals(argument)) {
					
					// The proposition refers to a non-automatic, non-static 
					// variable. We need to add an extern statement to the 
					// aspect to enable access.
					
					if (var.getVisibility() != Visibility.STATIC) {
						
						CInitializer initializer = 
							((ACCAspect)aspect).getInitializer(); 
					
						initializer.addCodeToBeginning("extern " + argument + 
												   	   ";\n");
					}
					
					continue outer;
				}
			}
			
			// Does the proposition argument refer to a non-automatic struct 
			// or union?
			for (CDataStructure structure : dataStructures) {
				if (structure.getSimpleName().equals(argument)) {
					continue outer;
				} else {
					for (Variable structureVar : structure.getAllVariables()) {
						// Or to a variable within those structs/unions?
						if (argument.equals(structure.getSimpleName() + "." +
											structureVar.getSimpleName())) {
							continue outer;
						}
					}
				}
			}
		
			// The proposition argument didn't refer to anything above.
			return false;
		
		}
	
		// All the proposition arguments matched to something or no
		// arguments existed.
		return true;
	}
	
}
