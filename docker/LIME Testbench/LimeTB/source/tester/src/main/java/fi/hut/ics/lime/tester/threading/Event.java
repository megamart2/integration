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
 * Interface for visible events.
 * 
 * @author osaariki
 */
public interface Event
{
    public enum Type
    {
        // TODO: Split up PARKRELATED as needed.
        READ, READ_WRITE, ENTERMONITOR, INSIDEMONITOR, PARKRELATED
    }

    /**
     * @return a human readable name for the event.
     */
    String getEventName();

    /**
     * @return a string that identifies the source file and line number from which this event originated.
     */
    String getSourceLocation();

    /**
     * @return this event's identity object.
     */
    EventIdentity getIdentity();

    /**
     * @return the communication object this event operates on.
     */
    CommunicationObject getCommunicationObject();

    /**
     * @return the type of this event.
     */
    Type getType();

    /**
     * @return <code>true</code> if this event is enabled, <code>false</code> otherwise.
     */
    boolean isEnabled();

    /**
     * @param other the event with which to check the dependency.
     * @return <code>true</code> if this event might be dependent with the other event, <code>false</code> otherwise.
     */
    boolean mightBeDependentWith(Event other);
}
