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

package fi.hut.ics.lime.tester.server.strategies.scheduling;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;

import fi.hut.ics.lime.tester.server.SystemInformation;
import fi.hut.ics.lime.tester.server.TreeManager;
import fi.hut.ics.lime.tester.server.strategies.ExecutionStrategy;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;

/**
 * A base implementation for scheduled search strategies.
 * 
 * @author osaariki
 */
public abstract class BasicScheduledSearchStrategy implements ExecutionStrategy
{
    protected ScheduledExecutionTree   tree;
    protected ExecutionNodeHead        currentNode;
    protected ExecutionNodeHead        targetNode;

    private boolean                    isFinished;
    private boolean                    hasTargetBeenReached;
    private boolean                    isIncremental;
    private boolean                    isSleepSetsEnabled;

    private String                     inputString;
    private String                     objectString;
    private String                     currentPath;
    private List<EventSelection>       transitionStack;

    protected String                   primitiveInputs;
    protected String                   referenceInputs;
    protected Iterable<EventSelection> schedule;
    protected Set<EventIdentity>       sleepSet;

    /**
     * @return the next node to expand.
     */
    abstract ExecutionNodeHead selectNextNode();

    /**
     * Perform strategy specific processing for new branches e.g. assigning random priorities.
     * 
     * @param node
     *            the new branch root.
     */
    abstract void handleNewOpenBranch(ExecutionNodeHead node);

    /**
     * Creates a new node with the specified parent.
     * 
     * @param parent
     *            the parent.
     * @return a new node.
     */
    abstract ExecutionNodeHead getNewNode(ExecutionNodeHead parent);
    
    /**
     * Creates a new instance of {@link BasicScheduledSearchStrategy} that will operate on the given tree.
     * 
     * @param o
     *            the search tree.
     */
    public BasicScheduledSearchStrategy(Object o)
    {
        tree = (ScheduledExecutionTree) o;
        isFinished = false;
        hasTargetBeenReached = false;
        currentNode = tree.getRoot();
        targetNode = null;
        isIncremental = true;
        isSleepSetsEnabled = SystemInformation.isSleepSetsEnabled();
        inputString = "";
        objectString = "";
        currentPath = "";
        primitiveInputs = "";
        referenceInputs = "";
        schedule = Collections.emptyList();
        sleepSet = new HashSet<EventIdentity>();
        transitionStack = new ArrayList<EventSelection>();
    }

    /*
     * Selects a new node to be expanded and constructs the path constraint (arithmetic constraints and reference
     * constraints) corresponding to the node as well as the schedule.
     */
    public void computeNewInputs()
    {
        targetNode = selectNextNode();

        if (targetNode == null) {
            primitiveInputs = "All done.";
            referenceInputs = "All done.";
            isFinished = true;

            return;
        }

        if (targetNode.getArithmeticConstraint().equals("empty") && targetNode.getReferenceConstraint().equals("empty")) {
            hasTargetBeenReached = true;
            primitiveInputs = "empty";
            referenceInputs = "empty";
        }

        if (SystemInformation.getVerbosity() > 4)
            System.out.println("[DEBUG] Path to follow: " + targetNode.getBranchString());

        String arithmeticConstraint = "";
        String referenceConstraint = "";

        String[] result;

        if (!isIncremental)
            result = getConstraintsNonIncrementally(targetNode);
        else
            result = getConstraintsIncrementally(targetNode);

        if (result == null) {
            computeNewInputs();
            return;
        }

        arithmeticConstraint = result[0];
        referenceConstraint = result[1];

        currentNode = targetNode;
        primitiveInputs = arithmeticConstraint;
        referenceInputs = referenceConstraint;
        schedule = reconstructSchedule(targetNode);
        if (isSleepSetsEnabled) {
            retrieveSleepSet(targetNode);
        } else {
            sleepSet.clear();
        }
    }

    /*
     * This method is used to mark the current test run/target node finished. If the reason for setting a target node
     * finished is that the path constraint of that node is unsatisfiable, it is checked if the initialization points of
     * objects need to be updated. See section 4.2 of Automated Test Generation for Software Components for futher
     * information.
     */
    public synchronized void setFinished(String reason)
    {
        isFinished = true;
        primitiveInputs = "All done.";
        referenceInputs = "All done.";
        
        if (reason.equals("unsat")) {
            SystemInformation.unsatCount++;
            
            if (targetNode.getReferenceConstraint() != null) {
                if (targetNode.getReferenceConstraint().startsWith("== O")
                        && !targetNode.getReferenceConstraint().endsWith(" 0")) { // not creating instance for null
                    String[] objects = targetNode.getReferenceConstraint().split(" ");

                    if (!objects[1].startsWith("O"))
                        objects[1] = "O" + objects[1];

                    if (!objects[2].startsWith("O"))
                        objects[2] = "O" + objects[2];

                    ExecutionNodeHead node = findObjectInitialization(objects[1], objects[2]);

                    if (node != null) {
                        String otherObject = "";

                        if (node.getReferenceConstraint().contains(objects[1]))
                            otherObject = objects[2];
                        else
                            otherObject = objects[1];

                        node = node.getParent();

                        String path = findPathString(node);

                        boolean alreadyAdded = false;

                        BranchingTail tail;
                        while ((tail = (BranchingTail) node.getTail()).getRight() != null) {
                            if (((BranchingTail) tail.getRight().getTail()).getLeft().getReferenceConstraint()
                                    .contains(otherObject)) {
                                alreadyAdded = true;
                                break;
                            } else
                                node = tail.getRight();
                        }

                        if (!alreadyAdded) {
                            tail = (BranchingTail) node.getTail();
                            tail.setRight(getNewNode(node));
                            node = tail.getRight();

                            node.addReferenceConstraint("");
                            node.addArithmeticConstraint("");
                            node.setExtraBranch(true);

                            BranchingTail newTail = new BranchingTail();
                            node.setTail(newTail);

                            newTail.setLeft(getNewNode(node));
                            newTail.getLeft().addReferenceConstraint("== " + objects[1] + " " + objects[2]);
                            newTail.getLeft().setBranchString(path);

                            handleNewOpenBranch(newTail.getLeft());
                        }
                    }
                    SystemInformation.unsatCount--;
                }
            }

            
            setNodeFinished(targetNode);

            // This test run is not finished unless there are no new
            // satisfiable nodes left in the tree
            isFinished = false;
        } else if (reason.equals("prediction failed")) {
            if (SystemInformation.getVerbosity() >= 2)
                System.out.println("WARNING: Failed to follow the predicted execution path.");
            SystemInformation.addIncorrectPathCount();
            setNodeFinished(currentNode);
        } else {
        	currentNode.setFinishReason(reason);
            setNodeFinished(currentNode);
        }
       
    }

    /*
     * This method is used to add a new branch to the symbolic execution tree after a branching statement has been
     * executed. This method is used for branching statements that use arithmetic operators.
     */
    public void addBranch(String condition, boolean branch, int id, String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached) {
            checkPathPrediction();
        } else {
            BranchingTail tail = new BranchingTail();
            currentNode.setTail(tail);
            tail.setRight(getNewNode(currentNode));
            tail.setLeft(getNewNode(currentNode));

            if (branch) {
                tail.getLeft().addArithmeticConstraint(makeNegation(condition));
                tail.getRight().addArithmeticConstraint(condition);

                int length = currentPath.length();

                tail.getLeft().setBranchString(currentPath.substring(0, length - 1) + "f");
                tail.getRight().setBranchString(currentPath);

                handleNewOpenBranch(tail.getLeft());

                currentNode = tail.getRight();
            } else {
                tail.getLeft().addArithmeticConstraint(makeNegation(condition));
                tail.getRight().addArithmeticConstraint(condition);

                int length = currentPath.length();

                tail.getRight().setBranchString(currentPath.substring(0, length - 1) + "t");
                tail.getLeft().setBranchString(currentPath);

                handleNewOpenBranch(tail.getRight());

                currentNode = tail.getLeft();
            }
        }
    }

    public void addLimits(String symbolicVariable, String min, String max)
    {
        if (hasTargetBeenReached) {
            currentNode.addArithmeticConstraint(">= " + symbolicVariable + " " + min);
            currentNode.addArithmeticConstraint("<= " + symbolicVariable + " " + max);
        }
    }

    public void addAssignment(String condition)
    {
        if (hasTargetBeenReached) {
            LinearTail tail = new LinearTail();
            currentNode.setTail(tail);
            tail.setChild(getNewNode(currentNode));
            currentNode = tail.getChild();
            currentNode.addArithmeticConstraint("== " + condition);
        }
    }

    public void addMethodCall(String signature) {
    	if (hasTargetBeenReached) {
            LinearTail tail = new LinearTail();
            currentNode.setTail(tail);
            tail.setChild(getNewNode(currentNode));
            currentNode = tail.getChild();
            currentNode.setMethodSignature(signature);
        }
    }
    
    public void updatePath(String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached)
            checkPathPrediction();
    }

    /*
     * This method is similar to addBranch but is targeted for branching statements that compare object references.
     */
    public void addPointerCondition(String condition, boolean branch, String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached) {
            checkPathPrediction();
        } else {
            BranchingTail tail = new BranchingTail();
            currentNode.setTail(tail);
            tail.setRight(getNewNode(currentNode));
            tail.setLeft(getNewNode(currentNode));
            
            if (branch) {
                tail.getLeft().addReferenceConstraint(makeNegation(condition));
                tail.getRight().addReferenceConstraint(condition);

                int length = currentPath.length();

                tail.getLeft().setBranchString(currentPath.substring(0, length - 1) + "f");

                tail.getRight().setBranchString(currentPath);

                handleNewOpenBranch(tail.getLeft());

                currentNode = tail.getRight();
            } else {
                tail.getLeft().addReferenceConstraint(makeNegation(condition));
                tail.getRight().addReferenceConstraint(condition);

                int length = currentPath.length();
                tail.getRight().setBranchString(currentPath.substring(0, length - 1) + "t");

                tail.getLeft().setBranchString(currentPath);

                handleNewOpenBranch(tail.getRight());

                currentNode = tail.getLeft();
            }
        }
    }

    /*
     * Inform method handles all other messages received from test executors that do not have their own handler methods.
     * Lazy initialization events are tracked to construct initialization points as explained in section 4.2 of
     * Automated Test Generation for Software Components.
     * 
     * The method also stored the concrete input values that have been used during the test run.
     */
    public void inform(String message)
    {
        if (message.startsWith("Lazy initialization:")) {
            String string = message.substring(21);

            if (hasTargetBeenReached) {
                BranchingTail tail1 = new BranchingTail();
                currentNode.setTail(tail1);
                tail1.setLeft(getNewNode(currentNode));
                currentNode = tail1.getLeft();

                LinearTail tail2 = new LinearTail();
                currentNode.setTail(tail2);

                currentNode.setLazyInitializationNode(true);
                currentNode.addReferenceConstraint(string);

                tail2.setChild(getNewNode(currentNode));
                currentNode = tail2.getChild();
            }
        } else if (isIncremental && message.startsWith("Concrete input:")) {
            if (inputString.equals(""))
                inputString = message.substring(16);
            else
                inputString = inputString + " " + message.substring(16);
            if (hasTargetBeenReached)
                currentNode.setPrimitiveInputs(inputString);
        } else if (isIncremental && message.startsWith("Concrete object:")) {
            if (objectString.equals(""))
                objectString = message.substring(17);
            else
                objectString = objectString + " " + message.substring(17);

            if (hasTargetBeenReached)
                currentNode.setReferenceInputs(objectString);
        }
    }

    public void scheduled(EventSelection selection)
    {
    	
    	//TODO fix EventId problem
    	
        currentPath = currentPath + selection.getSelectedEvent();

        transitionStack.add(selection);
        if (!hasTargetBeenReached) {
            checkPathPrediction();
        } else {
            ScheduleTail tail = new ScheduleTail(selection.getOptions(), sleepSet);
            currentNode.setTail(tail);
            ExecutionNodeHead nextNode = getNewNode(currentNode);
            nextNode.setBranchString(currentNode.getBranchString() + selection.getSelectedEvent());
            tail.addChild(selection.getSelectedEvent(), nextNode);
            handleNewOpenBranch(nextNode);
            currentNode = nextNode;
        }
    }

    public void addBacktrack(int transitionNum, Set<EventIdentity> backtrack)
    {
        int fromEnd = transitionStack.size() - transitionNum - 1;

        ExecutionNodeHead node = currentNode;
        do {
            node = node.getParent();
            if (node == null)
                throw new IllegalStateException("Tried to add backtrack with no scheduling decisions made.");
        } while ((!(node.getTail() instanceof ScheduleTail)));

        for (int i = 0; i < fromEnd; ++i) {
            do {
                node = node.getParent();
                if (node == null)
                    throw new IllegalArgumentException(
                            "Ran out of transitions when resolving backtrack position. Illegal value of transitionNum.");
            } while (!(node.getTail() instanceof ScheduleTail));
        }

        addBacktrack(node, backtrack);
    }

    public void addBacktrack(ExecutionNodeHead node, Set<EventIdentity> backtrack)
    {
        ScheduleTail tail = (ScheduleTail) node.getTail();
        final ExecutionNodeHead parent = node;
        Set<ExecutionNodeHead> newNodes = tail.addBacktracks(backtrack, new ExecutionNodeHeadFactory() {

            @Override
            public ExecutionNodeHead createExecutionNodeHead()
            {
                return getNewNode(parent);
            }
        });

        for (ExecutionNodeHead newNode : newNodes) {
            handleNewOpenBranch(newNode);
        }
    }
    
    public void updateSleepSet(Set<EventIdentity> updateSleepSet)
    {
        sleepSet.clear();
        sleepSet.addAll(updateSleepSet);
    }

    public boolean isFinished()
    {
        return isFinished;
    }

    public String getPrimitiveInputs()
    {
        return primitiveInputs;
    }

    public String getReferenceInputs()
    {
        return referenceInputs;
    }

    public Iterable<EventSelection> getScheduling()
    {
        return schedule;
    }

    public Iterable<EventIdentity> getSleepSet()
    {
        return sleepSet;
    }

    public boolean isPartialOrderReductionStrategy()
    {
        return true;
    }

    public boolean hasTargetBeenReached()
    {
        return hasTargetBeenReached;
    }

    /*
     * This method marks a node finished and deletes unnecessary nodes from the symbolic execution tree when possible.
     * It also makes sure that initialization points are marked finished correctly.
     */
    private synchronized void setNodeFinished(ExecutionNodeHead node)
    {
    	//TODO should we keep whole tree in memory until we write it to disk
    	 
    	LinkedList<ExecutionNodeHead> list = new LinkedList<ExecutionNodeHead>();
    	
    	list.addLast(node);
    	
    	do {
    		ExecutionNodeHead current_node = list.removeFirst();
    		
    		if (current_node.getParent() != null && current_node.getParent().isExtraBranch()) {
                current_node.setFinished(true);
                
                if(!SystemInformation.incremental) {
                	current_node.setTail(null);
                }

                boolean isMainFinished = false;
                boolean isExtraFinished = true;

                current_node = current_node.getParent();

                while (current_node.isExtraBranch())
                    current_node = current_node.getParent();

                ExecutionNodeHead temp = current_node;

                isMainFinished = ((BranchingTail) current_node.getTail()).getLeft().isFinished();

                current_node = ((BranchingTail) current_node.getTail()).getRight();

                while (current_node != null) {
                    if (!((BranchingTail) current_node.getTail()).getLeft().isFinished()) {
                        isExtraFinished = false;
                        break;
                    }
                    current_node = ((BranchingTail) current_node.getTail()).getRight();
                }

                if (isMainFinished && isExtraFinished) {
                    list.addLast(temp);
                }
            } else if (current_node.isLazyInitializationNode()) {
                current_node.setFinished(true);
                if(!SystemInformation.incremental) {
                	current_node.setTail(null);
                }

                boolean isExtraFinished = true;

                ExecutionNodeHead temp = current_node.getParent();

                current_node = ((BranchingTail) temp.getTail()).getRight();

                while (current_node != null) {
                    if (!((BranchingTail) current_node.getTail()).getLeft().isFinished()) {
                        isExtraFinished = false;
                        break;
                    }
                    current_node = ((BranchingTail) current_node.getTail()).getRight();
                }

                if (isExtraFinished) {
                    list.addLast(temp);
                }
            } else {
                current_node.setFinished(true);
                if(!SystemInformation.incremental) {
                	current_node.setTail(null);
                }

                current_node = current_node.getParent();
                if (current_node != null) {
                    boolean allFinished = true;
                    for (ExecutionNodeHead child : current_node.getTail().getChildren())
                        if (!child.isFinished()) {
                            allFinished = false;
                            break;
                        }
                    if (allFinished) {
                        list.addLast(current_node);
                    }
                }
            }
    		
    		
    	}while(!list.isEmpty());
    	    	
    	
    	// recursive version
    	/*
        if (node.getParent() != null && node.getParent().isExtraBranch()) {
            node.setFinished(true);
            
            if(!SystemInformation.incremental) {
            	node.setTail(null);
            }

            boolean isMainFinished = false;
            boolean isExtraFinished = true;

            node = node.getParent();

            while (node.isExtraBranch())
                node = node.getParent();

            ExecutionNodeHead temp = node;

            isMainFinished = ((BranchingTail) node.getTail()).getLeft().isFinished();

            node = ((BranchingTail) node.getTail()).getRight();

            while (node != null) {
                if (!((BranchingTail) node.getTail()).getLeft().isFinished()) {
                    isExtraFinished = false;
                    break;
                }
                node = ((BranchingTail) node.getTail()).getRight();
            }

            if (isMainFinished && isExtraFinished)
                setNodeFinished(temp);
        } else if (node.isLazyInitializationNode()) {
            node.setFinished(true);
            if(!SystemInformation.incremental) {
            	node.setTail(null);
            }

            boolean isExtraFinished = true;

            ExecutionNodeHead temp = node.getParent();

            node = ((BranchingTail) temp.getTail()).getRight();

            while (node != null) {
                if (!((BranchingTail) node.getTail()).getLeft().isFinished()) {
                    isExtraFinished = false;
                    break;
                }
                node = ((BranchingTail) node.getTail()).getRight();
            }

            if (isExtraFinished)
                setNodeFinished(temp);
        } else {
            node.setFinished(true);
            if(!SystemInformation.incremental) {
            	node.setTail(null);
            }

            node = node.getParent();
            if (node != null) {
                boolean allFinished = true;
                for (ExecutionNodeHead child : node.getTail().getChildren())
                    if (!child.isFinished()) {
                        allFinished = false;
                        break;
                    }
                if (allFinished)
                    setNodeFinished(node);
            }
        }
        */
    }

    private String makeNegation(String condition)
    {
        if (condition.startsWith("> "))
            condition = "<= " + condition.substring(2);

        else if (condition.startsWith("< "))
            condition = ">= " + condition.substring(2);

        else if (condition.startsWith("<= "))
            condition = "> " + condition.substring(3);

        else if (condition.startsWith(">= "))
            condition = "< " + condition.substring(3);

        else if (condition.startsWith("== "))
            condition = "!= " + condition.substring(3);

        else if (condition.startsWith("!= "))
            condition = "== " + condition.substring(3);

        return condition;
    }

    private ExecutionNodeHead findObjectInitialization(String object1, String object2) // fails if multiple
    // branches????? !!!!!
    {
        ExecutionNodeHead node = targetNode;

        while (node != null
                && !(node.isLazyInitializationNode() && node.getReferenceConstraint().contains(
                        "== " + object1 + " " + object1.substring(1)))
                && !(node.isLazyInitializationNode() && node.getReferenceConstraint().contains(
                        "== " + object2 + " " + object2.substring(1)))) {
            node = node.getParent();
        }

        return node;
    }

    private String findPathString(ExecutionNodeHead node)
    {
        while (node != null) {

            if (node.getBranchString() != null && node.getBranchString().length() > 0)
                return node.getBranchString();

            node = node.getParent();
        }
        return "";
    }

    private void checkPathPrediction()
    {
        if (targetNode.getBranchString().length() > currentPath.length()) {
            if (!targetNode.getBranchString().startsWith(currentPath)) {
            	System.out.println("Excepting path "+targetNode.getBranchString());
            	System.out.println("Current path "+currentPath);
                setFinished("prediction failed");
            }
        } else {
            if (currentPath.startsWith(targetNode.getBranchString())) {
                hasTargetBeenReached = true;

                // The current node might have inherited incorrect inputs, as unexplored children of branching nodes
                // inherit the inputs that caused the execution to follow the other path. The following ensures the
                // inputs are correct for this branch.
                currentNode.setPrimitiveInputs(inputString);
                currentNode.setReferenceInputs(objectString);
            } else
                setFinished("prediction failed");
        }
    }

    private String[] getConstraintsNonIncrementally(ExecutionNodeHead node)
    {
        boolean done = false;
        String arithmeticConstraint = "";
        String referenceConstraint = "";

        while (!done) {
            if (node == null)
                done = true;
            else {
                if (arithmeticConstraint.equals("")) {
                    if (!node.getArithmeticConstraint().equals(""))
                        arithmeticConstraint = "Solve: " + node.getArithmeticConstraint();
                } else {
                    if (!node.getArithmeticConstraint().equals("empty") && !node.getArithmeticConstraint().equals(""))
                        arithmeticConstraint = arithmeticConstraint + "D" + node.getArithmeticConstraint();
                }

                if (referenceConstraint.equals("")) {
                    if (!node.getReferenceConstraint().equals(""))
                        referenceConstraint = "Solve: " + node.getReferenceConstraint();
                } else {
                    if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals(""))
                        referenceConstraint = referenceConstraint + "D" + node.getReferenceConstraint();
                }

                node = node.getParent();
            }
        }

        String[] result = { arithmeticConstraint, referenceConstraint };

        return result;
    }

    private String[] getConstraintsIncrementally(ExecutionNodeHead node)
    {
        String arithmeticConstraint = "";
        String referenceConstraint = "";
        boolean isUnsatisfiable = false;

        if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals("")) {
            arithmeticConstraint = "Solved: " + node.getPrimitiveInputs();

            boolean done = false;

            while (!done) {
                if (node == null) {
                    done = true;
                } else {
                    if (referenceConstraint.equals("")) {
                        if (!node.getReferenceConstraint().equals(""))
                            referenceConstraint = "Solve: " + node.getReferenceConstraint();
                    } else {
                        if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals(""))
                            referenceConstraint = referenceConstraint + "D" + node.getReferenceConstraint();
                    }

                    node = node.getParent();
                }
            }
        } else if (!node.getArithmeticConstraint().equals("empty") && !node.getArithmeticConstraint().equals("")) {
            referenceConstraint = "Solved: " + node.getReferenceInputs();

            String latest = node.getArithmeticConstraint();
            String v[] = latest.split(" ");
            boolean done = false;

            while (!done) {
                if (node == null) {
                    done = true;
                } else {
                    if (fastUnsatCheck(node, v)) {
                        SystemInformation.fastUnsatCount++;
                        setFinished("unsat");
                        isUnsatisfiable = true;
                        break;
                    }

                    if (arithmeticConstraint.equals("")) {
                        if (!node.getArithmeticConstraint().equals("")) {
                            arithmeticConstraint = "Solve: " + node.getArithmeticConstraint();
                        }
                    } else {
                        if (!node.getArithmeticConstraint().equals("empty")
                                && !node.getArithmeticConstraint().equals("")) {
                            arithmeticConstraint = arithmeticConstraint + "D" + node.getArithmeticConstraint();
                        }
                    }

                    node = node.getParent();
                }
            }
        } else {
            arithmeticConstraint = "Solved: " + node.getPrimitiveInputs();
            referenceConstraint = "Solved: " + node.getReferenceInputs();
        }

        String[] result = { arithmeticConstraint, referenceConstraint };

        if (isUnsatisfiable)
            result = null;

        return result;
    }

    private boolean fastUnsatCheck(ExecutionNodeHead node, String[] v)
    {
        boolean result = false;

        if (v.length == 3 && node.getArithmeticConstraint().contains(v[1])
                && node.getArithmeticConstraint().contains(v[2])) {
            String v2[] = node.getArithmeticConstraint().split(" ");

            if (v[0].equals("<") && (v2[0].equals(">") || v2[0].equals(">=")) && v[1].equals(v2[1])
                    && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("<=") && v2[0].equals(">") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals(">") && (v2[0].equals("<") || v2[0].equals("<=")) && v[1].equals(v2[1])
                    && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("==") && (v2[0].equals(">") || v2[0].equals("<") || v2[0].equals("!="))
                    && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("!=") && v2[0].equals("==") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals(">=") && v2[0].equals("<") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
        }

        return result;
    }

    private Iterable<EventSelection> reconstructSchedule(ExecutionNodeHead node)
    {
        LinkedList<EventSelection> schedule = new LinkedList<EventSelection>();

        while (node.getParent() != null) {
            ExecutionNodeHead last = node;
            node = node.getParent();

            if (node.getTail() instanceof ScheduleTail) {
                ScheduleTail tail = (ScheduleTail) node.getTail();

                EventIdentity selection = null;
                for (Entry<EventIdentity, ExecutionNodeHead> entry : tail.getChildEntries()) {
                    if (entry.getValue() == last)
                        selection = entry.getKey();
                }
                if (selection == null)
                    throw new RuntimeException("Node not child of parent?");

                schedule.addFirst(new EventSelection(selection, tail.getEnabled()));
            }
        }
        return schedule;
    }

    private void retrieveSleepSet(ExecutionNodeHead node)
    {
        sleepSet.clear();

        while (node.getParent() != null) {
            ExecutionNodeHead last = node;
            node = node.getParent();

            if (node.getTail() instanceof ScheduleTail) {
                ScheduleTail tail = (ScheduleTail) node.getTail();

                EventIdentity selection = null;
                for (Entry<EventIdentity, ExecutionNodeHead> entry : tail.getChildEntries()) {
                    if (entry.getValue() == last)
                        selection = entry.getKey();
                }
                if (selection == null)
                    throw new RuntimeException("Node not child of parent?");

                sleepSet.addAll(tail.getSleepSet(selection));
                break;
            }
        }
    }
}
