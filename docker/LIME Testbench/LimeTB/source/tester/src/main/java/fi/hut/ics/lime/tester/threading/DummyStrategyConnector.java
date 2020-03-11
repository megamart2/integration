/*
Copyright (c) 2010 Helsinki University of Technology (TKK)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 */

package fi.hut.ics.lime.tester.threading;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * A dummy client-side strategy connector. Provides deterministic and random event ordering.
 * 
 * @author osaariki
 */
public class DummyStrategyConnector implements SchedulingStrategyConnector
{

    private static final long DEFAULT_SEED = 1277970646227288854L;

    private Random            random;

    /**
     * Creates a new instance of {@link DummyStrategyConnector} with the specified behavior.
     * 
     * @param deterministic
     *            If true the strategy will always select the same ordering for a particular sequence of event options.
     *            Otherwise the order will be random.
     */
    public DummyStrategyConnector(boolean deterministic)
    {
        if (deterministic)
            random = new Random(DEFAULT_SEED);
        else
            random = new Random();
    }

    /**
     * Creates a new instance of {@link DummyStrategyConnector} with random order dictated by the specified random seed.
     * 
     * @param seed
     *            the random seed to use.
     */
    public DummyStrategyConnector(long seed)
    {
        random = new Random(seed);
    }

    public void initialize()
    {
    }

    public <T extends Event> T getDecision(Map<? extends EventIdentity, T> options)
    {
        assert options.size() > 0;

        ArrayList<EventIdentity> sortedIdentities = new ArrayList<EventIdentity>(options.keySet());
        Collections.sort(sortedIdentities);

        final Map<EventIdentity, Double> orderByValues = new HashMap<EventIdentity, Double>();
        for (EventIdentity identity : sortedIdentities)
            orderByValues.put(identity, random.nextDouble());

        Collections.sort(sortedIdentities, new Comparator<EventIdentity>() {
            public int compare(EventIdentity o1, EventIdentity o2)
            {
                return Double.compare(orderByValues.get(o1), orderByValues.get(o2));
            }
        });

        T decision = options.get(sortedIdentities.get(0));
        return decision;
    }

    public void close()
    {
    }
}
