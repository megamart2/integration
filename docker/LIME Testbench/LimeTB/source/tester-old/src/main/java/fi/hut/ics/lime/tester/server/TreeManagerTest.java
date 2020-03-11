package fi.hut.ics.lime.tester.server;

import fi.hut.ics.lime.tester.server.strategies.*;
import fi.hut.ics.lime.tester.server.strategies.scheduling.*;
import fi.hut.ics.lime.tester.threading.EventIdentity;

import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

public class TreeManagerTest {
	
	private static Random r;
	
	public static void main(String[] args) {

		String filename = "foobar";
		int nodes = 1000;
		long seed = 1337;

		for (String arg : args) {
			if (arg.equals("-h")) {
				System.out.println("run TreeManager tests");
				System.out.println("    -h for this help");
				System.out.println("    -f<name>   to set tmp file name (default: "+filename+")");
				System.out.println("    -n<number> to set the size of the test tree (default: "+nodes+")");
				System.out.println("    -r<number> to set the random seed");
				System.exit(0);
				
			}
			else if (arg.startsWith("-f")) {
				filename = arg.substring(2);
			}
			else if (arg.startsWith("-n")) {
				try {
					nodes = Integer.parseInt(arg.substring(2));
				}
				catch (NumberFormatException e) {
					System.err.println("could not parse "+arg.substring(2));
					System.exit(1);
				}
			}
			else if (arg.startsWith("-r")) {
				try {
					seed = Long.parseLong(arg.substring(2));
				}
				catch (NumberFormatException e) {
					System.err.println("could not parse "+arg.substring(2));
					System.exit(1);
				}
			}
			else {
				System.err.println("unknown parameter "+arg+", -h for help");
				System.exit(1);
			}
		}
		
		r = new Random(seed);

		SimpleScheduledTree tree;

		// first test that simple versions of all branching types are working
		System.out.println("testing LinearTail...");
		tree = new SimpleScheduledTree();
		addLinearTail(tree.getRoot());
		TreeManager.writeTree(tree, filename);
		System.out.println(compareTree(tree, TreeManager.readTree(filename)) ? "OK" : "FAIL");

		System.out.println("testing BranchingTail...");
		tree = new SimpleScheduledTree();
		addBranchingTail(tree.getRoot());
		TreeManager.writeTree(tree, filename);
		System.out.println(compareTree(tree, TreeManager.readTree(filename)) ? "OK" : "FAIL");

		System.out.println("testing ScheduleTail...");
		tree = new SimpleScheduledTree();
		addScheduleTail(tree.getRoot(), 5);
		TreeManager.writeTree(tree, filename);
		System.out.println(compareTree(tree, TreeManager.readTree(filename)) ? "OK" : "FAIL");

		// then generate a random tree and test that
		System.out.println("generating an approximately "+nodes+" node random tree...");
		tree = new SimpleScheduledTree();
		while (nodes > 0) {
			nodes -= generateTree(tree.getRoot());
		}
		System.out.println("tree generated, testing...");
		TreeManager.writeTree(tree, filename);
		System.out.println(compareTree(tree, TreeManager.readTree(filename)) ? "OK" : "FAIL");
	}

	private static int generateTree(ExecutionNodeHead current) {
		// find a random leaf node
		while (current.getTail() != null) {
			int children = current.getTail().getChildren().size();
			current = (ExecutionNodeHead)current.getTail().getChildren().toArray()[r.nextInt(children)];
		}

		int roll = r.nextInt(100);
		if (roll < 33) {
			// 1 child for lineartail
			addLinearTail(current);
			return 1;
		}
		else if (roll < 66) {
			// 2 children for branchingtail
			addBranchingTail(current);
			return 2;
		}
		else {
			// say 1-5 children for each scheduletail
			int children = r.nextInt(5)+1;
			addScheduleTail(current, children);
			return children;
		}

	}

	private static void addLinearTail(ExecutionNodeHead node) {
		LinearTail tail = new LinearTail();
		node.setTail(tail);
		tail.setChild(newNode(node));
	}

	private static void addBranchingTail(ExecutionNodeHead node) {
		BranchingTail tail = new BranchingTail();
		node.setTail(tail);
		tail.setLeft(newNode(node));
		tail.setRight(newNode(node));
	}

	private static void addScheduleTail(ExecutionNodeHead node, int children) {
		HashSet<EventIdentity> events = new HashSet<EventIdentity>();
		HashSet<EventIdentity> basesleepset = new HashSet<EventIdentity>();
		for (int i = 0; i < children; i++) {
			EventIdentity eventid = new EventIdentity(r.nextLong(), r.nextInt());
			events.add(eventid);
			if (r.nextBoolean())
				basesleepset.add(eventid);
		}
		ScheduleTail tail = new ScheduleTail(events, basesleepset);
		node.setTail(tail);
		for (EventIdentity event : events) {
			tail.addChild(event, newNode(node));
		}
	}

	private static ExecutionNodeHead newNode(ExecutionNodeHead parent) {
		ExecutionNodeHead node = new ExecutionNodeHead(parent);

		node.setArithmeticConstraint(randomString(10));
		node.setReferenceConstraint(randomString(20));

		if (r.nextBoolean()) {
			node.setBranchString(randomString(5));
			node.setPrimitiveInputs(randomString(10));
			node.setReferenceInputs(randomString(15));
		}

		node.setExtraBranch(r.nextBoolean());
		node.setLazyInitializationNode(r.nextBoolean());
		node.setFinished(r.nextBoolean());

		return node;
	}
	
	private static String randomString(int length) {
		char[] str = new char[length];
		for (int i = 0; i < length; i++)
			str[i] = (char)r.nextInt(Character.MAX_VALUE);
		return new String(str);
	}

	public static boolean compareTree(ScheduledExecutionTree a, ScheduledExecutionTree b) {
		// go through both trees node by node and see if they are equal
		return compareNode(a.getRoot(), b.getRoot());
	}

	private static boolean compareNode(ExecutionNodeHead a, ExecutionNodeHead b) {
		if (a == null) {
			if (b == null) {
				return true;
			}
			else {
				return false;
			}
		}
		else if (b == null) {
			return false;
		}

		if (!a.getBranchString().equals(         b.getBranchString()) ||
		    !a.getPrimitiveInputs().equals(      b.getPrimitiveInputs()) ||
			!a.getReferenceInputs().equals(      b.getReferenceInputs()) ||
			!a.getArithmeticConstraint().equals( b.getArithmeticConstraint()) ||
			!a.getReferenceConstraint().equals(  b.getReferenceConstraint()) ||
			(a.isFinished() !=                   b.isFinished()) ||
			(a.isExtraBranch() !=                b.isExtraBranch()) ||
			(a.isLazyInitializationNode() !=     b.isLazyInitializationNode()))
			return false;

		if (a.getTail() != null) {
			if (b.getTail() != null) {
				if (a.getTail() instanceof LinearTail && b.getTail() instanceof LinearTail) {
					LinearTail taila = (LinearTail)a.getTail();
					LinearTail tailb = (LinearTail)b.getTail();
					return compareNode(taila.getChild(), tailb.getChild());
				}
				else if (a.getTail() instanceof BranchingTail && b.getTail() instanceof BranchingTail) {
					BranchingTail taila = (BranchingTail)a.getTail();
					BranchingTail tailb = (BranchingTail)b.getTail();
					if (compareNode(taila.getLeft(), tailb.getLeft())) {
						return compareNode(taila.getRight(), tailb.getRight());
					}
					else {
						return false;
					}
				}
				else if (a.getTail() instanceof ScheduleTail && b.getTail() instanceof ScheduleTail) {
					ScheduleTail taila = (ScheduleTail)a.getTail();
					ScheduleTail tailb = (ScheduleTail)b.getTail();
					// check enabled
					if (!taila.getEnabled().equals(tailb.getEnabled()))
						return false;
					// check nextsleepset
					if (!taila.directGetNextSleepSet().equals(tailb.directGetNextSleepSet()))
						return false;
					// check sleepsets
					for (Entry<EventIdentity, Set<EventIdentity>> entrya : taila.directGetSleepSets()) {
						boolean match = false;
						for (Entry<EventIdentity, Set<EventIdentity>> entryb : tailb.directGetSleepSets()) {
							if (entrya.getKey().equals(entryb.getKey())) {
								match = entrya.getValue().equals(entryb.getValue());
								break;
							}
						}
						if (match == false)
							return false;
					}
					// check children
					if (taila.getChildEntries().size() != tailb.getChildEntries().size())
						return false;
					for (Entry<EventIdentity, ExecutionNodeHead> entrya : taila.getChildEntries()) {
						boolean match = false;
						for (Entry<EventIdentity, ExecutionNodeHead> entryb : tailb.getChildEntries()) {
							if (entrya.getKey().equals(entryb.getKey())) {
								match = compareNode(entrya.getValue(), entryb.getValue());
								break;
							}
						}
						if (match == false)
							return false;
					}
				}
				else {
					// tail types didn't match
					return false;
				}
			}
			else {
				return false;
			}
		}
		else if (b.getTail() != null) {
			return false;
		}

		return true;
	}

}
