package fi.hut.ics.lime.tester.server;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;

import fi.hut.ics.lime.tester.server.strategies.scheduling.BranchingTail;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ExecutionNodeHead;
import fi.hut.ics.lime.tester.server.strategies.scheduling.LinearTail;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ScheduleTail;
import fi.hut.ics.lime.tester.server.strategies.scheduling.ScheduledExecutionTree;
import fi.hut.ics.lime.tester.server.strategies.scheduling.SimpleScheduledTree;
import fi.hut.ics.lime.tester.threading.EventIdentity;

public class TreeManager {
	
	private static final String VERSION = "version";
	private static final String VERSIONNUMBER = "v0.1";

	private static final String TREETYPE = "treet";
	private static final String SIMPLESCHEDULEDTREE = "ss";

	private static final String BRANCHSTRING = "%d bstr";
	private static final String PRIMITIVEINPUTS = "%d pin";
	private static final String REFERENCEINPUTS = "%d rin";
	private static final String ARITHMETICCONSTRAINT = "%d acns";
	private static final String REFERENCECONSTRAINT = "%d rcns";
	private static final String EXTRABRANCH = "%d ebr";
	private static final String FINISHED = "%d fin";
	private static final String FINISHREASON = "%d finr";
	private static final String LAZYINITIALIZATION = "%d lin";
	private static final String METHODCALL = "%d mc";

	private static final String TAILTYPE = "%d tailt";
	private static final String LINEARTAIL = "linear";
	private static final String CHILD = "%d chld";
	private static final String BRANCHINGTAIL = "branch";
	private static final String LEFTCHILD = "%d lft";
	private static final String RIGHTCHILD = "%d rght";
	private static final String SCHEDULETAIL = "schedule";
	private static final String SCHEDULECHILDREN = "%d chldrn";
	private static final String SCHEDULESLEEPSETS = "%d slps";
	private static final String SCHEDULENEXTSLEEPSET = "%d nslps";
	private static final String SCHEDULEENABLED = "%d enbld";

	private static final String ERROR_WRITE = "ERROR: Writing the execution tree to %s failed.";
	private static final String ERROR_READ = "ERROR: Reading the execution tree from %s failed.";
	private static final String ERROR_VERSION = "ERROR: Execution tree version mismatch; tree: %s current: %s";

	private static Properties p;
	
	public static void writeTree(ScheduledExecutionTree tree, String filename) {
		// IMPORTANT NOTE: should probably add some kind of lock here so the
		// tree isn't changed during the writing process

		// initialize the properties object
		p = new Properties();
		// a version string for sanity
		p.setProperty(VERSION, VERSIONNUMBER);
		
		// a treetype field for supporting different execution trees, the
		// SIMPLESCHEDULEDTREE is the only one supported currently
		p.setProperty(TREETYPE, SIMPLESCHEDULEDTREE);
		
		// parse the tree, writing individual node data to the properties file
		writeTree(tree.getRoot(), 0);

		// save the whole thing into a file
		try {
			p.store(new FileOutputStream(filename), null);
		} catch (Exception e) {
			System.err.println(String.format(ERROR_WRITE, filename));
			System.err.println(e);
			System.exit(-1);
		}
	}

	private static int writeTree(ExecutionNodeHead node, int n) {
		/*
		int i = n;
		LinkedList<ExecutionNodeHead> nodes = new LinkedList<ExecutionNodeHead>();
			
		nodes.addLast(node);
				
		do {
			ExecutionNodeHead current_node = nodes.removeFirst();
			
			// write general node data
			
			writeData(current_node, i);
			
			// NOTE: no need to store parent data as the tree is always traversed
			// top-down
			
			// determine the type of tail
			if (current_node.getTail() instanceof LinearTail) {
				// lineartail only has one child
				LinearTail tail = (LinearTail)current_node.getTail();
				p.setProperty(String.format(TAILTYPE, i), LINEARTAIL);
				if (tail.getChild() != null) {
					p.setProperty(String.format(CHILD, i), Integer.toString(i+nodes.size()+1));
					nodes.addLast(tail.getChild());
				}
			}
			
			else if (current_node.getTail() instanceof BranchingTail) {
				// branchingtail has two children
				BranchingTail tail = (BranchingTail)current_node.getTail();
				p.setProperty(String.format(TAILTYPE, i), BRANCHINGTAIL);
				if (tail.getLeft() != null) {
					p.setProperty(String.format(LEFTCHILD, i), Integer.toString(i+nodes.size()+1));
					nodes.addLast(tail.getLeft());
				}
				if (tail.getRight() != null) {
					p.setProperty(String.format(RIGHTCHILD, i), Integer.toString(i+nodes.size()+1));
					nodes.addLast(tail.getRight());
				}
			}
			
			else if (current_node.getTail() instanceof ScheduleTail) {
				// scheduledtail is more complicated, it can have multiple children
				ScheduleTail tail = (ScheduleTail)current_node.getTail();
				p.setProperty(String.format(TAILTYPE, i), SCHEDULETAIL);

				// find and process all the children first
				StringBuilder tmp = new StringBuilder();
		
				for (Entry<EventIdentity, ExecutionNodeHead> entry : tail.getChildEntries()) {
					if (tmp.length() != 0) {
						tmp.append(';');
					}
					tmp.append(entry.getKey().toString());
					tmp.append(':');
					tmp.append(i+nodes.size()+1);
					nodes.addLast(entry.getValue());
				}
				// write the generated string
				p.setProperty(String.format(SCHEDULECHILDREN, i), tmp.toString());

				// process enabled
				tmp = new StringBuilder();
				for (EventIdentity eventid : tail.getEnabled()) {
					if (tmp.length() != 0) {
						tmp.append(';');
					}
					tmp.append(eventid.toString());
				}
				// write the generated string
				p.setProperty(String.format(SCHEDULEENABLED, i), tmp.toString());

				// then the nextsleepset (which will be the new basesleepset)
				tmp = new StringBuilder();
				for (EventIdentity eventid : tail.directGetNextSleepSet()) {
					if (tmp.length() != 0) {
						tmp.append(';');
					}
					tmp.append(eventid.toString());
				}
				// write the generated string
				p.setProperty(String.format(SCHEDULENEXTSLEEPSET, i), tmp.toString());

				// finally the sleepsets
				tmp = new StringBuilder();
				for (Entry<EventIdentity, Set<EventIdentity>> entry : tail.directGetSleepSets()) {
					if (tmp.length() != 0) {
						tmp.append(';');
					}
					tmp.append(entry.getKey().toString());
					tmp.append(':');
					for (EventIdentity eventid : entry.getValue()) {
						tmp.append(eventid.toString());
						tmp.append(' ');
					}
					// remove the trailing space
					if (tmp.charAt(tmp.length()-1) == ' ') {
						tmp.deleteCharAt(tmp.length()-1);
					}
				}
				// write the generated string
				p.setProperty(String.format(SCHEDULESLEEPSETS, i), tmp.toString());

			}
			
			i++;
		}while(!nodes.isEmpty());
		
		*/
		// recursive version
		
		int i = n;

		// write general node data
		writeData(node, n);

		// NOTE: no need to store parent data as the tree is always traversed
		// top-down
		
		// determine the type of tail
		if (node.getTail() instanceof LinearTail) {
			// lineartail only has one child
			LinearTail tail = (LinearTail)node.getTail();
			p.setProperty(String.format(TAILTYPE, n), LINEARTAIL);
			if (tail.getChild() != null) {
				p.setProperty(String.format(CHILD, n), Integer.toString(i+1));
				i = writeTree(tail.getChild(), i+1);
			}
		}

		else if (node.getTail() instanceof BranchingTail) {
			// branchingtail has two children
			BranchingTail tail = (BranchingTail)node.getTail();
			p.setProperty(String.format(TAILTYPE, n), BRANCHINGTAIL);
			if (tail.getLeft() != null) {
				p.setProperty(String.format(LEFTCHILD, n), Integer.toString(i+1));
				i = writeTree(tail.getLeft(), i+1);
			}
			if (tail.getRight() != null) {
				p.setProperty(String.format(RIGHTCHILD, n), Integer.toString(i+1));
				i = writeTree(tail.getRight(), i+1);
			}
		}

		else if (node.getTail() instanceof ScheduleTail) {
			// scheduledtail is more complicated, it can have multiple children
			ScheduleTail tail = (ScheduleTail)node.getTail();
			p.setProperty(String.format(TAILTYPE, n), SCHEDULETAIL);

			// find and process all the children first
			StringBuilder tmp = new StringBuilder();
			for (Entry<EventIdentity, ExecutionNodeHead> entry : tail.getChildEntries()) {
				if (tmp.length() != 0) {
					tmp.append(';');
				}
				tmp.append(entry.getKey().toString());
				tmp.append(':');
				tmp.append(i+1);
				i = writeTree(entry.getValue(), i+1);
			}
			// write the generated string
			p.setProperty(String.format(SCHEDULECHILDREN, n), tmp.toString());

			// process enabled
			tmp = new StringBuilder();
			for (EventIdentity eventid : tail.getEnabled()) {
				if (tmp.length() != 0) {
					tmp.append(';');
				}
				tmp.append(eventid.toString());
			}
			// write the generated string
			p.setProperty(String.format(SCHEDULEENABLED, n), tmp.toString());

			// then the nextsleepset (which will be the new basesleepset)
			tmp = new StringBuilder();
			for (EventIdentity eventid : tail.directGetNextSleepSet()) {
				if (tmp.length() != 0) {
					tmp.append(';');
				}
				tmp.append(eventid.toString());
			}
			// write the generated string
			p.setProperty(String.format(SCHEDULENEXTSLEEPSET, n), tmp.toString());

			// finally the sleepsets
			tmp = new StringBuilder();
			for (Entry<EventIdentity, Set<EventIdentity>> entry : tail.directGetSleepSets()) {
				if (tmp.length() != 0) {
					tmp.append(';');
				}
				tmp.append(entry.getKey().toString());
				tmp.append(':');
				for (EventIdentity eventid : entry.getValue()) {
					tmp.append(eventid.toString());
					tmp.append(' ');
				}
				// remove the trailing space
				if (tmp.charAt(tmp.length()-1) == ' ') {
					tmp.deleteCharAt(tmp.length()-1);
				}
			}
			// write the generated string
			p.setProperty(String.format(SCHEDULESLEEPSETS, n), tmp.toString());

		}

		// if none of the above mathched, there is not tail and we don't need
		// to store any information about it

		return i;
		
	}

	private static void writeData(ExecutionNodeHead node, int n) {
		p.setProperty(String.format(BRANCHSTRING, n),         node.getBranchString());
		p.setProperty(String.format(PRIMITIVEINPUTS, n),      node.getPrimitiveInputs());
		p.setProperty(String.format(REFERENCEINPUTS, n),      node.getReferenceInputs());
		p.setProperty(String.format(ARITHMETICCONSTRAINT, n), node.getArithmeticConstraint());
		p.setProperty(String.format(REFERENCECONSTRAINT, n),  node.getReferenceConstraint());
		p.setProperty(String.format(EXTRABRANCH, n),          node.isExtraBranch() ? "T" : "F");
		p.setProperty(String.format(FINISHED, n),             node.isFinished() ? "T" : "F");
		p.setProperty(String.format(LAZYINITIALIZATION, n),   node.isLazyInitializationNode() ? "T" : "F");
		p.setProperty(String.format(METHODCALL, n), 		  node.getMethodSignature());
		p.setProperty(String.format(FINISHREASON, n), 		  node.getFinishReason());
	}

	public static ScheduledExecutionTree readTree(String filename) {
		// initialize the properties object
		p = new Properties();

		// load the tree from a file
		try {
			p.load(new FileInputStream(filename));
		} catch (Exception e) {
			System.err.println(String.format(ERROR_READ, filename));
			System.err.println(e);
			System.exit(-1);
		}

		// check the version
		if (!p.getProperty(VERSION, "").equals(VERSIONNUMBER)) {
			// version mismatch
			System.err.println(String.format(ERROR_VERSION, p.getProperty(VERSION, "unknown"), VERSIONNUMBER));
			System.exit(-1);
		}
		
		// no need to do type checking with one option
		ScheduledExecutionTree tree = new SimpleScheduledTree();

		// parse the tree from root (always index 0)
		tree.setRoot(readTree(0, null));

		return tree;
	}

	private static ExecutionNodeHead readTree(int n, ExecutionNodeHead parent) {
		// create the node
		ExecutionNodeHead node;
		if (parent != null) {
			node = new ExecutionNodeHead(parent);
		}
		else {
			node = new ExecutionNodeHead();
		}
		readData(node, n);

		String tailtype = p.getProperty(String.format(TAILTYPE, n), "");

		if (tailtype.equals(LINEARTAIL)) {
			LinearTail tail = new LinearTail();
			node.setTail(tail);
			if (p.getProperty(String.format(CHILD, n)) != null) {
				int child = Integer.parseInt(p.getProperty(String.format(CHILD, n)));
				tail.setChild(readTree(child, node));
			}
		}

		else if (tailtype.equals(BRANCHINGTAIL)) {
			BranchingTail tail = new BranchingTail();
			node.setTail(tail);
			if (p.getProperty(String.format(LEFTCHILD, n)) != null) {
				int child = Integer.parseInt(p.getProperty(String.format(LEFTCHILD, n)));
				tail.setLeft(readTree(child, node));
			}
			if (p.getProperty(String.format(RIGHTCHILD, n)) != null) {
				int child = Integer.parseInt(p.getProperty(String.format(RIGHTCHILD, n)));
				tail.setRight(readTree(child, node));
			}
		}

		else if (tailtype.equals(SCHEDULETAIL)) {
			// parse events and nextsleepset first so we can create the tail
			HashSet<EventIdentity> enabled = new HashSet<EventIdentity>();
			String tmp = p.getProperty(String.format(SCHEDULEENABLED, n));
			for (String eventid : tmp.split(";")) {
				enabled.add(EventIdentity.parseEventIdentity(eventid));
			}

			HashSet<EventIdentity> nextsleepset = new HashSet<EventIdentity>();
			tmp = p.getProperty(String.format(SCHEDULENEXTSLEEPSET, n));
			for (String eventid : tmp.split(";")) {
				nextsleepset.add(EventIdentity.parseEventIdentity(eventid));
			}

			// notice that nextsleepset is the same as basesleepset in this case
			ScheduleTail tail = new ScheduleTail(enabled, nextsleepset);
			node.setTail(tail);

			// then parse the children and sleepsets
			tmp = p.getProperty(String.format(SCHEDULECHILDREN, n));
			for (String entry : tmp.split(";")) {
				String[] split = entry.split(":");
				EventIdentity eventid = EventIdentity.parseEventIdentity(split[0]);
				tail.directAddChild(eventid, readTree(Integer.parseInt(split[1]), node));
			}

			tmp = p.getProperty(String.format(SCHEDULESLEEPSETS, n));
			for (String set : tmp.split(";")) {
				String[] split = set.split(":");
				EventIdentity eventid = EventIdentity.parseEventIdentity(split[0]);
				HashSet<EventIdentity> sleepset = new HashSet<EventIdentity>();
				if (split.length > 1) {
					for (String event : split[1].split(" ")) {
						sleepset.add(EventIdentity.parseEventIdentity(event));
					}
				}
				tail.directAddSleepSet(eventid, sleepset);
			}

		}

		// if nothing matched, there is no tail and nothing more to do
		
		return node;
	}

	private static void readData(ExecutionNodeHead node, int n) {
		node.setBranchString(           p.getProperty(String.format(BRANCHSTRING, n), ""));
		node.setPrimitiveInputs(        p.getProperty(String.format(PRIMITIVEINPUTS, n), ""));
		node.setReferenceInputs(        p.getProperty(String.format(REFERENCEINPUTS, n), ""));
		node.setArithmeticConstraint(   p.getProperty(String.format(ARITHMETICCONSTRAINT, n), ""));
		node.setReferenceConstraint(    p.getProperty(String.format(REFERENCECONSTRAINT, n), ""));
		node.setExtraBranch(            p.getProperty(String.format(EXTRABRANCH, n), "F").equals("T"));
		node.setFinished(               p.getProperty(String.format(FINISHED, n), "F").equals("T"));
		node.setLazyInitializationNode( p.getProperty(String.format(LAZYINITIALIZATION, n), "F").equals("T"));
		node.setMethodSignature		  ( p.getProperty(String.format(METHODCALL, n), ""));
		node.setFinishReason		  ( p.getProperty(String.format(FINISHREASON, n), ""));
	}

}
