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

package fi.hut.ics.lime.tester.server.strategies;

import java.util.Collections;
import java.util.Set;

import fi.hut.ics.lime.tester.server.SystemInformation;
import fi.hut.ics.lime.tester.threading.EventIdentity;
import fi.hut.ics.lime.tester.threading.EventSelection;

public abstract class BasicSearchStrategy implements ExecutionStrategy {
    protected SymbolicExecutionTree tree;
    protected SymbolicExecutionNode currentNode;
    protected SymbolicExecutionNode targetNode;

    private boolean isFinished;
    private boolean hasTargetBeenReached;
    private boolean isIncremental;

    private String inputString;
    private String objectString;
    private String currentPath;

    protected String primitiveInputs;
    protected String referenceInputs;
    protected Iterable<EventSelection> schedule;


    abstract SymbolicExecutionNode selectNextNode();
    abstract void handleNewOpenBranch (SymbolicExecutionNode node);
    abstract SymbolicExecutionNode getNewNode (SymbolicExecutionNode node);
    

    public BasicSearchStrategy (Object o)
    {
        tree                    = (SymbolicExecutionTree)o;
        isFinished              = false;
        hasTargetBeenReached    = false;
        currentNode             = tree.getRoot();
        targetNode              = null;
        isIncremental           = true;
        inputString             = "";
        objectString            = "";
        currentPath             = "";
        primitiveInputs         = "";
        referenceInputs         = "";
        schedule                = Collections.emptyList();
    }

    

    /**
     * Selects a new node to be expanded and constructs the path constraint
     * (arithmetic constraints and reference constraints) corresponding to
     * the node. The arithmetic constraint part is saved to primitiveInputs
     * field of this object and reference constraint part is saved to
     * referenceInputs field.
     */
    public void computeNewInputs()
    {
        targetNode = selectNextNode();

        if (targetNode == null) {
            primitiveInputs = "All done.";
            referenceInputs = "All done.";
            isFinished      = true;
            
            return; //todo: bad style. fix.
        }

        if (targetNode.getArithmeticConstraint().equals("empty") && targetNode.getReferenceConstraint().equals("empty")) {
            hasTargetBeenReached    = true;
            primitiveInputs         = "empty";
            referenceInputs         = "empty";
        }

        SymbolicExecutionNode node = targetNode;

        if (SystemInformation.getVerbosity() > 4)
            System.out.println("[DEBUG] Path to follow: " + targetNode.getBranchString());

        String arithmeticConstraint = "";
        String referenceConstraint  = "";

        String[] result;

        if (!isIncremental) 
            result = getConstraintsNonIncrementally(node);
        else 
            result = getConstraintsIncrementally(node);

        if (result == null) {
            computeNewInputs();
            return; //todo: bad style. fix.
        }

        arithmeticConstraint = result[0];
        referenceConstraint  = result[1];

        currentNode     = targetNode;
        primitiveInputs = arithmeticConstraint;
        referenceInputs = referenceConstraint;
        schedule        = Collections.emptyList();
    }



    /**
     * This method is used to mark the current test run/target node finished. If 
     * the reason for setting a target node finished is that the path constraint
     * of that node is unsatisfiable, it is checked if the initialization points
     * of objects need to be updated. See section 4.2 of Automated Test 
     * Generation for Software Components for futher information.
     * 
     * @param reason  indicates why the execution path is marked to have been
     *                explored
     */
    public synchronized void setFinished (String reason)
    {
        isFinished      = true;
        primitiveInputs = "All done."; // TODO: Isn't this quite ugly? Fix to not encoding unrelated information in
                                       // the primitive/reference inputs.
        referenceInputs = "All done.";

        if (reason.equals("unsat")) {
            SystemInformation.unsatCount++;

            if (targetNode.getReferenceConstraint() != null) {
                if (targetNode.getReferenceConstraint().startsWith("== O") && !targetNode.getReferenceConstraint().endsWith(" 0")) { // not creating instance for null
                    String[] objects  = targetNode.getReferenceConstraint().split(" ");

                    if (!objects[1].startsWith("O"))  
                        objects[1] = "O" + objects[1];

                    if (!objects[2].startsWith("O"))
                        objects[2] = "O" + objects[2];

                    SymbolicExecutionNode node = findObjectInitialization(objects[1], objects[2]);

                    if (node != null) {
                        String otherObject = "";

                        if (node.getReferenceConstraint().contains(objects[1])) 
                            otherObject = objects[2];
                        else
                            otherObject = objects[1];

                        node = node.getParent();

                        String path = findPathString(node);

                        boolean alreadyAdded = false;

                        while (node.getRight() != null && !alreadyAdded) {
                            if (node.getRight().getLeft().getReferenceConstraint().contains(otherObject))
                                alreadyAdded = true;
                            else
                                node = node.getRight();
                        }

                        if (!alreadyAdded) {
                            node.setRight(getNewNode(node));
                            node = node.getRight();

                            node.addReferenceConstraint("");
                            node.addArithmeticConstraint("");
                            node.setExtraBranch(true);

                            node.setLeft(getNewNode(node));
                            node.getLeft().addReferenceConstraint("== " + objects[1] + " " + objects[2]);
                            node.getLeft().setBranchString(path);

                            handleNewOpenBranch(node.getLeft());
                        }
                    }
                    SystemInformation.unsatCount--;
                }
            }

            setNodeFinished(targetNode);

            // This test run is not finished unless there are no new
            // satisfiable nodes left in the tree
            isFinished = false;
        }
        else if (reason.equals("prediction failed")) {
            if (SystemInformation.getVerbosity() >= 2)
                System.out.println("WARNING: Failed to follow the predicted execution path.");
            SystemInformation.addIncorrectPathCount();
            setNodeFinished(currentNode);
        }
        else 
            setNodeFinished(currentNode);
        
    }



    /**
     * This method is used to add a new branch to the symbolic execution tree
     * after a branching statement has been executed. This method is used
     * for branching statements that use arithmetic operators.
     * 
     * @param condition
     * @param branch
     * @param id
     * @param path
     */
    public void addBranch(String condition, boolean branch, int id, String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached)
           checkPathPrediction();
        else {
            currentNode.setRight(getNewNode(currentNode));
            currentNode.setLeft(getNewNode(currentNode));

            if (branch) {
                currentNode.getLeft().addArithmeticConstraint(makeNegation(condition));
                currentNode.getRight().addArithmeticConstraint(condition);

                int length = currentPath.length();

                currentNode.getLeft().setBranchString(currentPath.substring(0,length-1) + "f");
                currentNode.getRight().setBranchString(currentPath);

                handleNewOpenBranch(currentNode.getLeft());

                currentNode = currentNode.getRight();
            }
            else {
                currentNode.getLeft().addArithmeticConstraint(makeNegation(condition));
                currentNode.getRight().addArithmeticConstraint(condition);

                int length = currentPath.length();

                currentNode.getRight().setBranchString(currentPath.substring(0,length-1) + "t");

                currentNode.getLeft().setBranchString(currentPath);

                handleNewOpenBranch(currentNode.getRight());

                currentNode = currentNode.getLeft();
            }
        }
    }



    public void addLimits (String symbolicVariable, String min, String max)
    {
        if (hasTargetBeenReached) {
            currentNode.addArithmeticConstraint(">= " + symbolicVariable + " " + min);
            currentNode.addArithmeticConstraint("<= " + symbolicVariable + " " + max);
        }
    }



    public void addAssignment (String condition)
    {
        if (hasTargetBeenReached) {
            currentNode.setRight(getNewNode(currentNode));
            currentNode = currentNode.getRight();
            currentNode.addArithmeticConstraint("== " + condition);
        }
    }
    
    
    public void updatePath(String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached)
            checkPathPrediction();
    }

    /**
     * This method is similar to addBranch but is targeted for branching
     * statements that compare object references.
     *
     * @param condition
     * @param branch
     * @param path
     */
    public void addPointerCondition(String condition, boolean branch, String path)
    {
        currentPath = currentPath + path;

        if (!hasTargetBeenReached)
            checkPathPrediction();
        else {
            currentNode.setRight(getNewNode(currentNode));
            currentNode.setLeft(getNewNode(currentNode));

            if (branch) {
                currentNode.getLeft().addReferenceConstraint(makeNegation(condition));
                currentNode.getRight().addReferenceConstraint(condition);

                int length = currentPath.length();

                currentNode.getLeft().setBranchString(currentPath.substring(0,length-1) + "f");

                currentNode.getRight().setBranchString(currentPath);

                handleNewOpenBranch(currentNode.getLeft());

                currentNode = currentNode.getRight();
            }
            else {
                currentNode.getLeft().addReferenceConstraint(makeNegation(condition));
                currentNode.getRight().addReferenceConstraint(condition);

                int length = currentPath.length();
                currentNode.getRight().setBranchString(currentPath.substring(0,length-1) + "t");

                currentNode.getLeft().setBranchString(currentPath);


                handleNewOpenBranch(currentNode.getRight());

                currentNode = currentNode.getLeft();
            }
        }
    }



    /**
     * Inform method handles all other messages received from test executors
     * that do not have their own handler methods. Lazy initialization events
     * are tracked to construct initialization points as explained in section
     * 4.2 of Automated Test Generation for Software Components.
     *
     * The method also stored the concrete input values that have been used
     * during the test run.
     *
     * @param message
     */
    public void inform(String message)
    {
        if (message.startsWith("Lazy initialization:")) {
            String string = message.substring(21);

            if (hasTargetBeenReached) {
                currentNode.setLeft(getNewNode(currentNode));

                currentNode = currentNode.getLeft();
                currentNode.setLazyInitializationNode(true);

                currentNode.addReferenceConstraint(string);

                currentNode.setLeft(getNewNode(currentNode));
                currentNode = currentNode.getLeft();
           }
        }
        else if (isIncremental && message.startsWith("Concrete input:")) {
                if (inputString.equals(""))
                    inputString = message.substring(16);
                else
                    inputString = inputString + " " + message.substring(16);
                if (hasTargetBeenReached)
                    currentNode.setPrimitiveInputs(inputString);
        }
        else if (isIncremental && message.startsWith("Concrete object:")) {
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
        
    }

    public void addBacktrack(int transitionNum, Set<EventIdentity> backtrack)
    {

    }

    public void updateSleepSet(Set<EventIdentity> sleepSet)
    {

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
        return Collections.emptySet();
    }

    public boolean isPartialOrderReductionStrategy()
    {
        return false;
    }

    /**
     * This method marks a node finished and deletes unnecessary nodes from
     * the symbolic execution tree when possible. It also makes sure that
     * initialization points are marked finished correctly.
     * 
     * TODO: messy code.
     * 
     * @param node
     */
    private synchronized void setNodeFinished (SymbolicExecutionNode node)
    {
        if (node.getParent() != null && node.getParent().isExtraBranch()) {
            node.setFinished(true);
            node.setLeft(null);
            node.setRight(null);

            boolean isMainFinished  = false;
            boolean isExtraFinished = true;

            node = node.getParent();

            while (node.isExtraBranch())
                node = node.getParent();

            SymbolicExecutionNode temp = node;

            isMainFinished = node.getLeft().isFinished();

            node = node.getRight();

            while (node != null) {
                if (!node.getLeft().isFinished()) {
                    isExtraFinished = false;
                    break;
                }
                node = node.getRight();
            }

            if (isMainFinished && isExtraFinished) 
                setNodeFinished(temp);
        }
        else if (node.isLazyInitializationNode()) {
            node.setFinished(true);
            node.setLeft(null);
            node.setRight(null);

            boolean isExtraFinished = true;

            SymbolicExecutionNode temp = node.getParent();

            node = node.getParent().getRight();

            while (node != null) {
                if (!node.getLeft().isFinished()) {
                    isExtraFinished = false;
                    break;
                }
                node = node.getRight();
            }

            if (isExtraFinished) 
                setNodeFinished(temp);
        }
        else {
            node.setFinished(true);
            node.setLeft(null);
            node.setRight(null);

            if (node.getParent() != null) {
                if ((node.getParent().getLeft() == null || node.getParent().getLeft().isFinished()) &&
                    (node.getParent().getRight() == null || node.getParent().getRight().isFinished()))
                    setNodeFinished(node.getParent());
            }
        }
    }


    
    private String makeNegation (String condition)
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



    private SymbolicExecutionNode findObjectInitialization (String object1, String object2) // fails if multiple branches????? !!!!!
    {
        SymbolicExecutionNode node = targetNode;

        while (node != null && !(node.isLazyInitializationNode() && node.getReferenceConstraint().contains("== " + object1 + " " + object1.substring(1)))
                            && !(node.isLazyInitializationNode() && node.getReferenceConstraint().contains("== " + object2 + " " + object2.substring(1)))) {
            node = node.getParent();
        }

        return node;
    }


    private String findPathString (SymbolicExecutionNode node)
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
            if (!targetNode.getBranchString().startsWith(currentPath))
                setFinished("prediction failed");
        }
        else {
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



    private String[] getConstraintsNonIncrementally (SymbolicExecutionNode node)
    {
        boolean done                = false;
        String arithmeticConstraint = "";
        String referenceConstraint  = "";

         while (!done) {
            if (node == null)
                done = true;
            else {
                if (arithmeticConstraint.equals("")) {
                    if (!node.getArithmeticConstraint().equals(""))
                        arithmeticConstraint = "Solve: " + node.getArithmeticConstraint();
                }
                else {
                    if (!node.getArithmeticConstraint().equals("empty") && !node.getArithmeticConstraint().equals(""))
                        arithmeticConstraint = arithmeticConstraint + "D" + node.getArithmeticConstraint();
                }

                if (referenceConstraint.equals("")) {
                    if (!node.getReferenceConstraint().equals(""))
                        referenceConstraint = "Solve: " + node.getReferenceConstraint();
                }
                else {
                    if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals(""))
                        referenceConstraint = referenceConstraint + "D" + node.getReferenceConstraint();
                }

                node = node.getParent();
            }
        }

        String[] result = {arithmeticConstraint, referenceConstraint};

        return result;
    }


    private String[] getConstraintsIncrementally (SymbolicExecutionNode node)
    {
        String arithmeticConstraint = "";
        String referenceConstraint  = "";
        boolean isUnsatisfiable     = false;

        if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals("")) { 
            SymbolicExecutionNode search = node;

            if (search == null)
                arithmeticConstraint = "Solved:";
            else 
                arithmeticConstraint = "Solved: " + search.getPrimitiveInputs();
            
            boolean done = false;

            while (!done) {
                if (node == null) {
                    done = true;
                }
                else {
                    if (referenceConstraint.equals("")) {
                        if (!node.getReferenceConstraint().equals("")) 
                            referenceConstraint = "Solve: " + node.getReferenceConstraint();                 
                    }
                    else {
                        if (!node.getReferenceConstraint().equals("empty") && !node.getReferenceConstraint().equals("")) 
                            referenceConstraint = referenceConstraint + "D" + node.getReferenceConstraint();                        
                    }

                    node = node.getParent();
                }
            }
        }
        else {
            SymbolicExecutionNode search = node;

            if (search == null) 
                referenceConstraint = "Solved:";
            else 
                referenceConstraint = "Solved: " + search.getReferenceInputs();

            String latest   = node.getArithmeticConstraint();
            String v[]      = latest.split(" ");
            boolean done    = false;

            while (!done) {
                if (node == null) {
                    done = true;
                }
                else {
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
                        if (!node.getArithmeticConstraint().equals("empty") && !node.getArithmeticConstraint().equals("")) {
                            arithmeticConstraint = arithmeticConstraint + "D" + node.getArithmeticConstraint();
                        }
                    }

                    node = node.getParent();
                }
            }
        }

        String[] result = {arithmeticConstraint, referenceConstraint};

        if (isUnsatisfiable)
            result = null;

        return result;
    }


    
    private boolean fastUnsatCheck(SymbolicExecutionNode node, String[] v)
    {
        boolean result = false;

        if (v.length == 3 && node.getArithmeticConstraint().contains(v[1]) &&
                             node.getArithmeticConstraint().contains(v[2])) {
            String v2[] = node.getArithmeticConstraint().split(" ");

            if (v[0].equals("<") && (v2[0].equals(">") || v2[0].equals(">=")) && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("<=") && v2[0].equals(">") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals(">") && (v2[0].equals("<") || v2[0].equals("<=")) && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("==") && (v2[0].equals(">") || v2[0].equals("<") || v2[0].equals("!=")) && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals("!=") && v2[0].equals("==") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
            else if (v[0].equals(">=") && v2[0].equals("<") && v[1].equals(v2[1]) && v[2].equals(v2[2]))
                result = true;
        }

        return result;
    }
    
    public void addMethodCall(String signature) {
    	//TODO fix
    }
}
