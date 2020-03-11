package example_factory;

public class FactoryImplementation implements Factory
{
    private int maxCapasity;
    private int currentCapasity;


    public FactoryImplementation (int capasity)
    {
        maxCapasity = capasity;
        currentCapasity  = capasity;
    }

    public void start()
    {
        System.out.println("Factory start");
    }

    public void stop()
    {
        System.out.println("Factory stop");
    }

    public void reset()
    {
        System.out.println("Factory reset");

        currentCapasity = maxCapasity;

        if (currentCapasity == 263)
            maxCapasity++;
    }

    public int process (int item)
    {
        currentCapasity--;

        int x = item / currentCapasity;

        System.out.println("Item: " + item + " -> processes to: " + x);


        //if (currentCapasity < 0)
          //  currentCapasity = 0;

        return currentCapasity;
    }


    public int getCapasity()
    {
        return currentCapasity;
    }


    public int getMaxCapasity()
    {
        return maxCapasity;
    }
}
