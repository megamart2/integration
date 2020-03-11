/*
Copyright (c) 2008 Helsinki University of Technology (TKK)

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

package fi.hut.ics.lime.tester;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.net.ServerSocket;
import java.net.SocketException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;
import java.util.concurrent.locks.ReentrantLock;

import fi.hut.ics.lime.tester.server.SystemInformation;
import fi.hut.ics.lime.tester.server.TreeManager;
import fi.hut.ics.lime.tester.server.Worker;
import fi.hut.ics.lime.tester.server.strategies.BasicTree;
import fi.hut.ics.lime.tester.server.strategies.BranchCoverageTree;
import fi.hut.ics.lime.tester.server.strategies.RandomTree;
import fi.hut.ics.lime.tester.server.strategies.SimpleTree;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ScheduledExecutionTree;
import fi.hut.ics.lime.tester.server.strategies.scheduling.SchedulesOnlyTree;
import fi.hut.ics.lime.tester.server.strategies.scheduling.SimpleScheduledTree;



/**
 * Main class for the LCT test server. This class
 */
public class TestServer
{
    private ServerSocket server = null;
    private int port;
    private Object executionTree;
    private String pidFile="";


    public TestServer (String strategyArgument, String depthArgument, String testRunsArgument, String maxDefectsArgument)
    {
        executionTree        = null;
        port                 = 0;

        /* Loading settings */
        Properties defaults = new java.util.Properties();
        java.net.URL url = ClassLoader.getSystemResource("testerproperties/defaultsettings.properties");

        try {
            defaults.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open defaultsettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        Properties properties = new java.util.Properties(defaults);
        url = ClassLoader.getSystemResource("testerproperties/usersettings.properties");

        try {
            properties.load(url.openStream());
        } catch (Exception e) {
            System.out.println("Unable to open usersettings.properties.");
            System.err.println("Make sure that the property file is added to the classpath.");
            System.exit(0);
        }

        if (strategyArgument == null)
            SystemInformation.setStrategy(properties.getProperty("strategy"));
        else
            SystemInformation.setStrategy(strategyArgument);

        port = Integer.valueOf(properties.getProperty("serverPort")).intValue();

        SystemInformation.setSeed(properties.getProperty("seed"));

        String maxDepth;

        if (depthArgument == null)
            maxDepth = properties.getProperty("maxDepth");
        else
            maxDepth = depthArgument;

        if (maxDepth.equals("infinite"))
            SystemInformation.setMaxDepth(-1);
        else
            SystemInformation.setMaxDepth(Integer.valueOf(maxDepth).intValue());

        String testRuns = null;

        if (testRunsArgument == null)
            testRuns = properties.getProperty("testRuns");
        else
            testRuns = testRunsArgument;
        
        if (testRuns.equals("infinite"))
            SystemInformation.setNumberOfRuns(-1);
        else
            SystemInformation.setNumberOfRuns(Integer.valueOf(testRuns).intValue());

        String maxDefects;

        if (maxDefectsArgument == null)
            maxDefects = properties.getProperty("maxDefects");
        else
            maxDefects = maxDefectsArgument;

        if (maxDefects.equals("infinite"))
            SystemInformation.setMaxDefects(-1);
        else
            SystemInformation.setMaxDefects(Integer.valueOf(maxDefects).intValue());

        SystemInformation.setSleepSetsEnabled(Boolean.parseBoolean(properties.getProperty("sleepSets")));

        SystemInformation.setInputFile(properties.getProperty("testInputFile"));

        SystemInformation.setHeuristicPercentage(Integer.valueOf(properties.getProperty("heuristicPercentage")).intValue());

        SystemInformation.setVerbosity(Integer.valueOf(properties.getProperty("serverVerbosity")).intValue());

        if (properties.containsKey("incremental") &&
                (properties.getProperty("incremental").trim().equalsIgnoreCase("yes") ||
                properties.getProperty("incremental").trim().equalsIgnoreCase("true") ||
                properties.getProperty("incremental").trim().equals("1")))
            SystemInformation.incremental=true;
        else
            SystemInformation.incremental=false;

        pidFile = properties.getProperty("pidFile");
        
        //TODO: catch exception to indicate that the properties files contained wrong values (e.g., testRuns = foobar)

        executionTree = chooseExecutionTree();
  
    }



    public void startServer()
    {
        boolean testingStarted = false;
        long time = 0;

        try { server = new ServerSocket(port); }
        catch (IOException e) {
            System.err.println("Could not listen on port " + port);
            System.exit(-1);
        }
        
        if (pidFile != null && !pidFile.equals("")) {
            File pid=new File(pidFile);
            pid.deleteOnExit();
            try {
                BufferedWriter out=new BufferedWriter(new FileWriter(pid));
                out.write(ManagementFactory.getRuntimeMXBean().getName().split("@")[0]);
                out.close();
            } catch (IOException ex) {
            }
        }

        SystemInformation.server = server;

        BufferedWriter out = null;

        if (!SystemInformation.getInputFile().equals("none")) {
            try {
                out = new BufferedWriter(new FileWriter(SystemInformation.getInputFile()));
            } catch (IOException e) {
            //TODO: error handling
            }
        }

        SystemInformation.testWriter = out;

        System.out.println("-------------------------------------------");
        System.out.println("Server started.");
        System.out.println("Listening on port: " + port);
        System.out.println("Search strategy: " + SystemInformation.getStrategy());

        if (SystemInformation.getNumberOfRuns() == -1)
            System.out.println("Maximum number of test runs: infinite");
        else
            System.out.println("Maximum number of test runs: " + SystemInformation.getNumberOfRuns());


        if (SystemInformation.getMaxDefects() == -1)
            System.out.println("Maximum number of defects to be searched: infinite");
        else
            System.out.println("Maximum number of defects to be searched: " + SystemInformation.getMaxDefects());

        System.out.println("Maximum search depth: " + SystemInformation.getMaxDepth());

        System.out.println("-------------------------------------------");

        File stored_tree_file = new File("tree");
        if(SystemInformation.incremental && stored_tree_file.exists()) {
        	System.out.println("Incremential testing.");
        	executionTree = TreeManager.readTree(stored_tree_file.getAbsolutePath());
        }

        SystemInformation.lock = new ReentrantLock();
        SystemInformation.lock.lock();
        
        try {
            while (!SystemInformation.isFinished()) {
                Worker w = null;
                Thread t = null;
                
                try { w = new Worker(server.accept(), executionTree); }
                catch (IOException e) {
                    if (e instanceof SocketException) {
                        // server was closed.
                    }
                    else
                        System.err.println("Accepting a client failed.");
                }
                
                if (!testingStarted) {
                    Calendar cal = Calendar.getInstance();
                    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss z");
                    System.out.println("Testing started at " + sdf.format(cal.getTime()));
                    System.out.println("-------------------------------------------");
                    System.out.println(" ");
                    testingStarted = true;
                    time = System.currentTimeMillis();
                }
                t = new Thread(w);
                
                t.start();
            }
        } finally {
            SystemInformation.lock.unlock();
        }
        
        if(SystemInformation.incremental) {
        	if(executionTree instanceof ScheduledExecutionTree) {
        		TreeManager.writeTree((ScheduledExecutionTree)executionTree, "tree");
        	}
        }
        
        double solverTime = (double)(SystemInformation.getSolverTime() / 1000000.0);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss z");

        double currentCoverage = SystemInformation.getCurrentBranchCoverage();
        double maxCoverage     = SystemInformation.getMaxBranchCoverage();

        double coveragePercentage = (currentCoverage / maxCoverage) * 100;
        DecimalFormat df = new DecimalFormat("#.##");

        System.out.println("-------------------------------------------");
        System.out.println("Testing finished at "+ sdf.format(cal.getTime()));
        System.out.println("-------------------------------------------");
        System.out.println("Errors found in " + SystemInformation.getErrorCount() + " symbolic execution path(s).");
        System.out.println("Depth limit reached in " + SystemInformation.getReachedDepthCount() + " symbolic execution path(s).");
        System.out.println("Failed to follow correct path: " + SystemInformation.getIncorrectPathCount() + " time(s).");
        System.out.println("Total number of explored paths: " + SystemInformation.getTotalCount());
     
        if (SystemInformation.getVerbosity() >= 2)
            System.out.println("Time spent in parsing and solving constraints: " + solverTime + " ms");

        System.out.println("Total time spent: " + ((System.currentTimeMillis() - time) / 1000) + " s");

        if (SystemInformation.getVerbosity() >= 2)
            System.out.println("Unsatisfiable constraints: " + SystemInformation.unsatCount + " (fast unsat " + SystemInformation.fastUnsatCount + ")");

        if (SystemInformation.getMaxBranchCoverage() > 0)
            System.out.println("Branch coverage: " + SystemInformation.getCurrentBranchCoverage() +
                                                                     "/" +
                                                                     SystemInformation.getMaxBranchCoverage() +
                                                                     " (" + df.format(coveragePercentage) + "%)");

        System.out.println("-------------------------------------------");

        if (SystemInformation.testWriter != null) {
            try {
                SystemInformation.testWriter.close();
            }
            catch (IOException e) {
            //TODO: error handling
            }
        }
        System.exit(0);
    }


    
    private Object chooseExecutionTree()
    {
        Object e = null;
//        if ((new File("tree")).exists()) {
//            return TreeManager.readTree("tree");
//        }

        if (SystemInformation.getStrategy().equals("DFS") || SystemInformation.getStrategy().equals("BFS")) {
            e = new SimpleTree();
            System.out.println("IMPORTANT: DFS and BFS searches do not currently support multiple concurrent test executions!");
        }
        else if (SystemInformation.getStrategy().equals("random priority") || SystemInformation.getStrategy().equals("random selection"))
            e = new RandomTree();
        else if (SystemInformation.getStrategy().equals("random")) {
            e = new BasicTree();
        }
        else if (SystemInformation.getStrategy().equals("branch coverage")) {
            e = new BranchCoverageTree();
        }
        else if (SystemInformation.getStrategy().equals("dpor only") || SystemInformation.getStrategy().equals("schedules only")) {
            e = new SchedulesOnlyTree();
        }
        else if (SystemInformation.getStrategy().equals("scheduled DFS") || SystemInformation.getStrategy().equals("scheduled exhaustive")) {
            e = new SimpleScheduledTree();
        }
        else {
            System.err.println("ERROR: Unknown strategy (" + SystemInformation.getStrategy() + ").");
            System.exit(-1);
        }

        return e;
    }

    public static void main (String args[])
    {
        String strategy = null;
        String depth    = null;
        String tests    = null;
        String errors   = null;

        for (int i = 0; i < args.length; i++) {
            if (args[i].equals("-strategy:randompriority"))
                strategy = "random priority";
            else if (args[i].equals("-strategy:randomselection"))
                strategy = "random selection";
            else if (args[i].equals("-strategy:DFS"))
                strategy = "DFS";
            else if (args[i].equals("-strategy:BFS"))
                strategy = "BFS";
            else if (args[i].startsWith("-depth:"))
                depth = args[i].substring(7);
            else if (args[i].startsWith("-maxTests:"))
                tests = args[i].substring(10);
            else if (args[i].startsWith("-maxErrors:"))
                errors = args[i].substring(11);
        }

        TestServer t = new TestServer(strategy, depth, tests, errors);
        t.startServer();
    }
}
