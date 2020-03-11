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

package fi.hut.ics.lime.tester.server;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;

import fi.hut.ics.lime.tester.server.strategies.RandomPriority;
import fi.hut.ics.lime.tester.server.strategies.RandomSelection;
import fi.hut.ics.lime.tester.server.strategies.BranchCoverageStrategy;
import fi.hut.ics.lime.tester.server.strategies.DFS;
import fi.hut.ics.lime.tester.server.strategies.BFS;
import fi.hut.ics.lime.tester.server.strategies.Random;
import fi.hut.ics.lime.tester.server.strategies.ExecutionStrategy;
import fi.hut.ics.lime.tester.server.strategies.scheduling.BranchingTail;
import fi.hut.ics.lime.tester.server.strategies.scheduling.DPOROnlyStrategy;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ExecutionNodeHead;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ExhaustiveSearchStrategy;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ScheduledDFSStrategy;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ScheduledExecutionTree;
import fi.hut.ics.lime.tester.server.strategies.scheduling.SchedulesOnlyDFSStrategy;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;
import fi.hut.ics.lime.tester.threading.Schedules;

public class Worker implements Runnable {
    private Socket client;
    private Object executionTree;

    private String               inputString;
    private String               objectString;
    private List<EventSelection> schedule;

    private boolean isDropped;

    
    public Worker (Socket s, Object eT)
    {
        client            = s;
        executionTree     = eT;
        inputString       = "";
        objectString      = "";
        schedule          = new ArrayList<EventSelection>();
        isDropped         = false;
    }



    //TODO: make this more modular and clean up the code
    public void run()
    {
        ExecutionStrategy execution = chooseStrategy();

        BufferedReader in   = null;
        PrintWriter out     = null;

        try {
            in  = new BufferedReader(new InputStreamReader(client.getInputStream()));
            out = new PrintWriter(client.getOutputStream(), true);
        }
        catch (IOException e) {
            System.out.println("ERROR: TCP connection failure.");
            System.exit(-1);
        }

        String clientType = null;
        try {
            clientType = in.readLine();
        }
        catch (IOException e) {
             //TODO: error handling
        }


        if (clientType.equals("launcher")) {
          //  out.println("Ack");
            SystemInformation.lock.lock();
            out.println("Testing has been finished");
            SystemInformation.lock.unlock();
            return;
        }
        else if (clientType.equals("stop")) {
            SystemInformation.setFinished();
            
            try {
                SystemInformation.server.close();
            }
            catch(IOException e) {
                System.err.println(e);
            }

            return;
        }
        else if (clientType.equals("changed methods")) {
        	
        	System.out.println("Reading changed methods");
        	
			try {

				TreeSet<String> changed_method_signatures = new TreeSet<String>();

				String line = null;

				while ((line = in.readLine()) != null) {
					changed_method_signatures.add(line);
					System.out.println(line);
				}

				System.out.println("Stripping tree.");
				
				stripChangedMethods(((ScheduledExecutionTree) executionTree)
						.getRoot(), changed_method_signatures);

				System.out.println("Execution tree stripped. explored paths: "+SystemInformation.getTotalCount());

			} catch (IOException e) {
				 System.err.println(e);
			}
			
			try {
	            out.close();
	            in.close();
	            client.close();
	        }
	        catch (IOException e) {
	            System.out.println("Closing failed");
	            System.exit(-1);
	        }
			
        	return;
        }


        // Check if the user has set a maximum number of test runs in properties file
        if (SystemInformation.getNumberOfRuns() != -1) {
            if (SystemInformation.getNumberOfRuns() == 0) {
                execution.setFinished("All done.");
                try {
                    SystemInformation.setFinished();
                    SystemInformation.server.close();
                }
                catch(IOException e) {
                    System.err.println(e);
                }
            }
            else
                execution.computeNewInputs();

            SystemInformation.setNumberOfRuns(SystemInformation.getNumberOfRuns() - 1);
        }
        else
            execution.computeNewInputs();

        out.println(execution.getPrimitiveInputs());
        out.println(execution.getReferenceInputs());
        out.println("Schedule: " + Schedules.formatSchedule(execution.getScheduling()));
        out.println("Sleep set: " + Schedules.formatEventList(execution.getSleepSet()));
        out.println(SystemInformation.getMaxDepth());

        long seed = 0;
        
        if (SystemInformation.getSeed() == null || SystemInformation.getSeed().startsWith("current"))
            seed = System.currentTimeMillis();
        else
            seed = Long.valueOf(SystemInformation.getSeed()).longValue();

        out.println(seed);

        if (execution.getPrimitiveInputs().equals("All done.")) {
            SystemInformation.setFinished();
            try {
                SystemInformation.server.close();
            }
            catch(IOException e) {
                System.err.println(e);
            }
        }

        String line                 = null;
        String JUnitInputs          = "";
        int objectCounter           = 1;
        boolean isInputObjectField  = false;
        String inputObject          = "";
        String inputField           = "";

        while (!execution.isFinished()) { 
            try { 
                line = in.readLine();
            }
            catch (IOException e) {
                line = null; // for C-client compatibility
                
                // TODO: originally this exception handler terminated
                // the worker thread without reporting an error in the
                // program under test. This modification was made for
                // C-client compatibility but now the server might report
                // spurious errors if there are problems with the network
                // connection. Some redesigning of the error detection
                // system might be needed.
            }

            if (SystemInformation.getVerbosity() > 4)
                System.out.println("[DEBUG] message: " + line);

            if (line == null) {
                if (SystemInformation.checkAndDecreaseMaxDefects()) {
                    System.out.println("Error found");
                    //System.out.println("Input values used: " + inputString);
                    System.out.println("Inputs used: " + JUnitInputs);
                    System.out.println("Schedule: " + Schedules.formatSchedule(schedule));
                   // System.out.println("Seed value used: " + seed + "\n");

                    execution.setFinished("error");
                    SystemInformation.addErrorCount();
                    
                    if (SystemInformation.getMaxDefects() == 0)
                        SystemInformation.setFinished();
                    
                    break;
                }
                else {
                    execution.setFinished("error");
                    SystemInformation.setFinished();
                    break;
                }
            }
            else if (line.equals("All done.")) {
                execution.setFinished("All done.");
                SystemInformation.addTotalCount();
            }
            else if (line.equals("Drop test")) {
                execution.setFinished("depth"); //todo: change depth to something else
                isDropped = true;
            }
         //   else if (line.equals("Maximum number of gotos reached")) {
            else if (line.equals("Maximum depth reached")) {
                execution.setFinished("depth");
                SystemInformation.addReachedDepthCount();

                if (execution.isPartialOrderReductionStrategy()) {
                    if (SystemInformation.getVerbosity() > 0)
                        System.out.println("WARNING: Depth limit was reached while using a partial-order reduction \n"
                                + "strategy: some possible executions might have been missed. Please change to an \n"
                                + "exhaustive search strategy or raise the depth limit.");
                }
            }

            else if (line.startsWith("New arithmetic condition:")) {
                String[] condition = line.substring(26).split(" ");

                boolean branch = false;

                if (condition[3].equals("true"))
                    branch = true;
                else
                    branch = false;

                execution.addBranch(condition[0] + " " + condition[1] + " " + condition[2], branch, 0, condition[4]);  
            }
            else if (line.startsWith("New input:")) {  
                String[] names = null;                 

                names = line.substring(11).split(" ");

                execution.addAssignment(names[0] + " " + names[1]);
            }
            else if (line.startsWith("New assignment:")) {
                String string = null;

                string = line.substring(16);

                execution.addAssignment(string);
            }
            else if (line.startsWith("Branch ID:")) {
                String[] s = line.substring(11).split(" ");

                if (s[1].equals("true"))
                    SystemInformation.coverBranch(Integer.valueOf(s[0]).intValue(), true);
                else
                    SystemInformation.coverBranch(Integer.valueOf(s[0]).intValue(), false);

                
            }
            else if (line.startsWith("Instrumented branches:")) {
                String s = line.substring(23);

                SystemInformation.setMaxBranchCoverage(Integer.valueOf(s).intValue() * 2);

            }
            else if (line.startsWith("Add limit:")) {
                String[] limits = null;

                limits = line.substring(11).split(" ");

                execution.addLimits(limits[0], limits[1], limits[2]);
            }
            else if (line.startsWith("Unsatisfiable input constraint")) {
                //addUnsatCount???
                execution.setFinished("unsat");
                execution.computeNewInputs();
                
                out.println(execution.getPrimitiveInputs());
                out.println(execution.getReferenceInputs());
                out.println("Schedule: " + Schedules.formatSchedule(execution.getScheduling()));

                if (execution.getPrimitiveInputs().equals("All done."))
                    SystemInformation.setFinished();
            }
            else if (line.startsWith("Buffered path: ")) {
                String branch = line.substring(15);

                execution.updatePath(branch);
            }
            else if (line.startsWith("New reference condition:")) {
                String[] condition = line.substring(25).split(" ");

                boolean branch = false;

                if (condition[3].equals("true"))
                    branch = true;
                else
                    branch = false;

                execution.addPointerCondition(condition[0] + " " + condition[1] + " " + condition[2], branch, condition[4]);
            }
            else if (line.startsWith("Method call: ")) {
            	String signature = line.substring(13);
            	execution.addMethodCall(signature);
            }
           
//            else if (line.startsWith("depthTest:")) {
//                 String[] s = line.substring(1).split(" ");
//
//                 int i = Integer.valueOf(s[1]).intValue();
//
//                 SystemInformation.reportDepth(i);
//            }

            if (line.startsWith("Deadlock")) {
                System.out.println("Error found (deadlock)!");
                System.out.println("Input values used: " + inputString);
                System.out.println("Schedule: " + Schedules.formatSchedule(schedule));
                System.out.println("Seed value used: " + seed + "\n");

                execution.setFinished("error");
                SystemInformation.addErrorCount();

                break;

            }
            else if (line.startsWith("Object field:")) {
                String s[] = line.substring(14).split(" ");
                isInputObjectField = true;
                inputObject = s[0];
                inputField  = s[1];
            }
            else if (line.startsWith("Concrete input:")) {
                if (inputString.equals(""))
                    inputString = line.substring(16);
                else
                    inputString = inputString + " " + line.substring(16);

                if (isInputObjectField) {
                    JUnitInputs += "o" + inputObject + "." + inputField + "=" + line.substring(16) + " ";
                }
                else {
                    JUnitInputs += line.substring(16) + " ";
                }
                isInputObjectField = false;

                execution.inform(line);
            }
            else if (line.startsWith("Concrete object:")) {

                if (objectString.equals(""))
                    objectString = line.substring(17);
                else
                    objectString = objectString + " " + line.substring(17);

                if (isInputObjectField) {
                    JUnitInputs += "o" + inputObject + "." + inputField + "=o" + line.substring(17) + " ";
                }
                else {
                    JUnitInputs += "o" + objectCounter + "=o" + line.substring(17) + " ";
                }
                objectCounter++;
                isInputObjectField = false;

                execution.inform(line);
            }
            else if (line.startsWith("Scheduling:")) {

                String selectionString = line.substring(12);
                EventSelection selection = Schedules.parseEventSelection(selectionString);
                schedule.add(selection);

                execution.scheduled(selection);
            }
            else if (line.startsWith("New backtrack:")) {

                String backtrackString = line.substring(15);

                Set<EventIdentity> backtrack = new HashSet<EventIdentity>();

                int index = Schedules.parseBacktrack(backtrackString, backtrack);

                execution.addBacktrack(index, backtrack);
            }
            else if (line.startsWith("Changed sleepset:")) {

                String sleepSetString = line.substring(18);

                Set<EventIdentity> sleepSet = new HashSet<EventIdentity>();

                Schedules.parseEventList(sleepSetString, sleepSet);

                execution.updateSleepSet(sleepSet);
            }
            else if (line.startsWith("Solver time:")) {
                String time = line.substring(13);

                SystemInformation.increaseSolverTime(Long.valueOf(time));
            }
            else
                execution.inform(line);

        }

        try {
            out.close();
            in.close();
            client.close();
        }
        catch (IOException e) {
            System.out.println("Closing failed");
            System.exit(-1);
        }
      //  System.out.println("DEBUG: Closed");

        //System.out.println("Input string for JUnit generation:\n" + JUnitInputs);
        if (SystemInformation.testWriter != null && !isDropped) {
            try {
                SystemInformation.testWriter.write(JUnitInputs + "\n");
                SystemInformation.testWriter.flush();
            }
            catch (IOException e) {
                //TODO: error handling
            }
        }
    }

    
    private static void stripChangedMethods(ExecutionNodeHead root, Set<String> changed_method_signatures) {
    	
    	Stack<ExecutionNodeHead> dfs_stack = new Stack<ExecutionNodeHead>(); 
    	
    	if(root == null || changed_method_signatures == null) return;
    	
    	dfs_stack.push(root);
    	
    	do {
    		ExecutionNodeHead current_node = dfs_stack.pop();
    		
    		ExecutionNodeHead tmp_node = current_node;
    		
    		if(!current_node.getMethodSignature().equals("")) {
    			System.out.println("Checking method signature: " + current_node.getMethodSignature());
    		}

			if (changed_method_signatures.contains(current_node.getMethodSignature())) {
				System.out.println("Stripping tail.");

				current_node.getParent().setTail(null);
				
				/*
				while (tmp_node != null
						&& tmp_node.getParent() != null
						&& !(tmp_node.getParent().getTail() instanceof BranchingTail)) {
					tmp_node = tmp_node.getParent();
				}

				if (tmp_node != null) {
					tmp_node.setTail(null);
				}
				*/
				
				while (tmp_node != null) {
					tmp_node.setFinished(false);
					tmp_node = tmp_node.getParent();
				}

			}
			else {
				if(current_node.getTail() == null) {
					if(current_node.isFinished()) {
						if(current_node.getFinishReason().equals("error")) {
							SystemInformation.addErrorCount();
						}
						else if(current_node.getFinishReason().equals("All done.")) {
							SystemInformation.addTotalCount();
						}
						else if(current_node.getFinishReason().equals("depth")) {
							SystemInformation.addReachedDepthCount();
						}
						else if(current_node.getFinishReason().equals("prediction failed")) {
							SystemInformation.addIncorrectPathCount();
						}
						
					}
				}
				else {
					for(ExecutionNodeHead child_node : current_node.getTail().getChildren()) {
	    				dfs_stack.push(child_node);
	    			}
				}
			}
    		
    	}while(!dfs_stack.isEmpty());
   
    	
    	

    }


    private ExecutionStrategy chooseStrategy()
    {
        ExecutionStrategy e = null;

        if (SystemInformation.getStrategy().equals("DFS"))
            e = new DFS(executionTree);
        else if (SystemInformation.getStrategy().equals("random priority"))
            e = new RandomPriority(executionTree);
        else if (SystemInformation.getStrategy().equals("BFS"))
            e = new BFS(executionTree);
        else if (SystemInformation.getStrategy().equals("random")) {
            e = new Random(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("random selection")) {
            e = new RandomSelection(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("branch coverage")) {
            e = new BranchCoverageStrategy(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("dpor only")) {
            e = new DPOROnlyStrategy(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("schedules only")) {
            e = new SchedulesOnlyDFSStrategy(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("scheduled DFS")) {
            e = new ScheduledDFSStrategy(executionTree);
        }
        else if (SystemInformation.getStrategy().equals("scheduled exhaustive")) {
            e = new ExhaustiveSearchStrategy(executionTree);
        }
        else {
            System.err.println("ERROR: Unknown strategy (" + SystemInformation.getStrategy() + ").");
            System.exit(-1);
        }

        return e;
    }

}
