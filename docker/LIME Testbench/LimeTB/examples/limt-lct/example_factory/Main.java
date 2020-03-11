package example_factory;

import fi.hut.ics.lime.tester.LCT;
import fi.hut.ics.lime.aspectmonitor.ExceptionOverride;
//import fi.hut.ics.lime.tester.misc.InconclusiveException;
import fi.hut.ics.lime.partial.InconclusiveException;

public class Main
{

    public static void main(String[] args)
    {
        Factory test = new FactoryImplementation(LCT.getInteger(0, 100));

        ExceptionOverride.setCallException(test, InconclusiveException.class);

        int counter = 3;
        try {
            while (counter-- > 0) {
                int select = LCT.getInteger(1,4);

                switch (select) {
                    case 1: test.start(); break;
                    case 2: test.stop(); break;
                    case 3: test.reset(); break;
                    case 4: test.process(LCT.getInteger());break;
                }
            }
        }
        catch (InconclusiveException e) {
            System.out.println("Inconclusive test run.");
        }
    }
}
