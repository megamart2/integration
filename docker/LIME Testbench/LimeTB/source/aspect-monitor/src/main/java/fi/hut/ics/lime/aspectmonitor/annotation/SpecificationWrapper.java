package fi.hut.ics.lime.aspectmonitor.annotation;

import java.lang.annotation.Annotation;
import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.sourcecode.SourceLocation;
import spoon.reflect.cu.SourcePosition;
import spoon.reflect.declaration.CtAnnotation;
import spoon.reflect.declaration.CtType;

/**
 * A wrapper for return and call specification annotation interfaces so they can be
 * accessed as a single type. This kludge is only needed because Java does
 * not support type hierarchies for annotations.
 * @author sliedes
 */
public class SpecificationWrapper {
	private CallSpecifications callSpecs = null;
	private ReturnSpecifications returnSpecs = null;
	private SourceLocation location;
	
	/**
	 * Initialize the wrapper with an call specification.
	 * @param c the call specification
	 */
	public SpecificationWrapper(CallSpecifications c, SourceLocation location) {
		if (c == null)
			throw new AssertionError("c == null");
		callSpecs = c;
		this.location = location;
	}
	
	/**
	 * Initialize the wrapper with a return specification.
	 * @param c the return specification
	 */
	public SpecificationWrapper(ReturnSpecifications c, SourceLocation location) {
		if (c == null)
			throw new AssertionError("c == null");
		returnSpecs = c;
		this.location = location;
	}
	
	/**
	 * Get the type of the wrapped specification (call or return).
	 * @return the type of the specification as a SpecType
	 */
	public SpecType getSpecType() {
		if (callSpecs != null)
			return SpecType.CALL;
		else
			return SpecType.RETURN;
	}
	
	/**
	 * Get the call specifications associated with the given type.
	 * @param ctType the type to get specifications for
	 * @return a SpecificationWrapper object containing the call specifications, or null if none
	 */
	public static SpecificationWrapper getCallSpecifications(CtType<?> ctType) {
		for (CtAnnotation<? extends Annotation> a : ctType.getAnnotations())
			if (a.getActualAnnotation() instanceof CallSpecifications) {
				SourcePosition pos = a.getPosition();
				return new SpecificationWrapper((CallSpecifications)a.getActualAnnotation(),
						new SourceLocation(pos.getFile().getPath(), pos.getLine(), pos.getColumn()));		
			}
		
		return null;
	}

	/**
	 * Get the return specifications associated with the given type.
	 * @param ctType the type to get specifications for
	 * @return a SpecificationWrapper object containing the return specifications, or null if none
	 */
	public static SpecificationWrapper getReturnSpecifications(CtType<?> ctType) {
		for (CtAnnotation<? extends Annotation> a : ctType.getAnnotations())
			if (a.getActualAnnotation() instanceof ReturnSpecifications) {
				SourcePosition pos = a.getPosition();
				return new SpecificationWrapper((ReturnSpecifications)a.getActualAnnotation(),
						new SourceLocation(pos.getFile().getPath(), pos.getLine(), pos.getColumn()));		
			}
		
		return null;
	}
	
	/**
	 * @return value propositions, as a string array
	 */
	public String[] valuePropositions() {
		if (callSpecs != null)
			return callSpecs.valuePropositions();
		else
			return returnSpecs.valuePropositions();
	}
	
	/**
	 * @return call propositions, as a string array
	 */
	public String[] callPropositions() {
		if (callSpecs != null)
			return callSpecs.callPropositions();
		else
			return returnSpecs.callPropositions();
	}
	
	/**
	 * Get exception propositions, as a string array.
	 * For call specifications, return always an empty array as exception propositions
	 * are not supported there.
	 */
	public String[] exceptionPropositions() {
		if (callSpecs != null)
			// We don't support exception propositions in interface specifications.
			// While named propositions are common to interface and library specifications,
			// exception propositions cannot be used in interface specifications (it
			// wouldn't make sense), so perhaps it's best to just forbid them in interface
			// specifications.
			// However there's no need to complicate things further by doing anything more
			// noisy than returning an empty array on interface specifications.
			return new String[0];
		else
			return returnSpecs.exceptionPropositions();
	}
	
	/**
	 * @return PLTL specs, as a string
	 */
	public String[] pltlSpecs() {
		if (callSpecs != null) {
			//System.out.println(callSpecs);
			return callSpecs.pltl();
		} else {
			//System.out.println(callSpecs);
			return returnSpecs.pltl();
		}
	}

	/**
	 * @return regexp specs, as a string array
	 */
	public String[] regexpSpecs() {
		if (callSpecs != null) {
			//System.out.println(ifCheckers);
			return callSpecs.regexp();
		} else {
			//System.out.println(libCheckers);
			return returnSpecs.regexp();
		}
	}
	
	/**
	 * @return automaton (NFA) specs, as a string array
	 */
	public String[] nfaSpecs() {
		if (callSpecs != null) {
			//System.out.println(ifCheckers);
			return callSpecs.nfa();
		} else {
			//System.out.println(libCheckers);
			return returnSpecs.nfa();
		}
	}
	
	/**
	 * @return default exception
	 */
	public Class<? extends Exception> exception() {
		if (callSpecs != null) {
			//System.out.println(ifCheckers);
			return callSpecs.exception();
		} else {
			//System.out.println(libCheckers);
			return returnSpecs.exception();
		}
	}

	public SourceLocation getSourceLocation() {
		return location;
	}
	
	private String joinStrings(String delim, String[] strs) {
		if (strs.length == 0)
			return "";
		
		StringBuffer b = new StringBuffer(strs[0]);
		
		for (int i=1; i<strs.length; i++)
			b.append(delim+strs[i]);
		
		return b.toString();
	}
	
	@Override
	public String toString() {
		String[] pltl, regexp, nfa;
		String type;
		if (callSpecs != null) {
			type = "CALL";
			pltl = callSpecs.pltl();
			regexp = callSpecs.regexp();
			nfa = callSpecs.nfa();
		} else {
			if (returnSpecs == null)
				throw new AssertionError("barf");
			type = "RETURN";
			pltl = returnSpecs.pltl();
			regexp = returnSpecs.regexp();
			nfa = returnSpecs.nfa();			
		}
		
		return ("SpecificationWrapper(type=" + type + ", " +
				"pltl=[" + joinStrings(", ", pltl) + "], " +
		 		"regexp=[" + joinStrings(", ", regexp) + "], " +
				"nfa=[" + joinStrings(", ", nfa) + "])");
		
	}
}
