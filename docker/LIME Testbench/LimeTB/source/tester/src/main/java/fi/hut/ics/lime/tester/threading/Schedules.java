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
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * This class contains methods for working with schedules, which are sequences of {@link EventSelection} instances.
 * 
 * @author osaariki
 */
public class Schedules
{
    private static final Pattern SCHEDULE_SPLIT_PATTERN   = Pattern.compile(";");
    private static final Pattern BACKTRACK_SPLIT_PATTERN  = Pattern.compile("\\&");
    private static final Pattern EVENT_LIST_SPLIT_PATTERN = Pattern.compile("\\s+");
    private static final Pattern SELECTION_SPLIT_PATTERN  = Pattern.compile("\\|");

    /**
     * Returns a string representation of the schedule. The returned string is one that the
     * {@link #parseSchedule(String, Collection)} method will parse.
     * 
     * @param schedule
     *            the schedule.
     * @return a string representation of the schedule.
     */
    public static String formatSchedule(Iterable<EventSelection> schedule)
    {
        StringBuilder sb = new StringBuilder();

        boolean onePrecedes = false;
        for (EventSelection selection : schedule) {
            if (onePrecedes)
                sb.append(" ; ");
            else
                onePrecedes = true;
            sb.append(formatEventSelection(selection));
        }

        return sb.toString();
    }

    /**
     * Parses a string representation of a schedule and adds it to the provided collection.
     * 
     * @param s
     *            the string to parse.
     * @param schedule
     *            the collection to append the schedule to.
     */
    public static void parseSchedule(String s, Collection<EventSelection> schedule)
    {
        if ((s = s.trim()).length() != 0) {

            String[] substrings = SCHEDULE_SPLIT_PATTERN.split(s);

            for (String eventSelectionString : substrings)
                try {
                    schedule.add(parseEventSelection(eventSelectionString));
                } catch (EventSelectionFormatException e) {
                    throw new ScheduleFormatException("A substring did not parse as an EventSelection: " + s, e);
                } catch (IllegalStateException e) {
                    throw new ScheduleFormatException("The provided container for the schedule is full.", e);
                } catch (UnsupportedOperationException e) {
                    throw new ScheduleFormatException("The provided container must support adding elements.", e);
                }
        }
    }

    /**
     * Returns a string representation of a set of backtracks for a backtracking point.
     * 
     * @param i
     *            the index of the transition stack to backtrack from.
     * @param backtracks
     *            the set of backtracks to add.
     * @return the string representation.
     */
    public static String formatBacktrack(int i, Iterable<EventIdentity> backtracks)
    {
        StringBuilder sb = new StringBuilder(String.valueOf(i));

        sb.append(" & ");
        sb.append(formatEventList(backtracks));

        return sb.toString();
    }

    /**
     * Parses a string representation of new backtracks.
     * 
     * @param s
     *            the string to parse.
     * @param backtrack
     *            the collection to add the backtracks to.
     * @return the index of the transition stack to backtrack from.
     */
    public static int parseBacktrack(String s, Collection<EventIdentity> backtrack)
    {
        String[] substrings = BACKTRACK_SPLIT_PATTERN.split(s);

        if (substrings.length != 2)
            throw new ScheduleFormatException("The backtrack string must have two '&' separated substrings.");

        try {
            int index = Integer.parseInt(substrings[0].trim());

            parseEventList(substrings[1].trim(), backtrack);

            return index;
        } catch (NumberFormatException e) {
            throw new ScheduleFormatException("The index substring did not parse as an int.", e);
        }
    }

    /**
     * Returns a string representation of a list of events.
     * 
     * @param events the events.
     * @return the string representation.
     */
    public static String formatEventList(Iterable<? extends EventIdentity> events)
    {
        StringBuilder sb = new StringBuilder();

        boolean first = true;
        for (EventIdentity event : events) {
            if (first)
                first = false;
            else
                sb.append(' ');
            sb.append(event.getShortName()).append(':').append(event.toString());
        }

        return sb.toString();
    }

    /**
     * Parses a string representation of a list of events.
     * 
     * @param s the string to parse.
     * @param events the collection to add the events to.
     */
    public static void parseEventList(String s, Collection<EventIdentity> events)
    {
        s = s.trim();

        if (s.length() > 0) {
            String[] eventSubstrings = EVENT_LIST_SPLIT_PATTERN.split(s);

            for (String eventSubstring : eventSubstrings)
                events.add(EventIdentity.detectTypeAndParse(eventSubstring));
        }
    }

    public static String formatEventSelection(EventSelection selection)
    {
        EventIdentity selectedEvent = selection.getSelectedEvent();
        Set<? extends EventIdentity> options = selection.getOptions();

        StringBuilder sb = new StringBuilder();
        sb.append(selectedEvent.getShortName()).append(':').append(selectedEvent.toString());
        sb.append(" | ");
        sb.append(formatEventList(options));

        return sb.toString();
    }

    /**
     * Parses a string representation of an {@link EventSelection} and returns a corresponding instance.
     * 
     * @param s
     *            the string to parse.
     * @return the corresponding {@link EventSelection}.
     * @throws EventSelectionFormatException
     *             if the syntax of the string is not valid.
     */
    public static EventSelection parseEventSelection(String s) throws EventSelectionFormatException
    {
        String[] substrings = SELECTION_SPLIT_PATTERN.split(s);

        if (substrings.length != 2)
            throw new EventSelectionFormatException("String to parse must have two '"
                    + SELECTION_SPLIT_PATTERN.pattern() + "' separated substrings: " + s);

        try {
            EventIdentity selection = EventIdentity.detectTypeAndParse(substrings[0]);

            List<EventIdentity> options = new ArrayList<EventIdentity>();

            parseEventList(substrings[1].trim(), options);

            return new EventSelection(selection, options);
        } catch (EventIdentityFormatException e) {
            throw new EventSelectionFormatException("A substring did not parse as an EventIdentity: " + s, e);
        }
    }
}
