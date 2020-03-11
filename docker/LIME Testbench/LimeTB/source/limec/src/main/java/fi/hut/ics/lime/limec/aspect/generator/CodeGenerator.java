package fi.hut.ics.lime.limec.aspect.generator;

import java.util.Map;
import java.util.Map.Entry;

import fi.hut.ics.lime.limec.aspect.ACCAspect;
import fi.hut.ics.lime.limec.aspect.components.CAroundAdvice;
import fi.hut.ics.lime.limec.aspect.components.CProceed;
import fi.hut.ics.lime.limec.staticaccessor.StaticAccessor;
import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.aspect.Aspect;
import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.aspect.components.CodeFragment;
import fi.hut.ics.lime.common.aspect.generator.UndefinedValueException;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransition;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomaton;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.State;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.visitors.ValueAssigningVisitor;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.specification.PltlSpecification;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.propositions.Proposition;
import fi.hut.ics.lime.common.specification.propositions.PropositionException;
import fi.hut.ics.lime.common.specification.propositions.PropositionFactory;

/**
 * A generator for creating aspect contents from a specification.
 * 
 * @author jalampin
 */
public class CodeGenerator 
	extends AbstractCodeGenerator {
	private static final PropositionFactory propositionFactory = PropositionFactory.getInstance();
	private Method currentMethod = null;
	private CAroundAdvice currentAdvice = null;
	private CodeFragment fragment;
	private Map<PropositionNode, Integer> propositionsValues;
	private Aspect aspect;
	private GuardedTransitionAutomaton automaton;
	
	/**
	 * Construct a CodeGenerator and generate code for a given specification.
	 * 
	 * @param specification the specification to generate code for
	 * @param aspect the aspect to add the generated code to
	 * @throws AspectException on error
	 */
	public CodeGenerator(Specification specification, Aspect aspect) 
	throws AspectException {
		super(specification, aspect);
		automaton = specification.getAutomaton();
		this.specification = specification;
		this.aspect = aspect;
		
		if(automaton == null || automaton.acceptingStates() == null) {
			return;
		}
		
		if(automaton.acceptingStates().size() == 0) {
			throw new AspectException("unable to enforce - resulting automaton contains no accepting states.\n");
		}
		
		propositionsValues = specification.getPropositionValues();
		
		// ADVICES:		
		for(Entry<Method, CAroundAdvice> entry : advices.entrySet()) {
			currentMethod = entry.getKey();
			currentAdvice = entry.getValue();
			
			CProceed proceed = new CProceed();
			currentAdvice.setProceed(proceed);
			
			// select the correct code fragment to work on:
			
			if(specification.getSpecType() == SpecType.CALL) {
				fragment = currentAdvice.getPreProceedCode();
			} else {
				fragment = currentAdvice.getPostProceedCode();
			}
			
			// add a sanity check for the observer
			fragment.addEnd(createObserverCheck());
			
			// if this function has instances defined, the instance
			// changing method must be used here
			if (currentAdvice.getInstance() != null) {
				fragment.addEnd("lime_changeinstance((unsigned long)"+currentAdvice.getInstance()+");\n");
			}
			
			createPropositionCode();
			createRefreshCode();
			
			for(State acceptingState : automaton.acceptingStates()) {
				String exceptionName = specification.getException(currentMethod);
				fragment.addEnd("\tif(*lime_state == "+acceptingState.getNumber()+") {\n"); 

				String exceptionMessage = specification.getName() + " broken in " +
										  currentMethod.getSimpleName() + 
										  ", called from ";
				
				fragment.addEnd("\t\tchar *literalMessage = \"" + exceptionMessage + "\";\n");
				fragment.addEnd("\t\tchar *message = (char *)malloc(");
				fragment.addEnd("lime_strlen(this->funcName) + ");
				fragment.addEnd("lime_strlen(literalMessage) + ");
				fragment.addEnd("lime_strlen(\".\\n\") + 1);\n");
			
				fragment.addEnd("\t\tmessage = lime_concatenate(message, literalMessage);\n");
				fragment.addEnd("\t\tmessage = lime_concatenate(message, this->funcName);\n");
				fragment.addEnd("\t\tmessage = lime_concatenate(message, \".\\n\");\n");
				
				fragment.addEnd("\t\t" + exceptionName + "(message);\n");
				
				fragment.addEnd("\t}\n\n");
			}
			createReturn(currentMethod);
		}
		createTransitionMethod();
	}
	

	/**
	 * Adds fresh state statement to the end of the currently
	 * handled fragment. For example: refreshState(p0, p1);
	 */
	private void createRefreshCode() {
		String args = null;
		for(int i = 0; i < propositionsValues.size(); i++) {
			args = args == null ? "p"+i : args+", p"+i;
		}
		args = args == null ? "" : args;
		fragment.addEnd("\t" + transitionMethod.getName()+"("+args+");\n");
	}

	/**
	 * Adds proposition update code to the end of the currently
	 * handled fragment and creates the needed bindings to
	 * join point context.
	 * 
	 * @throws AspectException on error
	 */
	private void createPropositionCode() throws AspectException {
		Proposition proposition;
		for (Entry<PropositionNode, Integer> entry: propositionsValues.entrySet()) {
			PropositionNode propositionNode = entry.getKey();
			Integer i = entry.getValue();
			propositionNode.setValue("p"+i);
			try {
				proposition = propositionFactory.createProposition(propositionNode);
			} catch (PropositionException e) {
				throw new RuntimeException();
			}
			try {
				String code = generatePropositionCode(proposition, 
										this.currentMethod, this.aspect);
				fragment.addEnd(code);
			} catch (UndefinedValueException e) {
				// propositionNode.setValue("false");
				// TODO make sure that at least one execution ends without an
				// exception; if the value proposition is not defined in a particular
				// method, it is defined to be false. However, if it is not defined
				// in any method, it should be an error.
				fragment.addEnd("int "+ propositionNode.getValue() +" = 0; /* "+proposition.toString()+" */\n");
			}
			if(specification.getSpecType() != SpecType.RETURN) {
				continue;
			}

			CodeFragment preFragment = currentAdvice.getPreProceedCode();
			Map<String, String> types = proposition.getPreTypes();
			Map<String, String> values = proposition.getPreValues();
			
			// adds the int preX = something; statement(s) to the aspect
			for(String pre : values.keySet()) {
				String c = "\t" + types.get(pre)+" "+pre+" = "+values.get(pre)+";\n";
				// TODO check if this is really needed or is handled in
				// abstractCodeGenerator
				String convertedCode = StaticAccessor.convertToAccessorCalls(
						c, currentAdvice.getMethod().getDeclaringType());
				// can be replaced with just 
				// preFragment.addBegin(c);
				// as soon as the AspeCt-oriented C team starts supporting the
				// accessing of static functions and variables from aspects
				preFragment.addBegin(convertedCode);
			}
		}
	}
	
	/**
	 * Adds a transition method to the end of the currently
	 * handled fragment. The transition method consists of
	 * past time formula updates and a switch statement
	 * for updating the automaton state.
	 * 
	 * @throws AspectException if past time formula code
	 * generation fails (e.g., unsupported operators)
	 */
	private void createTransitionMethod()
	throws AspectException	{
		for(int i = 0; i < propositionsValues.size(); i++) {
			transitionMethod.addArgument("int p"+i);
		}

		// past time code:
		if(specification instanceof PltlSpecification) {
			PltlSpecification pltlSpecification = (PltlSpecification) specification;
			BooleanExpression node = pltlSpecification.getNode();
			if(node.isPastTimeFormula())
				new PtLtlCodeGenerator(node, ((ACCAspect)aspect).getInitializer(), transitionMethod);
		}
		
		transitionMethod.addEnd("\tswitch(*lime_state) {\n");
		for(State state : automaton) {
			transitionMethod.addEnd("\t\tcase "+state.getNumber()+":\n");
			if(state.isAccepting()) {
				transitionMethod.addEnd("\t\t\tbreak;\n");
				continue;
			}
			for(GuardedTransition transition : state) {
				BooleanExpression guard = transition.getGuard();
				new ValueAssigningVisitor(guard, propositionsValues);
				transitionMethod.addEnd("\t\t\tif("+guard.getValue()+") ");
				transitionMethod.addEnd("*lime_state = "+transition.getTarget().getNumber()+";\n");
			}
			transitionMethod.addEnd("\t\t\tbreak;\n");
		}
		transitionMethod.addEnd("\t}\n");
	}
	
	private String createObserverCheck() {
		String code = "/* sanity check to catch if observer has been created before it is used */\n" +
				      "if (!lime_root) {\n" +
				      "    printf(\"ERROR: Tried to use an observer that hasn't been created, exiting.\\n\");\n" +
				      "    exit(1);\n" +
				      "}\n";
		return code;
	}
}
