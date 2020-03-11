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

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * A vector clock implementation for the DPOR scheduling strategy.
 * 
 * @author osaariki
 */
public class ThreadClock
{

    Map<Integer, Integer> timesPerThread;

    /**
     * Creates a new zeroed instance of {@link ThreadClock}.
     */
    public ThreadClock()
    {
        timesPerThread = new HashMap<Integer, Integer>();
    }

    /**
     * Gets the time of the specified thread.
     * 
     * @param thread
     *            the thread to get the time for.
     * @return the time for the thread.
     */
    public int get(int thread)
    {
        return timesPerThread.containsKey(thread) ? timesPerThread.get(thread) : -1;
    }

    /**
     * Sets the time of the specified thread.
     * 
     * @param thread
     *            the thread.
     * @param time
     *            the new time.
     */
    public void set(int thread, int time)
    {
        timesPerThread.put(thread, time);
    }

    /**
     * Sets the time of the specified thread to the maximum of the current time and the new time.
     * 
     * @param thread
     *            the thread.
     * @param time
     *            the new time.
     */
    public void update(int thread, int time)
    {
        Integer oldTime = timesPerThread.get(thread);
        if (oldTime == null) {
            timesPerThread.put(thread, time);
        } else {
            timesPerThread.put(thread, Math.max(oldTime, time));
        }
    }

    /**
     * Sets this {@link ThreadClock} to be the pointwise maximum of this and the specified one. After this method
     * returns this instance will contain times for all threads that were in either of the {@link ThreadClock}s and the
     * times for the threads that were found in both will be set to the maximum of the values.
     * 
     * @param other
     *            the instance to merge with.
     */
    public void merge(ThreadClock other)
    {
        for (Entry<Integer, Integer> entry : other.timesPerThread.entrySet())
            update(entry.getKey(), entry.getValue());
    }
}
