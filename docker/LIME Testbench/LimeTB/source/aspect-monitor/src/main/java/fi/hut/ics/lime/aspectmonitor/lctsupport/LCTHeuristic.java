package fi.hut.ics.lime.aspectmonitor.lctsupport;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import fi.hut.ics.lime.aspectmonitor.lctsupport.ExpectedStepsCounter.PerthreadKey;

/**
 * A class containing static methods that implement path selection heuristics for the LCT.
 * 
 * @author osaariki
 */
public class LCTHeuristic {
	// TODO: Explanations of the different heuristic value available.
	/**
	 * @return the current fitness.
	 */
	public static int seekErrors() {
		Collection<Double> returnSpecExpectedSteps = ExpectedStepsCounter.instance().getReturnSpecExpectedSteps().values();
		if (returnSpecExpectedSteps.size() == 0) {
			return 0;
		} else {
			double sum = 0;
			for (Double value : returnSpecExpectedSteps)
				sum += value;
			return clamp((int) ((sum * 100) / returnSpecExpectedSteps.size()));
		}
	}

	/**
	 * @return the current fitness.
	 */
	public static int avoidInconclusive() {
		Collection<Double> callSpecExpectedSteps = ExpectedStepsCounter.instance().getCallSpecExpectedSteps().values();
		if (callSpecExpectedSteps.size() == 0) {
			return 0;
		} else {
			double sum = 0;
			for (Double value : callSpecExpectedSteps)
				sum += value;
			return clamp(Short.MAX_VALUE - (int) ((sum * 100) / callSpecExpectedSteps.size()));
		}
	}

	/**
	 * @return the current fitness.
	 */
	public static int seekErrorsAvoidInconclusive() {
		return clamp(seekErrors() + avoidInconclusive() - (Short.MAX_VALUE / 2));
	}

	/**
	 * Returns a constant value. This effectively disables usage of a heuristic.
	 * 
	 * @return a constant fitness value.
	 */
	public static int constant() {
		return 0;
	}

	/**
	 * 
	 */
	public static int decayingBest() {
		ExpectedStepsCounter counter = ExpectedStepsCounter.instance();
		Set<PerthreadKey> keys = counter.getPerthreadKeys();
		Map<PerthreadKey, Double> expectedSteps = counter.getExpectedSteps();
		Map<PerthreadKey, Integer> expectedStepsAges = counter.getExpectedStepsAges();

		if (keys.size() == 0) {
			return 0;
		} else {
			double best = Double.MAX_VALUE;
			for (PerthreadKey key : keys) {
				double decayedValue = expectedSteps.get(key) + expectedStepsAges.get(key);
				if (decayedValue < best)
					best = decayedValue;
			}
			return clamp((int) (100 * best));
		}
	}

	private static int clamp(int value) {
		if (value > Short.MAX_VALUE)
			return Short.MAX_VALUE;
		if (value < 0)
			return 0;
		return value;
	}
}
