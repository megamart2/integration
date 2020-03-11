package fi.hut.ics.lime.aspectmonitor;

import java.io.File;
import java.util.ArrayList;

import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;

public class LogUtility {
	
	private boolean logging;
	private ArrayList<String> watchedspecs;
	
	// a somewhat sane default, specprocessor should set the real path
	private static final String DEFAULTLOGPATH = "/tmp";
	
	private File logpath;
	
	public LogUtility() {
		this.logging = true;
		this.watchedspecs = new ArrayList<String>();
		this.logpath = new File(DEFAULTLOGPATH);
	}
	
	private static class LogUtilityHolder {
		private static final LogUtility INSTANCE = new LogUtility();
	}
	
	public static LogUtility getInstance() {
		return LogUtilityHolder.INSTANCE;
	}
	
	public void enableLogging() {
		this.logging = true;
	}
	
	public void disableLogging() {
		this.logging = false;
	}
	
	public void watchSpec(String name) {
		this.watchedspecs.add(name);
	}
	
	public void setLogPath(File logpath) {
		this.logpath = logpath;
	}
	
	public String getInitCode(Specification spec) {
		if (!this.logging || (this.watchedspecs.size() > 0 && !this.watchedspecs.contains(spec.getName())))
			return "// intialization code skipped for "+spec.getName()+"\n";
		StringBuilder props = new StringBuilder("new String[]{ ");
		StringBuilder proptypes = new StringBuilder("new String[]{ ");
		for (PropositionNode node : spec.getPropositionValues().keySet()) {
			props.append("\"");
			// need to escape quotes in case there are strings in the proposition
			props.append(node.getProposition().replaceAll("\"", "\\\\\""));
			props.append("\",");
			proptypes.append("\"");
			proptypes.append(node.getPropositionKind());
			proptypes.append("\",");
		}
		props.setCharAt(props.length()-1, '}');
		proptypes.setCharAt(proptypes.length()-1, '}');
		
		String code = "// logfile initialization code (added by LogUtility)\n" +
		"fi.hut.ics.lime.aspectmonitor.LogWriter.getInstance().initMessage(" +
		"this.toString(), " +
		"\""+this.logpath.getAbsolutePath()+"\", " +
		"\""+spec.getName()+"\", " +
		"\""+spec.getSpecType()+"\", " +
		// need to escape quotes in case there are strings in the specification
		"\""+spec.getDeclared().replaceAll("\"", "\\\\\"")+"\", " +
		props+", " +
		proptypes +
		");\n";
		return code;
	}
	
	public String getAroundCode(Specification spec, String methodname) {
		if (!this.logging || (this.watchedspecs.size() > 0 && !this.watchedspecs.contains(spec.getName())))
			return "// around message code skipped for "+spec.getName()+"\n";
		String code = "// logfile around message code (added by LogUtility)\n" +
		"fi.hut.ics.lime.aspectmonitor.LogWriter.getInstance().aroundMessage(" +
		"this.toString(), " +
		"\""+methodname+"\"" +
		");\n";
		return code;
	}
	
	public String getUpdateCode(Specification spec) {
		if (!this.logging || (this.watchedspecs.size() > 0 && !this.watchedspecs.contains(spec.getName())))
			return "// update messaage code skipped for "+spec.getName()+"\n";
		StringBuilder propvalues = new StringBuilder("new boolean[]{ ");
		for (PropositionNode node : spec.getPropositionValues().keySet()) {
			propvalues.append(node.getValue());
			propvalues.append(",");
		}
		propvalues.setCharAt(propvalues.length()-1, '}');
		
		String code = "// logfile update message code (added by LogUtility)\n" +
		"fi.hut.ics.lime.aspectmonitor.LogWriter.getInstance().updateMessage(" +
		"this.toString(), " +
		propvalues +
		");\n";
		return code;
	}
	
	public String getErrorCode(Specification spec) {
		if (!this.logging || (this.watchedspecs.size() > 0 && !this.watchedspecs.contains(spec.getName())))
			return "// error message code skipped for "+spec.getName()+"\n";
		String code = "// logfile error message code (added by LogUtility)\n" +
		"fi.hut.ics.lime.aspectmonitor.LogWriter.getInstance().errorMessage(" +
		"this.toString()" +
		");\n";
		return code;
	}

}
