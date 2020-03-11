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

package fi.hut.ics.lime.tester.server;

import java.io.*;
import java.net.*;

import java.util.concurrent.locks.Lock;
/**
 * SystemInformation is used to store information that different
 * test runs (Worker threads) need to access.
 *
 * @author ktkahkon
 */
public class SystemInformation
{
    public static BufferedWriter   testWriter;
    public static ServerSocket     server;
    public static int              maxConstraints;

    public static volatile int     fastUnsatCount;
    public static volatile int     unsatCount;

    public static Lock             lock;

    public static boolean       incremental;

    private static String          seed;
    private static String          testInputFile;
    private static String          strategy;

    private static volatile int    randomCount;
    private static volatile int    errorCount;
    private static volatile int    totalCount;
    private static volatile int    reachedDepthCount;
    private static volatile int    incorrectPathCount;

    private static int             maxDepth;
    private static boolean         isFinished;
    private static int             numberOfRuns;
    private static int             maxDefects;
    private static long            solverTime;
    private static int             heuristicPercentage;
    private static int             verbosity;

    private static boolean         sleepSetsEnabled;

    private static int             maxBranchCoverage;
    private static int             currentBranchCoverage;
    private static boolean[]       coveredBranches;

    static {
        seed                    = null;
        randomCount             = 0;
        strategy                = "DFS";
        maxDepth                = -1;
        maxDefects              = 1;
        solverTime              = 0;
        reachedDepthCount       = 0;
        incorrectPathCount      = 0;
        errorCount              = 0;
        totalCount              = 0;
        numberOfRuns            = -1;
        isFinished              = false;
        heuristicPercentage     = 0;
        maxConstraints          = 0;
        testInputFile           = "none";
        verbosity               = 1;
        maxBranchCoverage       = -1;
        currentBranchCoverage   = 0;
        coveredBranches         = null;
    }


    public static void setMaxBranchCoverage (int max)
    {
        maxBranchCoverage = max;
    }



    public static int getMaxBranchCoverage()
    {
        return maxBranchCoverage;
    }


    public static int getCurrentBranchCoverage()
    {
        return currentBranchCoverage;
    }


    public static synchronized void coverBranch (int id, boolean branch)
    {
        if (coveredBranches == null && maxBranchCoverage > 0)
            coveredBranches = new boolean[maxBranchCoverage];

        if (coveredBranches != null && id >= 0) {
            int key = id * 2;

            if (branch)
                key++;

            if (!coveredBranches[key]) {
                currentBranchCoverage++;
                coveredBranches[key] = true;
             //   System.out.println("covered: " + key);
            }
        }
    }
    
    public static boolean[] getCoveredBranches() {
    	return coveredBranches;
    }


    public static boolean hasBranchBeenCovered (int branch)
    {
        if (branch >= 0)
            return coveredBranches[branch];
        else
            return true;
    }

    
    public static synchronized void setMaxDefects (int value)
    {
        maxDefects = value;
    }



    public static synchronized int getMaxDefects()
    {
        return maxDefects;
    }



    public static synchronized void increaseSolverTime (long value)
    {
        solverTime += value;
    }



    public static synchronized long getSolverTime()
    {
        return solverTime;
    }



    public static synchronized boolean checkAndDecreaseMaxDefects()
    {
        if (maxDefects < 0)
            return true;

        if (maxDefects == 0)
            return false;

        maxDefects--;

        return true;
    }


    
    public static void reportDepth (int i)
    {
        if (i > maxConstraints)
            maxConstraints = i;
    }


    public static void setStrategy (String s)
    {
            strategy = s;
    }



    public static String getStrategy()
    {
        return strategy;
    }



    public static void setInputFile (String s)
    {
        testInputFile = s;
    }


    public static String getInputFile()
    {
        return testInputFile;
    }



    public static void setSeed (String s)
    {
        seed = s;
    }



    public static String getSeed()
    {
        return seed;
    }



    public static void setVerbosity (int i)
    {
        verbosity = i;
    }



    public static int getVerbosity()
    {
        return verbosity;
    }




    public static synchronized void setRandomCount (int i)
    {
        randomCount = i;
    }


    public static synchronized int getAndDecreaseRandomCount()
    {
        randomCount--;

        return randomCount + 1;
    }



    public static synchronized int getRandomCount()
    {
        return randomCount;
    }


    public static synchronized void addReachedDepthCount()
    {
        reachedDepthCount++;
        addTotalCount();
    }


    public static int getReachedDepthCount()
    {
        return reachedDepthCount;
    }


    public static synchronized void addErrorCount()
    {
        errorCount++;
        addTotalCount();
    }

    public static synchronized void addIncorrectPathCount()
    {
        incorrectPathCount++;
      //  addTotalCount();
    }


    public static int getIncorrectPathCount()
    {
        return incorrectPathCount;
    }


    public static int getErrorCount()
    {
        return errorCount;
    }



    public static synchronized void addTotalCount()
    {
        totalCount++;
    }


    public static int getTotalCount()
    {
        return totalCount;
    }



    public static  void setMaxDepth (int i)
    {
        maxDepth = i;
    }



    public static int getMaxDepth()
    {
        return maxDepth;
    }




    public static void setFinished()
    {
        isFinished = true;
    }

    public static boolean isFinished()
    {
        return isFinished;
    }




    public static synchronized void setNumberOfRuns (int i)
    {
        numberOfRuns = i;
    }



    public static synchronized int getNumberOfRuns()
    {
        return numberOfRuns;
    }


    public static synchronized void setHeuristicPercentage (int i)
    {
        heuristicPercentage = i;
    }



    public static synchronized int getHeuristicPercentage()
    {
        return heuristicPercentage;
    }



    public static synchronized boolean isSleepSetsEnabled()
    {
        return sleepSetsEnabled;
    }



    public static synchronized void setSleepSetsEnabled(boolean sleepSetsEnabled)
    {
        SystemInformation.sleepSetsEnabled = sleepSetsEnabled;
    }
}
