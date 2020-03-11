public class IntContainer implements Comparable<IntContainer>
{
   
    public int value;
        
    public IntContainer()
    {

    }

    public IntContainer(int v)
    {
        value = v;
    }

    public int compareTo(IntContainer i) {
        if (this.value > i.value)
            return 1;
        else if (this.value == i.value)
            return 0;
        else
            return -1;
    }
}
