package example_factory;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.ReturnSpecifications;


@CallSpecifications(
  pltl = {
    "Start ::= G (process() -> O(start()))",
    "Stop ::= G (stop() -> O(start()))",
    "Reset ::= G (reset() -> O(start()))",
    "StartReset ::= G (process() -> (!stop() S start()))"
  }
)
@ReturnSpecifications(
  pltl = {
    "Decrease ::= G (process() -> <{ #pre(#this.getCapasity()) == #this.getCapasity() + 1}>)"
  }
)
public interface Factory {	
    public void start();
    public void stop();
    public void reset();
    public int process (int item);
    public int getCapasity();
    public int getMaxCapasity();
}
