package fi.hut.ics.lime.aspectmonitor.lctsupport;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import fi.hut.ics.lime.aspectmonitor.aspect.AspectJAspect;
import fi.hut.ics.lime.aspectmonitor.aspect.components.JavaAspectMethod;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Formula;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.PTOperatorProposition;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Proposition;
import fi.hut.ics.lime.aspectmonitor.lctsupport.logic.Transition;
import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransition;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomaton;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.State;
import fi.hut.ics.lime.common.logic.ast.node.PastTimeTemporalOperator;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.common.specification.PltlSpecification;
import fi.hut.ics.lime.common.specification.SpecModifier;
import fi.hut.ics.lime.common.specification.Specification;

/**
 * This class provides functionality to calculate the heuristic used for directing the LCT. It processes an
 * specification, runs sampling for all it's states (or possibly a subset) and writes the corresponding code to a given
 * aspect.
 * 
 * @author osaariki
 */
public class SpecExecutionSampler {

	private static final long SEED = 0L;

	private Specification spec;
	private int samplingDepth;
	private int samplesPerHeuristic;
	private int numStates;
	private double[][] expectedSteps;
	private List<Transition>[] transitions;
	private int[] acceptingStates;
	private List<PTOperatorProposition> allPTPropositions;
	private List<PTOperatorProposition> significantPTPropositions;
	private List<PTOperatorProposition> otherPTPropositions;
	private List<Proposition> callPropositions;
	private List<Proposition> otherPropositions;
	private boolean samplingDone;

	/**
	 * Constructs a new instance for the given specification. All boolean expression in the specification are converted
	 * to an internal format during construction.
	 * 
	 * @param spec
	 *            the specification to process.
	 * @param samplingDepth
	 *            the maximum depth of sampling.
	 * @param samplesPerHeuristic
	 *            the number of samples to run per considered state.
	 * @param maxSampledStates
	 *            the maximum number of states to consider.
	 */
	@SuppressWarnings("unchecked")
	public SpecExecutionSampler(Specification spec, int samplingDepth, int samplesPerHeuristic, int maxSampledStates) {
		if (samplingDepth > ExpectedStepsCounter.MAX_EXPECTED_STEPS)
			throw new IllegalArgumentException("The maximum sampling depth is "
					+ ExpectedStepsCounter.MAX_EXPECTED_STEPS);

		this.spec = spec;
		this.samplingDepth = samplingDepth;
		this.samplesPerHeuristic = samplesPerHeuristic;
		this.samplingDone = false;

		/*
		 * Collect all the past time operators and construct their propositions.
		 */
		if (spec instanceof PltlSpecification) {
			PltlSpecification pltlSpec = (PltlSpecification) spec;
			PTOperatorCollectingVisitor ptOperatorCounter = new PTOperatorCollectingVisitor();
			pltlSpec.getNode().accept(ptOperatorCounter);
			allPTPropositions = createPTOperatorPropositions(ptOperatorCounter.getOperators());
		} else
			allPTPropositions = Collections.emptyList();

		PropositionalFormulaGenerator formulaGenerator = new PropositionalFormulaGenerator(allPTPropositions);

		formulaGenerator.createUpdateRules();

		GuardedTransitionAutomaton automaton = spec.getAutomaton();

		List<State> acceptingStateList = automaton.acceptingStates();
		acceptingStates = new int[acceptingStateList.size()];
		for (int i = 0; i < acceptingStates.length; ++i)
			acceptingStates[i] = acceptingStateList.get(i).getNumber();

		numStates = automaton.getNumberOfStates();
		transitions = new List[numStates];
		for (int i = 0; i < transitions.length; ++i)
			transitions[i] = new ArrayList<Transition>();

		/*
		 * Process all the transition guards of all states in the automaton. Also update distances from the automaton
		 * for past time propositions.
		 */
		for (State automatonState : automaton) {
			int stateNumber = automatonState.getNumber();
			for (GuardedTransition transition : automatonState) {
				Formula guard = formulaGenerator.processExpression(transition.getGuard());
				transitions[stateNumber].add(new Transition(guard, transition.getTarget().getNumber()));
				formulaGenerator.updateDistancesFromAutomaton(transition.getGuard());
			}
		}

		/*
		 * Sort the past time propositions in ascending order by their distance from the automaton.
		 */
		Collections.sort(allPTPropositions, new Comparator<PTOperatorProposition>() {
			public int compare(PTOperatorProposition o1, PTOperatorProposition o2) {
				return o1.getDistanceFromAutomaton() - o2.getDistanceFromAutomaton();
			}
		});

		/*
		 * Calculate the maximum number of past time operators that can be given distinct states (every one doubles the
		 * state space) while still staying under the supplied maximum number of states to sample.
		 */
		int numSignificantPTOperators = Math.min((int) (Math.log((double) maxSampledStates
				/ (numStates - acceptingStates.length)) / Math.log(2)), allPTPropositions.size());

		/*
		 * The past time propositions closest to the automaton are considered the most significant.
		 */
		Iterator<PTOperatorProposition> iterator = allPTPropositions.iterator();
		significantPTPropositions = new ArrayList<PTOperatorProposition>();
		otherPTPropositions = new ArrayList<PTOperatorProposition>();
		for (int i = 0; i < numSignificantPTOperators; ++i)
			significantPTPropositions.add(iterator.next());
		while (iterator.hasNext())
			otherPTPropositions.add(iterator.next());

		callPropositions = new ArrayList<Proposition>(formulaGenerator.getCallPropositions());
		otherPropositions = new ArrayList<Proposition>(formulaGenerator.getOtherPropositions());

		if (numSignificantPTOperators <= 30)
			expectedSteps = new double[1 << numSignificantPTOperators][numStates];
		else
			throw new IllegalArgumentException(
					"Number of significant past time state combinations exeeds maximum size of Java array (2^30).");
	}

	private List<PTOperatorProposition> createPTOperatorPropositions(Set<PastTimeTemporalOperator> operators) {
		List<PTOperatorProposition> propositions = new ArrayList<PTOperatorProposition>();

		for (PastTimeTemporalOperator operator : operators)
			propositions.add(new PTOperatorProposition(operator));

		return propositions;
	}

	/**
	 * Does the sampling needed for calculating the heuristic.
	 */
	public void calculateHeuristics() {
		Random random = new Random(SEED);

		/*
		 * Goes through all states and past time operator combinations.
		 */
		for (int stateNum = 0; stateNum < numStates; ++stateNum) {
			for (int ptOperatorCombination = 0; ptOperatorCombination < expectedSteps.length; ++ptOperatorCombination) {
				// Decode the current past time operator combination and set the initialization values accordingly.
				{
					int i = 0;
					for (PTOperatorProposition proposition : significantPTPropositions)
						proposition.setInitValue((ptOperatorCombination & 1 << i++) != 0);
				}

				/*
				 * For each sample the significant past time propositions are initialized to the fixed value they were
				 * given while the rest of them are initialized to random values.
				 */
				int sum = 0;
				for (int i = 0; i < samplesPerHeuristic; ++i) {
					for (PTOperatorProposition proposition : significantPTPropositions)
						proposition.init();
					for (PTOperatorProposition proposition : otherPTPropositions)
						proposition.setValue(random.nextBoolean());
					int executionLength = executeAutomaton(stateNum, random);
					sum += executionLength;
				}

				/*
				 * The expected number of steps to a violation is the average of all samples. Or would be if all samples
				 * were run to the end (potential infinity). This value approaches the real value as the sampling depth
				 * is increased.
				 */
				expectedSteps[ptOperatorCombination][stateNum] = (double) sum / samplesPerHeuristic;
			}
		}

		samplingDone = true;
	}

	/*
	 * Executes the automaton from the given initial state (and the states set in the past time propositions) until it
	 * reaches an accepting state or the maximum sampling depth is reached. Returns the number of steps that were taken.
	 */
	private int executeAutomaton(int initialState, Random random) {
		int stepsDone;
		int currentState = initialState;
		Samples: for (stepsDone = 0; stepsDone < samplingDepth; ++stepsDone) {
			/*
			 * Check to see whether an accepting state was reached and stop sampling if one was.
			 */
			for (int j = 0; j < acceptingStates.length; ++j)
				if (currentState == acceptingStates[j])
					break Samples;

			/*
			 * Set one (or none) random call proposition to true, the others to false and the other propositions to
			 * random values.
			 */
			for (Proposition proposition : callPropositions)
				proposition.setValue(false);
			if (callPropositions.size() > 0) {
				int randomIndex = random.nextInt(callPropositions.size() + 1);
				if (randomIndex < callPropositions.size())
					callPropositions.get(randomIndex).setValue(true);
			}
			for (Proposition proposition : otherPropositions)
				proposition.setValue(random.nextBoolean());

			/*
			 * Do the pre-updates for the past time propositions.
			 */
			for (PTOperatorProposition proposition : allPTPropositions)
				proposition.stageValue(proposition.getPreUpdateRule().isTrue());
			for (PTOperatorProposition proposition : allPTPropositions)
				proposition.commitValue();

			/*
			 * Go through all the transition guards and find out which (if any) evaluates to true.
			 */
			boolean foundTransition = false;
			for (Transition transition : transitions[currentState])
				if (transition.getGuard().isTrue()) {
					currentState = transition.getTargetState();
					assert !foundTransition; // Assert that the automaton is deterministic.
					foundTransition = true;
				}

			/*
			 * If no transition was made the automaton has implicitly entered a sink reject state and can never get to
			 * an accepting state. Thus the maximum number of steps is returned.
			 */
			if (!foundTransition)
				return samplingDepth;

			/*
			 * Do the post-updates for the past time propositions.
			 */
			for (PTOperatorProposition proposition : allPTPropositions)
				proposition.stageValue(proposition.getPostUpdateRule().isTrue());
			for (PTOperatorProposition proposition : allPTPropositions)
				proposition.commitValue();
		}

		return stepsDone;
	}

	/**
	 * Writes the calculated heuristics value into an updateHeuristic() method in the given aspect.
	 * 
	 * @param aspect
	 *            the aspect to write to.
	 */
	public void addToAspect(AspectJAspect aspect) {
		if (!samplingDone)
			throw new IllegalStateException(
					"Must call calculateHeuristics() before attempting to write out the results.");

		final String pathSelectionHeuristicInstance = "fi.hut.ics.lime.aspectmonitor.lctsupport.ExpectedStepsCounter.instance()";

		JavaAspectMethod updateMethod = new JavaAspectMethod("updateHeuristic", Visibility.PRIVATE);
		aspect.addMethod(updateMethod);

		if (spec.getModifiers().contains(SpecModifier.PERTHREAD)) {
			updateMethod.addEnd("int state = getState().state;\n");
			if (spec instanceof PltlSpecification) {
				PltlSpecification pltlSpec = (PltlSpecification) spec;
				if (pltlSpec.getNumberOfPastTimeOperators() > 0) {
					updateMethod.addEnd("boolean[] " + pltlSpec.getNow() + " = getState()." + pltlSpec.getNow() + ";\n");
					updateMethod.addEnd("boolean[] " + pltlSpec.getPre() + " = getState()." + pltlSpec.getPre() + ";\n");
				}
			}
		}

		/*
		 * Write the array containing the heuristic values.
		 */
		StringBuilder heuristicsArray = new StringBuilder("final double[][] HEURISTICS = {\n");
		for (int i = 0; i < expectedSteps.length; ++i) {
			heuristicsArray.append("\t{");
			for (int j = 0; j < numStates; ++j)
				heuristicsArray.append(expectedSteps[i][j]).append(',');
			heuristicsArray.append("},\n");
		}
		heuristicsArray.append("};\n");
		updateMethod.addEnd(heuristicsArray.toString());

		updateMethod.addEnd("final double SINK_REJECT_STATE_HEURISTIC = " + samplingDepth + ";\n");

		/*
		 * Write the update call. The heuristics array is indexed with a number with bits set according to the truth
		 * values of the significant past time operators states, and the state of the main automaton.
		 */
		StringBuilder arrayAccess = new StringBuilder("state==-1?SINK_REJECT_STATE_HEURISTIC:HEURISTICS[0");
		int index = 0;
		for (PTOperatorProposition proposition : significantPTPropositions)
			arrayAccess.append("|(").append(proposition.getOperator().getPre()).append('?').append(1 << index++).append(
					":0)");
		arrayAccess.append("][state]");
		
		String threadToken = "null";
		if (spec.getModifiers().contains(SpecModifier.PERTHREAD)) {
			threadToken = "getState()";
		}
		
		if (spec.getSpecType() == SpecType.CALL)
			updateMethod.addEnd(pathSelectionHeuristicInstance + ".updateCallSpec(this, " + threadToken + ", " + arrayAccess + ");\n");
		else
			updateMethod.addEnd(pathSelectionHeuristicInstance + ".updateReturnSpec(this, " + threadToken + ", " + arrayAccess + ");\n");
	}
}
