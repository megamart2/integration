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

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Represents a selection of a schedulable event from a set of possibilities.
 * 
 * @author osaariki
 */
public class EventSelection
{
    private EventIdentity                selectedEvent;
    private Set<? extends EventIdentity> options;

    /**
     * Creates a new instance of {@link EventSelection} with the specified selection and options.
     * 
     * @param selectedEvent
     *            the selected event.
     * @param options
     *            the options.
     */
    public EventSelection(EventIdentity selectedEvent, Collection<? extends EventIdentity> options)
    {
        this.selectedEvent = selectedEvent;
        this.options = Collections.unmodifiableSet(new HashSet<EventIdentity>(options));
    }

    /**
     * @return the selection.
     */
    public EventIdentity getSelectedEvent()
    {
        return selectedEvent;
    }

    /**
     * @return the options.
     */
    public Set<? extends EventIdentity> getOptions()
    {
        return options;
    }
}
