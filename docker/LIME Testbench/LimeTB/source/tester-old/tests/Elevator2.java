import fi.hut.ics.lime.tester.LCT;

public class Elevator2
{
   static int currentFloor;

    public static void main(String args[]) 
    {
        int targetFloor = LCT.getInteger(1,10);

        currentFloor = LCT.getInteger(1,10);

        int start = 1;
        int end = 10;

        if (currentFloor == 1 && targetFloor == 1)
            targetFloor = 1/0; // error

        if (currentFloor >= start && currentFloor <= end &&
            targetFloor >= start && targetFloor <= end) {
            move(targetFloor);

            if (targetFloor != currentFloor)
                targetFloor = 1/0;
        }
    }

    public static void move (int floor)
    {
        int moves = floor - currentFloor;

        if (moves < 0)
            moves = moves * -1;

        while (moves > 0) {
            if (currentFloor > floor) 
                currentFloor = down(currentFloor);
            else
                currentFloor = up(currentFloor);

            moves = moves - 1;
        }
    }

    public static int down (int floor)
    {
        floor = floor - 1;

        return floor;
    }

    public static int up (int floor)
    {
        floor = floor + 1;

        return floor;
    }
}
