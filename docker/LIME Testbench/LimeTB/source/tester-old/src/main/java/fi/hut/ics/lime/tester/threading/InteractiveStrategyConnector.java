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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * A client-side interactive strategy connector. This connector queries the user for selections whenever multiple
 * options are available.
 * 
 * @author osaariki
 */
public class InteractiveStrategyConnector implements SchedulingStrategyConnector
{
    private static final String INDEX_COLUMN_TITLE     = "";
    private static final String NAME_COLUMN_TITLE      = "Event";
    private static final String EVENT_ID_COLUMN_TITLE  = "Id";
    private static final String THREAD_ID_COLUMN_TITLE = "Thread";
    private static final String LOCATION_COLUMN_TITLE  = "Location";
    private static final String PROMPT                 = "Which event next?";

    private PrintStream         out;
    private BufferedReader      in;

    /**
     * Creates a new instance of {@link InteractiveStrategyConnector}.
     */
    public InteractiveStrategyConnector()
    {
        this(System.out, new BufferedReader(new InputStreamReader(System.in)));
    }

    /**
     * Creates a new instance of {@link InteractiveStrategyConnector} with the specified input and output streams.
     * 
     * @param out
     *            the stream that will be used for output.
     * @param in
     *            the reader that will be used for input.
     */
    public InteractiveStrategyConnector(PrintStream out, BufferedReader in)
    {
        this.out = out;
        this.in = in;
    }

    public void initialize()
    {
    }

    public <T extends Event> T getDecision(Map<? extends EventIdentity, T> options)
    {
        Map<EventIdentity, T> enabledOptions = new HashMap<EventIdentity, T>();
        for (Entry<? extends EventIdentity, T> entry : options.entrySet())
            if (entry.getValue().isEnabled())
                enabledOptions.put(entry.getKey(), entry.getValue());
        
        assert enabledOptions.size() > 0;

        ArrayList<EventIdentity> sortedIdentities = new ArrayList<EventIdentity>(enabledOptions.keySet());

        if (sortedIdentities.size() == 1) {
            EventIdentity identity = sortedIdentities.get(0);
            T event = enabledOptions.get(identity);
            out.format("Running the only option: %1$s Id:%2$s Thread:%3$s at %4$s\n", event.getEventName(), identity
                    .getEventId(), identity.getExecutingThreadId(), event.getSourceLocation());
            return event;
        } else {
            Collections.sort(sortedIdentities);

            boolean selectionMade = false;
            int selection = -1;
            do {
                printOptions(sortedIdentities, enabledOptions);
                out.println(PROMPT);
                try {
                    String input = in.readLine();
                    try {
                        selection = Integer.parseInt(input) - 1;
                        selectionMade = true;
                    } catch (NumberFormatException e) {
                        out.println("Input is not a number, no event was selected.");
                        continue;
                    }
                } catch (IOException e) {
                    e.printStackTrace(out);
                    out.println();
                    out.println("Continuing with random selection...");
                    selection = 0;
                    selectionMade = true;
                }
            } while (!selectionMade || !(0 <= selection && selection < sortedIdentities.size()));

            return options.get(sortedIdentities.get(selection));
        }
    }

    /*
     * Prints the options out in a nice tabular format.
     */
    private void printOptions(ArrayList<EventIdentity> events, Map<? extends EventIdentity, ? extends Event> options)
    {
        String[][] fields = new String[events.size()][5];
        int[] maxLengths = new int[] { INDEX_COLUMN_TITLE.length(), NAME_COLUMN_TITLE.length(),
                EVENT_ID_COLUMN_TITLE.length(), THREAD_ID_COLUMN_TITLE.length(), LOCATION_COLUMN_TITLE.length() };

        for (int i = 0; i < fields.length; ++i) {
            EventIdentity identity = events.get(i);
            Event event = options.get(identity);

            String index = String.valueOf(i + 1) + ":";
            String name = event.getEventName();
            String eventId = String.valueOf(identity.getEventId());
            String threadId = String.valueOf(identity.getExecutingThreadId());
            String location = event.getSourceLocation();

            maxLengths[0] = Math.max(maxLengths[0], index.length());
            maxLengths[1] = Math.max(maxLengths[1], name.length());
            maxLengths[2] = Math.max(maxLengths[2], eventId.length());
            maxLengths[3] = Math.max(maxLengths[3], threadId.length());
            maxLengths[4] = Math.max(maxLengths[4], location.length());

            fields[i][0] = index;
            fields[i][1] = name;
            fields[i][2] = eventId;
            fields[i][3] = threadId;
            fields[i][4] = location;
        }

        String rowFormatString = "%1$-" + maxLengths[0] + "s %2$-" + maxLengths[1] + "s  %3$#" + maxLengths[2]
                + "s  %4$#" + maxLengths[3] + "s  %5$-" + maxLengths[4] + "s\n";

        out.format(rowFormatString, INDEX_COLUMN_TITLE, NAME_COLUMN_TITLE, EVENT_ID_COLUMN_TITLE,
                THREAD_ID_COLUMN_TITLE, LOCATION_COLUMN_TITLE);
        for (int i = 0; i < fields.length; ++i)
            out.format(rowFormatString, (Object[]) fields[i]);
    }

    public void close()
    {
    }
}
