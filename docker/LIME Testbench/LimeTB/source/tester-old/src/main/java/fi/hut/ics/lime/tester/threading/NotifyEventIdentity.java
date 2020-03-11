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
 * Extends {@link EventIdentity} to differentiate between notify events that have the same event id and executing thread
 * but target different waiting threads.
 * 
 * @author osaariki
 */
public class NotifyEventIdentity extends EventIdentity
{
    private int targetThreadId;

    /**
     * Creates a new {@link NotifyEventIdentity} instance.
     * 
     * @param eventId
     *            the event's id.
     * @param executingThreadId
     *            the scheduler generated id for the executing thread.
     * @param targetThreadId
     *            the scheduler generated id for the target thread.
     */
    public NotifyEventIdentity(long eventId, int executingThreadId, int targetThreadId)
    {
        super(eventId, executingThreadId);
        this.targetThreadId = targetThreadId;
    }

    public NotifyEventIdentity(int executingThreadId, int targetThreadId) {
        super(executingThreadId);
        this.targetThreadId = targetThreadId;
    }

    /**
     * @return the scheduler generated id for the target thread.
     */
    public int getTargetThreadId()
    {
        return targetThreadId;
    }

    @Override
    public String getShortName()
    {
        return "NE";
    }

    @Override
    public boolean equalsEvent(EventIdentity other)
    {
        if (!(other instanceof NotifyEventIdentity))
            return false;
        NotifyEventIdentity otherNotify = (NotifyEventIdentity) other;
        return (targetThreadId == otherNotify.targetThreadId);
    }

    @Override
    public final int compareTo(EventIdentity o)
    {
        int comparison = super.compareTo(o);
        if (comparison == 0) {
            if (o instanceof NotifyEventIdentity) {
                NotifyEventIdentity otherNotify = (NotifyEventIdentity) o;
                if (targetThreadId < otherNotify.getTargetThreadId())
                    return -1;
                else if (targetThreadId == otherNotify.getTargetThreadId())
                    return 0;
                else
                    return 1;
            } else
                return comparison;
        } else
            return comparison;
    }

    @Override
    public final int hashCode()
    {
        return super.hashCode() ^ targetThreadId;
    }

    @Override
    public String toString()
    {
        return new StringBuilder(super.toString()).append(',').append(targetThreadId).toString();
    }

    /**
     * Parses a string and returns a corresponding {@link NotifyEventIdentity}. The string to parse must be of the form
     * {@literal "<long>,<long>,<long>"}, where the longs are the event id, the executing thread's id and the target
     * thread's id. The {@link #toString()} method is guaranteed to return a string of this form.
     * 
     * @param s
     *            the string to parse.
     * @return an instance of {@link NotifyEventIdentity}.
     * @throws EventIdentityFormatException
     *             if the string parameter is not of the proper form.
     */
    public static NotifyEventIdentity parseEventIdentity(String s) throws EventIdentityFormatException
    {
        String[] parameterStrings = SPLITTING_PATTERN.split(s);

        if (parameterStrings.length != 3)
            throw new EventIdentityFormatException("String to parse must have three comma separated substrings.");

        try {
            long eventId = Long.parseLong(parameterStrings[0]);
            int executingThreadId = Integer.parseInt(parameterStrings[1]);
            int targetThreadId = Integer.parseInt(parameterStrings[2]);
            return new NotifyEventIdentity(eventId, executingThreadId, targetThreadId);
        } catch (NumberFormatException e) {
            throw new EventIdentityFormatException("Substring did not parse as a long.", e);
        }
    }
}
