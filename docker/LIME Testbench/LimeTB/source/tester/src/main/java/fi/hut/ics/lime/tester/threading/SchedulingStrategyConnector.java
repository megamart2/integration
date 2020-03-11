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

import java.util.Map;

/**
 * Interface for connectors that give the {@link Scheduler} access to different scheduling strategies.
 * 
 * @author osaariki
 */
public interface SchedulingStrategyConnector
{
    /**
     * Initializes this connector.
     */
    void initialize();

    /**
     * Closes this connector.
     */
    void close();

    /**
     * Retrieves the scheduling strategy's decision. Note that the options map contains all the next events (including
     * ones not enabled) of currently running threads and it is an error to return one that is not enabled.
     * 
     * @param options
     *            a map from the event identities to the set of events.
     * @return the identity of next event to execute.
     */
    <T extends Event> T getDecision(Map<? extends EventIdentity, T> options);
}
