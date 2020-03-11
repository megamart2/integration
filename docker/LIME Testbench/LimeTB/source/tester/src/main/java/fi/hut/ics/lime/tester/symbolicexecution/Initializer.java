/*
Copyright (c) 2008 - 2009 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester.symbolicexecution;

import java.lang.Thread.UncaughtExceptionHandler;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.LinkedList;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import fi.hut.ics.lime.tester.communication.TCPCommunication;
import fi.hut.ics.lime.tester.solver.Boolector;
import fi.hut.ics.lime.tester.solver.ConstraintSolver;
import fi.hut.ics.lime.tester.solver.Yices;
import fi.hut.ics.lime.tester.threading.DPORStrategyConnector;
import fi.hut.ics.lime.tester.threading.DummyStrategyConnector;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;
import fi.hut.ics.lime.tester.threading.SchedulerInitializer;
import fi.hut.ics.lime.tester.threading.Schedules;

/**
 * A class containing methods for initialization and ending of symbolic execution. No instance of this class is supposed
 * to be created.
 */
public class Initializer
{
    private static final Pattern SCHEDULE_MESSAGE_PATTERN = Pattern.compile("Schedule: (.*)$?");
    private static final Pattern SLEEPSET_MESSAGE_PATTERN = Pattern.compile("Sleep set: (.*)$?");
    public static final String INSTRUMENTED_TAG = "<INSTRUMENTED>";

    public static void initialize (String host, int port, int verbosity, String solverString, String hClass, String hMethod, String clinitClasses, int readsCommuteInt)
    {
        if (Symbolic.isExecuting)
            return;

        boolean readsCommute = (readsCommuteInt == 1);

        System.out.println(INSTRUMENTED_TAG);
        
        ConstraintSolver solver   = null;
        StringTokenizer tokenizer = null;
        
        Execution.verbosityLevel  = verbosity;
        Execution.communication   = new TCPCommunication(host, port);

        int connectionCounter = 0;

        while (!Execution.communication.isConnected() && connectionCounter < 2) {
            System.out.println("Could not connect to the test server. Trying again in a few moments.");
            connectionCounter++;

            try {
                Thread.sleep(3000);
            }
            catch (InterruptedException e) {
                
            }

            Execution.communication   = new TCPCommunication(host, port);
        }

        if (!Execution.communication.isConnected()) {
            System.out.println("Could not connect to the test server. Terminating this test run.");
            System.exit(0);
        }

        Execution.communication.sendMessage("client");

        String primitiveInput     = Execution.communication.getMessage();
        String referenceInput     = Execution.communication.getMessage();
        String schedule           = Execution.communication.getMessage();
        String sleepSetString     = Execution.communication.getMessage();
        String maxGotos           = Execution.communication.getMessage();
        String seedString         = Execution.communication.getMessage();
        
        Execution.random          = new Random(Long.valueOf(seedString).longValue());
        Execution.heuristicClass  = hClass;
        Execution.heuristicMethod = hMethod;
        Symbolic.branchesTaken    = "";

        Symbolic.symbolicNumber = 0;
        Symbolic.currentInput   = 1;

        Symbolic.parameterQueue = new LinkedList<String>();
        Symbolic.inputValues    = new LinkedList<String>();

        Symbolic.branchString = "";
        Symbolic.hasExecutedSymbolic = false;

        Symbolic.maxGotos = Integer.valueOf(maxGotos).intValue();

        //TODO: read this from instrumented argument (host, port, verbosity, objConstType)
        Symbolic.collectedObjectConstraints = Symbolic.ObjectConstraintOption.COLLECT;

        boolean isInputFound = false;

        long totalTime = 0;
        int constraints = 0;

        System.out.println("=============================================================================");
        System.out.println("| Starting a new test run |");
        System.out.println("---------------------------");

        while (!isInputFound) {
            if (primitiveInput.startsWith("All done.")) {
                if (Execution.verbosityLevel > 0) 
                    System.out.println("Testing completed.");

                Execution.communication.end();
                System.exit(0);
            }
            
            if (solverString.equals("Yices")) {
                solver = new Yices();
                Symbolic.solverTheory = "linear";
            }
            else if (solverString.equals("Boolector")) {
                solver = new Boolector();
                Symbolic.solverTheory = "bitvector";
            }
            else  {
                System.out.println("ERROR: unknown solver specified in properties file.");
                System.out.println("Boolector and Yices are currently supported.");
                System.exit(1);
            }


            if (primitiveInput.startsWith("Solve:")) {
                long time  = System.nanoTime();
                primitiveInput = solver.solveArithmeticConstraint(primitiveInput.substring(7));
                long time2 = System.nanoTime();

                totalTime = totalTime + (time2 - time);
            }
            else if (primitiveInput.startsWith("Solved:"))
                primitiveInput = primitiveInput.substring(8);

            if (referenceInput.startsWith("Solve:")) {
                long time  = System.nanoTime();
                referenceInput = solver.solvePointerConstraint(referenceInput.substring(7));
                long time2 = System.nanoTime();

                totalTime = totalTime + (time2 - time);
            }
            else if (referenceInput.startsWith("Solved:"))
                referenceInput = referenceInput.substring(8);

            
            if (primitiveInput.equals("unsat") || referenceInput.equals("unsat")) {
                Execution.communication.sendMessage("Unsatisfiable input constraint");
                primitiveInput = Execution.communication.getMessage();
                referenceInput = Execution.communication.getMessage();
                schedule       = Execution.communication.getMessage();

                // Printing something to the user if it takes a long time to find
                // constraints that are satisfiable
                if (constraints > 32) {
                    System.out.println("Still searching for suitable input values. Please wait.");
                    constraints = 0;
                }

                constraints++;
            }
            else {
                isInputFound = true;
            }
        }

        if (Execution.verbosityLevel > 1)
            printInputs(primitiveInput, referenceInput, schedule, maxGotos);

        Execution.communication.sendMessage("Solver time: " + totalTime);

        Symbolic.maxInput = 0;

        tokenizer = new StringTokenizer(primitiveInput);

        while (tokenizer.hasMoreTokens() && !primitiveInput.equals("empty") && !primitiveInput.equals("null")) {
            String value  = tokenizer.nextToken();
            Symbolic.maxInput++;
            Symbolic.inputValues.add(value);
        }

        /*
         * Scheduler stuff
         */
        ArrayList<EventSelection> serverSchedule = new ArrayList<EventSelection>();
        Matcher scheduleMatcher = SCHEDULE_MESSAGE_PATTERN.matcher(schedule);
        if (scheduleMatcher.matches()) {
            assert scheduleMatcher.groupCount() == 1;
            Schedules.parseSchedule(scheduleMatcher.group(1), serverSchedule);
        } else {
            System.out.println("Could not parse recieved schedule string: " + schedule);
            System.exit(1);
        }

        ArrayList<EventIdentity> sleepSet = new ArrayList<EventIdentity>();
        Matcher sleepSetMatcher = SLEEPSET_MESSAGE_PATTERN.matcher(sleepSetString);
        if (sleepSetMatcher.matches()) {
            assert sleepSetMatcher.groupCount() == 1;
            Schedules.parseEventList(sleepSetMatcher.group(1), sleepSet);
        } else {
            System.out.println("Could not parse recieved sleep set string: " + sleepSetString);
            System.exit(1);
        }

        // TODO: Allow the strategy connector to be selected (during instrumentation perhaps?).
        Execution.connector = new DPORStrategyConnector(Execution.communication, serverSchedule, sleepSet, new DummyStrategyConnector(false), readsCommute);
        Execution.connector.initialize();
        SchedulerInitializer.initialize(Execution.connector);

        //---- OBJECT STUFF ----
        Symbolic.mapR           = new IdentityHashMap<Object,String>();
        Symbolic.objectList     = new LinkedList<String>();
        Symbolic.objectMap      = new TreeMap<String,Object>();
        Symbolic.mapInitialized = new IdentityHashMap<Object,String>();
        Symbolic.objectNumber = 1;

        if (referenceInput == null ||referenceInput.equals("null"))
            referenceInput = "";

        tokenizer = new StringTokenizer(referenceInput);

        while (tokenizer.hasMoreTokens() && !referenceInput.equals("empty"))
            Symbolic.objectList.add(tokenizer.nextToken());

        Symbolic.isExecuting = true;

        /*
         * Add shutdown hook to close the communication to the server when the application shuts down.
         */
        Runtime.getRuntime().addShutdownHook(new Thread() {
            public void run()
            {
                end(0);
            }
        });

        /*
         * Add an exception handler to terminate the execution with an error if the main thread terminates with an
         * uncaught exception.
         */
        UncaughtExceptionHandler newHandler = new Thread.UncaughtExceptionHandler() {
            public void uncaughtException(Thread t, Throwable e)
            {
                e.printStackTrace();
                end(1);
            }
        };
        Thread.setDefaultUncaughtExceptionHandler(newHandler);

        for (String cls : clinitClasses.split("\n")) {
            try {
                Class.forName(cls).getCanonicalName();
            } catch (ClassNotFoundException ex) {}
        }
    }

    public static void end(int i)
    {
        if (i == 0) {
            Execution.connector.close();
            Execution.communication.sendMessage("All done.");
            Execution.communication.end();
        } else {
            Execution.connector.close();
            Execution.communication.end();
            System.exit(1);
        }
    }

    private static void printInputs(String primitiveInput, String referenceInput, String schedule, String gotos)
    {
        System.out.println("Primitive input: " + primitiveInput);
        System.out.println("Object input: " + referenceInput);

        if (Execution.verbosityLevel >= 3) {
            if (gotos.equals("-1"))
                System.out.println("Depth limit: infinite");
            else
                System.out.println("Depth limit: " + gotos);
        }

        System.out.println("-----------------------------------------------------------------------------");
    }
}
