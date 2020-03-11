package fi.hut.ics.lime.aspectmonitor.lctsupport;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Singleton used for keeping track of the expected steps to violation reported by observers.
 * 
 * @author osaariki
 */
public class ExpectedStepsCounter {

	/**
	 * The maximum number of expected steps representable (limitation of the LCT).
	 */
	public static final int MAX_EXPECTED_STEPS = 327;

	public final class PerthreadKey {
		private Object observer, threadToken;

		public PerthreadKey(Object observer, Object threadToken) {
			this.observer = observer;
			this.threadToken = threadToken;
		}

		@Override
		public boolean equals(Object obj) {
			return (obj != null) && (this.getClass() == obj.getClass())
					&& (this.observer == ((PerthreadKey) obj).observer)
					&& (this.threadToken == ((PerthreadKey) obj).threadToken);
		}

		@Override
		public int hashCode() {
			return observer.hashCode() + (threadToken != null ? threadToken.hashCode() : 0);
		}

		public Object getObserver() {
			return observer;
		}

		public Object getThreadToken() {
			return threadToken;
		}
	}

	private HashMap<PerthreadKey, Double> callSpecExpectedSteps;
	private HashMap<PerthreadKey, Double> returnSpecExpectedSteps;
	private HashMap<PerthreadKey, Integer> expectedStepsAge;

	private ExpectedStepsCounter() {
		callSpecExpectedSteps = new HashMap<PerthreadKey, Double>();
		returnSpecExpectedSteps = new HashMap<PerthreadKey, Double>();
		expectedStepsAge = new HashMap<PerthreadKey, Integer>();
	}

	/*
	 * Using a static class to hold the instance allows for lazy instantiation.
	 */
	private static class SingletonHolder {
		static ExpectedStepsCounter instance = new ExpectedStepsCounter();
	}

	/**
	 * @return the singleton instance.
	 */
	public static ExpectedStepsCounter instance() {
		return SingletonHolder.instance;
	}

	/**
	 * @return map of the tracked observer states to expected steps to a violation for all tracked call specification observers.
	 */
	public synchronized Map<PerthreadKey, Double> getCallSpecExpectedSteps() {
		return Collections.unmodifiableMap(callSpecExpectedSteps);
	}

	/**
	 * @return map of the tracked observer states to expected steps to a violation for all tracked return specification observers.
	 */
	public synchronized Map<PerthreadKey, Double> getReturnSpecExpectedSteps() {
		return Collections.unmodifiableMap(returnSpecExpectedSteps);
	}

	/**
	 * @return map of the tracked observer states to expected steps to a violation for all tracked observers.
	 */
	public synchronized Map<PerthreadKey, Double> getExpectedSteps() {
		Map<PerthreadKey, Double> allExpectedSteps = new HashMap<PerthreadKey, Double>();
		allExpectedSteps.putAll(callSpecExpectedSteps);
		allExpectedSteps.putAll(returnSpecExpectedSteps);
		return allExpectedSteps;
	}

	/**
	 * @return a map from the tracked observer states to to counts of how many other observers have been updated since the last
	 *         update of the observer in question.
	 */
	public synchronized Map<PerthreadKey, Integer> getExpectedStepsAges() {
		return Collections.unmodifiableMap(expectedStepsAge);
	}
	
	/**
	 * @return a set of all the tracked observer states objects.
	 */
	public synchronized Set<PerthreadKey> getPerthreadKeys() {
		return new HashSet<PerthreadKey>(expectedStepsAge.keySet());
	}

	/**
	 * Called by observers to update their current fitness value.
	 * 
	 * @param observer
	 *            the observer instance to update.
	 * @param threadToken
	 *            a thread token object to differentiate between tracked threads in perthread specifications.
	 *            Non-perthread specifications should pass <code>null</code>.
	 * @param steps
	 *            the expected number of steps to violation.
	 */
	public synchronized void updateCallSpec(Object observer, Object threadToken, double steps) {
		PerthreadKey perthreadKey = new PerthreadKey(observer, threadToken);
		callSpecExpectedSteps.put(perthreadKey, steps);
		for (PerthreadKey key : expectedStepsAge.keySet())
			expectedStepsAge.put(key, expectedStepsAge.get(key) + 1);
		expectedStepsAge.put(perthreadKey, 0);
	}

	/**
	 * Called by observers to update their current fitness value.
	 * 
	 * @param observer
	 *            the observer instance to update.
	 * @param threadToken
	 *            a thread token object to differentiate between tracked threads in perthread specifications.
	 *            Non-perthread specifications should pass <code>null</code>.
	 * @param steps
	 *            the expected number of steps to violation.
	 */
	public synchronized void updateReturnSpec(Object observer, Object threadToken, double steps) {
		PerthreadKey perthreadKey = new PerthreadKey(observer, threadToken);
		returnSpecExpectedSteps.put(perthreadKey, steps);
		for (PerthreadKey key : expectedStepsAge.keySet())
			expectedStepsAge.put(key, expectedStepsAge.get(key) + 1);
		expectedStepsAge.put(perthreadKey, 0);
	}

	/**
	 * Called by perthread observers' cleanup code when a tracked thread terminates.
	 * 
	 * @param observer
	 *            the observer instance to remove.
	 * @param threadToken
	 *            a thread token object to differentiate between tracked threads in perthread specifications.
	 */
	public synchronized void remove(Object observer, Object threadToken) {
		PerthreadKey perthreadKey = new PerthreadKey(observer, threadToken);
		callSpecExpectedSteps.remove(perthreadKey);
		returnSpecExpectedSteps.remove(perthreadKey);
		expectedStepsAge.remove(perthreadKey);
	}
}
