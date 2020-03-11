package fi.hut.ics.lime.tester.server.strategies.scheduling;

import fi.hut.ics.lime.tester.threading.EventSelection;

/**
 * An extension of {@link ScheduledDFSStrategy} which searches all schedulings even if the client reports no backtracks
 * for them.
 * 
 * @author osaariki
 */
public class ExhaustiveSearchStrategy extends ScheduledDFSStrategy
{

    /**
     * Creates a new instance of {@link ExhaustiveSearchStrategy} with the specified search tree.
     * 
     * @param o
     *            an instance of {@link SimpleScheduledTree}.
     */
    public ExhaustiveSearchStrategy(Object o)
    {
        super(o);
    }

    @Override
    public void scheduled(EventSelection selection)
    {
        boolean addsNode = hasTargetBeenReached();

        super.scheduled(selection);

        if (addsNode) {
            ExecutionNodeHead node = currentNode.getParent();

            ScheduleTail tail = (ScheduleTail) node.getTail();
            addBacktrack(node, tail.getEnabled());
        }
    }
}
