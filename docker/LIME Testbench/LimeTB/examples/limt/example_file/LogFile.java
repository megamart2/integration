package example_file;

import fi.hut.ics.lime.aspectmonitor.annotation.CallSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.ReturnSpecifications;
import fi.hut.ics.lime.aspectmonitor.annotation.Observe;

@CallSpecifications(
	pltl = {
		"ProperData ::= G(write() -> <{ #s != null }>)"
	}
)
@ReturnSpecifications(
	pltl = { 
		"ProperWrites ::= "+"G(<{ #pre(#s.length() + #this.length()) == #this.length() }>)"
	}
)
public interface LogFile {
	@Observe(
		specs = { "ProperWrites" }
        )
	public void write(String s);
	public int length();
}
