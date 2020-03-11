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

/**
 * This class contains static methods for instrumented code to call that initialize the scheduler with various strategy
 * connectors.
 * 
 * @author osaariki
 */
public class SchedulerInitializer
{
    /**
     * Informs the scheduler of the current thread, starts it with the supplied {@link SchedulingStrategyConnector} and
     * adds a shutdown hook to the {@link Runtime} to stop the scheduler at shutdown.
     * 
     * @param connector
     *            the {@link SchedulingStrategyConnector} to use.
     */
    public static void initialize(SchedulingStrategyConnector connector)
    {
        Scheduler.schedulerLock.lock();
        try {
            Scheduler.informThreadStart(Thread.currentThread());
        } finally {
            Scheduler.schedulerLock.unlock();
        }
        Scheduler.start(connector);
    }

    /**
     * Performs initialization with the default {@link SchedulingStrategyConnector}.
     * 
     * @see #initialize(SchedulingStrategyConnector)
     */
    public static void initialize()
    {
        SchedulingStrategyConnector dummy = new InteractiveStrategyConnector();
        initialize(dummy);
    }
}
