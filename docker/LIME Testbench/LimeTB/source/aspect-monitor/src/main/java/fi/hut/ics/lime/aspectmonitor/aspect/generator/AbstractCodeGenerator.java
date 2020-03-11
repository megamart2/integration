package fi.hut.ics.lime.aspectmonitor.aspect.generator;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.ModifierKind;

import fi.hut.ics.lime.aspectmonitor.aspect.AspectJAspectFactory;
import fi.hut.ics.lime.aspectmonitor.aspect.PointcutSynchronization;
import fi.hut.ics.lime.aspectmonitor.aspect.components.JavaAroundAdvice;
import fi.hut.ics.lime.aspectmonitor.aspect.components.JavaAspectMethod;
import fi.hut.ics.lime.aspectmonitor.sourcecode.JavaMethod;
import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.aspect.generator.UndefinedValueException;
import fi.hut.ics.lime.common.logic.parser.PropositionKind;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.propositions.Proposition;

/**
 * A superclass for AspectJ code generators for regexps and PLTLs.
 * @author jalampin
 */
public abstract class AbstractCodeGenerator {
	private static final AspectJAspectFactory aspectFactory = AspectJAspectFactory.instance();
	private Map<Method, List<String>> generatedPropositions;
	/** The specification to generate code for */
	protected Specification specification;

	/** The advice known by this generator */
	protected Map<Method, List<JavaAroundAdvice>> advices;

	/** The method that implements the transition function.
	 * Called by the advice. */
	protected JavaAspectMethod transitionMethod;

	/**
	 * Initializes a new AbstractCodeGenerator instance.
	 * @param specification the specification to generate advice for
	 */
	protected AbstractCodeGenerator(Specification specification) {
		this.specification = specification;
		this.generatedPropositions = new Hashtable<Method, List<String>>();
		this.advices = new Hashtable<Method, List<JavaAroundAdvice>>();
	}
	
	/**
	 * Generates the code for the specification given to this code generator and adds it to an aspect.
	 * 
	 * @param aspect the aspect to add the code to.
	 * @throws AspectException for various code generation exceptions.
	 */
	public void addToAspect(Aspect aspect) throws AspectException {
		for(Method method : specification.getEnforcedMethods()) {
			/*
			 * Advices are added for both synchronized and unsynchronized versions of the target method.
			 * 
			 * Both of these are always needed, because a subclass can change the synchronized
			 * status of an overridden method.
			 */
			JavaAroundAdvice advice = new JavaAroundAdvice();
			advice.setPointcut(((AspectJAspectFactory)aspectFactory).methodToPointcut(method, PointcutSynchronization.NOT_SYNCHRONIZED));
			advice.setSynchronizeWithMethod(false);
			aspect.addAdvice(advice);
			advice.setReturnType(method.getReturnType());
			getAdvicesByMethod(method).add(advice);
			advice.setMethod(method);
					
			advice = new JavaAroundAdvice();
			advice.setPointcut(((AspectJAspectFactory)aspectFactory).methodToPointcut(method, PointcutSynchronization.SYNCHRONIZED));
			advice.setSynchronizeWithMethod(true);
			aspect.addAdvice(advice);
			advice.setReturnType(method.getReturnType());
			getAdvicesByMethod(method).add(advice);
			advice.setMethod(method);
		}
		transitionMethod = new JavaAspectMethod("refreshState", Visibility.PRIVATE);
		aspect.addMethod(transitionMethod);
	}

	/**
	 * @param method the method to query with.
	 * @return the advices for that method.
	 */
	public List<JavaAroundAdvice> getAdvicesByMethod(Method method) {
		if (advices.containsKey(method)) {
			return advices.get(method);
		} else {
			List<JavaAroundAdvice> adviceList = new ArrayList<JavaAroundAdvice>();
			advices.put(method, adviceList);
			return adviceList;
		}
	}

	protected void clearGeneratedPropositions() {
		generatedPropositions.clear();
	}
	
	/**
	 * A no-op constructor
	 */
	protected AbstractCodeGenerator() {
	}
	
	/**
	 * Creates code that assigns truth values for propositions.
	 * @param proposition a proposition to generate code from
	 * @param method a method the proposition is associated with
	 * @param advice The advice to add the code to
	 * @return Java code for a truth assignment for the proposition
	 * @throws UndefinedValueException if a # expression refers to
	 * a variable that is not defined in the method.
	 */
	protected final void generatePropositionCode(Proposition proposition,
			Method method, JavaAroundAdvice advice)
	throws UndefinedValueException {
		// FIXME too long method with too much repetition
		
		if (proposition.getPropositionKind() == PropositionKind.NAMED)
			throw new AssertionError("Named propositions shouldn't reach this far");
		
		String name = proposition.getValue();
		String comment = "// "+proposition.toString();
		
		if(generatedPropositions.get(method) == null) {
			generatedPropositions.put(method, new LinkedList<String>());
		}
		
		if(generatedPropositions.get(method).contains(proposition.getProposition())) {
			return;  // no code
		} else {
			generatedPropositions.get(method).add(proposition.getProposition());
		}
		
		if (specification.getSpecType() == SpecType.CALL) {
			String code = "boolean "+name+" = ";
			
			switch(proposition.getPropositionKind()) {
			case CALL:
				code += proposition.matchesMethod(method);
				break;
			case VALUE:
				List<Parameter> methodArguments = method.getParameters();
				List<String> methodArgumentNames = new ArrayList<String>();
				
				for (Parameter argument : methodArguments) {
					methodArgumentNames.add(argument.getSimpleName());
				}
				
				if (!methodArgumentNames.containsAll(proposition.getArguments())) {
					throw new UndefinedValueException();
				} else {
					code += "(" + proposition.getProposition() + ")";
				}
				break;
			case EXCEPTION:
				throw new AssertionError("Internal error: exception proposition in interface spec.");
			case NAMED:
				throw new AssertionError("This should be never reached.");
			}
	
			code += "; " + comment + "\n";
			advice.getPreProceedCode().addEnd(code);
			return;
		} else {
			String decl = "Boolean " + name;
			if (specification.getSpecType() != SpecType.RETURN)
				throw new AssertionError("Spectype should be return or call");

			switch(proposition.getPropositionKind()) {
			case CALL:
				advice.getPostProceedUnconditionalCode().addEnd(
						decl + " = " + proposition.matchesMethod(method) +
						"; " + comment + "\n");
				return;
			case VALUE:
				List<Parameter> methodArguments = method.getParameters();
				List<String> methodArgumentNames = new ArrayList<String>();
				
				for (Parameter argument : methodArguments) {
					methodArgumentNames.add(argument.getSimpleName());
				}
				
				if (!methodArgumentNames.containsAll(proposition.getArguments())) {
					throw new UndefinedValueException();
				} else {
					if (proposition.referencesResult()) {
						// initialize to null (and that's also why we use Boolean), since
						// java isn't clever enough to figure out it's initialized in all cases,
						// but we won't want to miss the case where we have a bug and it actually
						// is not initialized.
						advice.getPreProceedCode().addEnd(
								decl + " = null; " + comment + "\n");
						advice.getPostProceedExceptionCode().addEnd(
								name+" = false; " + comment +  "\n");
						advice.getPostProceedNoExceptionCode().addEnd(
								name + " = (" + proposition.getProposition() +
								"); " + comment + "\n");
					} else
						advice.getPostProceedUnconditionalCode().addEnd(
								decl + " = (" + proposition.getProposition() +
								"); " + comment + "\n");			
				}
				return;
			case EXCEPTION:
				advice.getPreProceedCode().addEnd(
						decl + " = false; " + comment + "\n");
				advice.getPostProceedExceptionCode().addEnd(
						name + " = t instanceof " +
						proposition.getProposition() + "; " + comment + "\n");
				return;
			case NAMED:
				throw new AssertionError("This should be never reached.");
			}

			throw new AssertionError("This should be unreachable");
		}
	}
	
	/**
	 * If a proposition contains a reference to \#this, its value needs to be bound in
	 * the advice (i.e. "void around(...) : (target(calltarget))", where calltarget is
	 * \#this. This method does that. If the proposition does not contain a reference to
	 * \#this, this method does nothing. 
	 * @param method the method the advice is associated with
	 * @param proposition the proposition to examine
	 * @author jalampin
	 */
	protected final void bindValues(Method method, Proposition proposition) {
		// Done always for ExceptionOverride
		// FIXME document properly
		//if(proposition.referencesTarget()) {
		for (JavaAroundAdvice advice : advices.get(method))
			advice.referencesTarget(specification.getSourceType().getQualifiedName());
		//}
	}
	
//  The current implementation of JavaAroundAdvice knows about returnValue anyway, so we can
//  simplify things and handle the return statement there too
//	protected void createReturn(Method method) {
//		JavaAroundAdvice advice = advices.get(method);
//		
//		if(advice == null)
//			return;
//		
//		if(!method.getReturnType().equals("void")) {
//			advice.getPostProceedNoExceptionCode().addEnd("return "+Proposition.RESULT+";\n");
//		}
//	}
}
