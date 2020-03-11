public class IntContainer implements Comparable
{
   
    public int value;
        
    public IntContainer()
    {

    }

    public IntContainer(int v)
    {
        value = v;
    }

    public int compareTo(Object o) {
        IntContainer i = (IntContainer)o;

        if (this.value > i.value)
            return 1;
        else if (this.value == i.value)
            return 0;
        else
            return -1;
    }
}
