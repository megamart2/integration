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
import java.util.regex.Pattern;

/**
 * Contains the information required to differentiate one visible event from another.
 * 
 * @author osaariki
 */
public class EventIdentity implements Comparable<EventIdentity>
{
    protected static final Pattern SPLITTING_PATTERN                 = Pattern.compile(",");
    private static final Pattern   EVENT_IDENTITY_TYPE_SPLIT_PATTERN = Pattern.compile(":");

    private long                   eventId;
    private int                    executingThreadId;

    protected static Map<Integer,Long> lastEvents = new HashMap<Integer, Long>();

    /**
     * Creates a new {@link EventIdentity} instance.
     * 
     * @param eventId
     *            the event's id.
     * @param executingThreadId
     *            the scheduler generated id for the executing thread.
     */
    public EventIdentity(long eventId, int executingThreadId)
    {
        this.eventId = eventId;
        this.executingThreadId = executingThreadId;
    }

    public EventIdentity(int threadId) {
        if (lastEvents.containsKey(threadId)) {
            this.eventId = lastEvents.get(threadId)+1;
        } else {
            this.eventId = 1;
        }
        this.executingThreadId = threadId;
        lastEvents.put(threadId, this.eventId);
    }

    /**
     * @return the identifier for the event.
     */
    public long getEventId()
    {
        return eventId;
    }

    /**
     * @return the scheduler assigned thread identifier for the executing thread.
     */
    public int getExecutingThreadId()
    {
        return executingThreadId;
    }

    /**
     * @return an abbreviated name for this event identity class.
     */
    public String getShortName()
    {
        return "E";
    }

    /**
     * Checks whether this identity is equal to another from this instance's perspective. The {@link #equals(Object)}
     * implementation in this class uses this method. Subclasses of {@link EventIdentity} should override this method to
     * check for all added fields.
     * 
     * @param other
     *            the event identity to check against.
     * @return <code>true</code> if this event identity is equal to the other one (as far as this instance can discern).
     *         Otherwise returns <code>false</code>.
     */
    public boolean equalsEvent(EventIdentity other)
    {
        return (eventId == other.eventId) && (executingThreadId == other.executingThreadId);
    }

    public int compareTo(EventIdentity o)
    {
        if (eventId < o.getEventId())
            return -1;
        else if (eventId == o.getEventId()) {
            if (executingThreadId < o.getExecutingThreadId())
                return -1;
            else if (executingThreadId == o.getExecutingThreadId())
                return 0;
            else
                return 1;
        } else
            return 1;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
            return true;
        if (!(obj instanceof EventIdentity))
            return false;
        EventIdentity other = (EventIdentity) obj;
        return equalsEvent(other) && other.equalsEvent(this);
    }

    @Override
    public int hashCode()
    {
        return (int) (eventId ^ (eventId >>> 32) ^ executingThreadId);
    }

    @Override
    public String toString()
    {
        return new StringBuilder(String.valueOf(eventId)).append(',').append(executingThreadId).toString();
    }

    /**
     * Parses a string and returns a corresponding {@link EventIdentity}. The string to parse must be of the form
     * {@literal "<long>,<long>"}, where the longs are the event id and the executing thread's id. The
     * {@link #toString()} method is guaranteed to return a string of this form.
     * 
     * @param s
     *            the string to parse.
     * @return an instance of {@link EventIdentity}.
     * @throws EventIdentityFormatException
     *             if the string parameter is not of the proper form.
     */
    public static EventIdentity parseEventIdentity(String s) throws EventIdentityFormatException
    {
        String[] parameterStrings = SPLITTING_PATTERN.split(s);

        if (parameterStrings.length != 2)
            throw new EventIdentityFormatException("String to parse must have two comma separated substrings.");

        try {
            long eventId = Long.parseLong(parameterStrings[0]);
            int executingThreadId = Integer.parseInt(parameterStrings[1]);
            return new EventIdentity(eventId, executingThreadId);
        } catch (NumberFormatException e) {
            throw new EventIdentityFormatException("Substring did not parse as a number.", e);
        }
    }

    /**
     * Reads and parses a string containing the short name of the event and the main event identity.
     * 
     * @param s
     *            the string to parse.
     * @return a corresponding {@link EventIdentity} or some subclass.
     * @throws EventIdentityFormatException
     *             if the string to parse is malformed.
     */
    public static EventIdentity detectTypeAndParse(String s) throws EventIdentityFormatException
    {
        String[] substrings = EVENT_IDENTITY_TYPE_SPLIT_PATTERN.split(s.trim());

        if (substrings.length != 2)
            throw new EventIdentityFormatException("String to parse must have two '"
                    + EVENT_IDENTITY_TYPE_SPLIT_PATTERN.pattern() + "' separated substrings: " + s);

        if (substrings[0].equals("E")) {
            return EventIdentity.parseEventIdentity(substrings[1]);
        } else if (substrings[0].equals("NE")) {
            return NotifyEventIdentity.parseEventIdentity(substrings[1]);
        } else
            throw new EventIdentityFormatException("Unidentified EventIdentity type in: " + s);
    }
}
