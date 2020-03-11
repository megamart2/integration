package fi.hut.ics.lime.aspectmonitor;

import java.io.IOException;
import java.util.Map;

import spoon.processing.AbstractProcessor;
import spoon.processing.Property;
import spoon.processing.Severity;
import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.CtType;
import fi.hut.ics.lime.aspectmonitor.annotation.ObserveWrapper;
import fi.hut.ics.lime.aspectmonitor.annotation.SpecificationWrapper;
import fi.hut.ics.lime.aspectmonitor.aspect.AspectJAspectFactory;
import fi.hut.ics.lime.aspectmonitor.aspect.JAspectWriter;
import fi.hut.ics.lime.aspectmonitor.aspect.generator.CodeGenerator;
import fi.hut.ics.lime.aspectmonitor.lctsupport.SpecStateCounter;
import fi.hut.ics.lime.aspectmonitor.sourcecode.JavaMethod;
import fi.hut.ics.lime.aspectmonitor.sourcecode.JavaSource;
import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.aspect.AspectException;
import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.specification.Specification;
import fi.hut.ics.lime.common.specification.SpecificationException;
import fi.hut.ics.lime.common.specification.SpecificationFactory;
import fi.hut.ics.lime.common.specification.propositions.PropositionException;
import fi.hut.ics.lime.common.specification.propositions.PropositionFactory;
import fi.hut.ics.lime.common.utils.Debug;

public class SpecProcessor extends AbstractProcessor<CtType<?>> {
	private SpecificationFactory specificationFactory = SpecificationFactory.instance();
	private PropositionFactory propositionFactory = PropositionFactory.getInstance();
	private AspectJAspectFactory aspectFactory = AspectJAspectFactory.instance();
	/**
	 * Tells how a property tooltip is displayed.
	 * Since this is a spoon property, it can be changed in the spoon.xml file.
	 */
	@Property
	private DisplayMode displayMode = DisplayMode.PARSED;
	/**
	 * Tells whether to have observers update the {@link SpecStateCounter}.
	 * Since this is a spoon property, it can be changed in the spoon.xml file.
	 */
	@Property
	private boolean specStateCounting = true;
	/**
	 * Whether observers will have update heuristics for the LCT to use for path selection.
	 * The heuristics will be pre-calculated.
	 */
	@Property
	private boolean calculateHeuristic = true;
	/**
	 * The sampling depth for the heuristic calculation.
	 */
	@Property
	private int samplingDepth = 10;
	/**
	 * The samples to run per one state concidered in the heuristic calculation.
	 */
	@Property
	private int samplesPerHeuristic = 1000;
	/**
	 * The maximum number of heuristic values to calculate. Actual value may exeed this if there are more states in the
	 * primary automaton than specified here (only number of past time formulas considered is used to control this).
	 */
	@Property
	private int maxHeuristics = 1024;

	/**
	 * Spoon "main method"
	 * Reads annotations and converts them to propositions.
	 * @author jalampin
	 */
	public void process(CtType<?> ctType) {	
		//Debug.enable();
		
		// before doing anything else, set the target directory where log
		// files are to be written
		LogUtility.getInstance().setLogPath(getEnvironment().getDefaultFileGenerator().getOutputDirectory());
		
		// Since we don't want to modify the source files, we can
		// preserve formatting by just copying the files as is.
		// The spoon way of doing this is by using the "fragments" API.
		// In our case, when we want no changes, merely enabling the
		// fragments mode is enough.
		getEnvironment().useSourceCodeFragments(true);
		
		JavaSource jSource = new JavaSource(ctType);
		
		String pkgname = jSource.getPackage().getSimpleName();
		
		if (Character.isUpperCase(pkgname.charAt(0))) {
			getEnvironment().report(this, Severity.WARNING, 
					pkgname+": Package names should normally start with a lower case letter.\n"+
					"        If you see errors about this package name, this may be the cause.");
		}

		SpecificationWrapper returnSpecifications = SpecificationWrapper.getReturnSpecifications(ctType);
		SpecificationWrapper callSpecifications = SpecificationWrapper.getCallSpecifications(ctType);
		
		// create named specifications
		createPropositions(jSource, returnSpecifications);
		createPropositions(jSource, callSpecifications);
				
		// unnamed specifications
		createSpecifications(jSource, returnSpecifications);
		createSpecifications(jSource, callSpecifications);		
		
		for (CtMethod<?> ctMethod : ctType.getAllMethods()) {
			JavaMethod jMethod = new JavaMethod(ctMethod);
			
			// collect all observe annotations
			ObserveWrapper observe = new
				ObserveWrapper(ctMethod);
			if (!observe.hasObserve())
				continue;
			for (String name : observe.specs()) {
				// add the method to the specification
				try {
					Specification spec = specificationFactory.getSpecification(jSource, name);
					spec.addEnforcedMethod(jMethod);
					Class<? extends Exception> excClass;
					if (spec.getSpecType() == SpecType.CALL)
						excClass = observe.callSpecificationException();
					else {
						if (spec.getSpecType() != SpecType.RETURN)
							throw new AssertionError("spec not 'call' and not 'return'");
						excClass = observe.returnSpecificationException();
					}
					if (excClass != null)
						spec.setException(jMethod, excClass.getCanonicalName());
				} catch(SpecificationException e) {
					getEnvironment().report(this, Severity.ERROR, ctMethod, e.getMessage());
				}
			}
		}
	}

	private void createAspects(Map<Source, ? extends Map<String, ? extends Specification>> specs) {
		for (Source sourceType : specs.keySet())
			for (String name : specs.get(sourceType).keySet()) {
				Specification specification = specs.get(sourceType).get(name);
				
				CodeGenerator generator = new CodeGenerator(specification, specStateCounting, calculateHeuristic,
						samplingDepth, samplesPerHeuristic, maxHeuristics);
				
				if(specification.getEnforcedMethods().size() == 0) {
					getEnvironment().report(this, Severity.WARNING, ((JavaSource)sourceType).getCtType(),
							specification.toString()+" never gets triggered.");
				}
				else {
					try {
						aspectFactory.createAspect(specification, generator);
					} catch (AspectException e) {
						getEnvironment().report(this, Severity.ERROR, ((JavaSource)sourceType).getCtType(),
								specification.toString()+":"+e.getMessage());
					}
					displaySpecification(specification);
				}				
			}
	}
	
	/**
	 * Called when the entire AST of the compile-time unit has been processed.
	 */
	@Override
	public void processingDone() {
		createAspects(specificationFactory.getRegExpSpecifications());
		createAspects(specificationFactory.getPltlSpecifications());
		createAspects(specificationFactory.getNfaSpecifications());
		
		try {
			JAspectWriter.instance().writeAspects(aspectFactory.getAllAspects(), 
			 getEnvironment().getDefaultFileGenerator().getOutputDirectory(),
			 "aj");
		} catch (IOException e) {
			getEnvironment().report(this, Severity.ERROR, e.getMessage());
		}
	}

	/**
	 * Create named propositions for specifications.
	 * Propositions are claims not directly associated with code but
	 * used by specifications.
	 * @param sourceType The source type the annotation is associated with
	 * @param specs The object representation of the annotation
	 * @author jalampin, sliedes
	 */
	private void createPropositions(Source sourceType, SpecificationWrapper specs) {
		if(specs == null) {
			return;
		}
		
		try {
			for(String proposition : specs.valuePropositions())
				propositionFactory.createValuePropositionNode(sourceType, proposition);
			for(String proposition : specs.callPropositions())
				propositionFactory.createCallPropositionNode(sourceType, proposition);
			for(String proposition : specs.exceptionPropositions())
				propositionFactory.createExceptionPropositionNode(sourceType, proposition);
		} catch(PropositionException e) {
			getEnvironment().report(this, Severity.ERROR, ((JavaSource)sourceType).getCtType(), e.getMessage());
		}
	}

	/**
	 * Create return or call specifications from annotations.
	 * Return specifications tell how a method should respond,
	 * call specifications tell how a method is called.
	 * @param sourceType The source type the annotation is associated with
	 * @param specs The object representation of the annotation
	 * @author jalampin, sliedes
	 */
	private void createSpecifications(Source sourceType, SpecificationWrapper specs) {
		if(specs == null || sourceType == null)
			return;

		try {
			Class<? extends Exception> exc = specs.exception();
			for(String property : specs.pltlSpecs()) {
				Debug.println("createSpecifications(): +pltl: "+property);
				specificationFactory.createPltlSpecification(specs.getSpecType(),
						sourceType, property, exc.getCanonicalName(),
						specs.getSourceLocation());
				Debug.println("createSpecifications(): -pltl: "+property);
			}
			for(String property : specs.regexpSpecs()) {
				Debug.println("createSpecifications(): +regexp: "+property);
				specificationFactory.createRegExpSpecification(specs.getSpecType(),
						sourceType, property, exc.getCanonicalName(),
						specs.getSourceLocation());
				Debug.println("createSpecifications(): -regexp: "+property);
			}
			for (String property : specs.nfaSpecs()) {
				Debug.println("createSpecifications(): +nfa: "+property);
				specificationFactory.createNfaSpecification(specs.getSpecType(),
						sourceType, property, exc.getCanonicalName(),
						specs.getSourceLocation());
				Debug.println("createSpecifications(): -nfa: "+property);
			}
		} catch (SpecificationException e) {
			getEnvironment().report(this, Severity.ERROR, ((JavaSource)sourceType).getCtType(), 
					e.getMessage());
		}
	}
	
	/**
	 * Display method specifications as tool tips for the method in Eclipse.
	 * @param specification
	 */
	private void displaySpecification(Specification specification) {
		String message = specification.toString()+" ::= ";
		switch(displayMode) {	
		case DECLARED: 
			message += specification.getDeclared();
			break;
		case PARSED :
			message += specification.getParsed();
			break;
		case INTERNAL:
			message += specification.getInternal();
			break;
		case NONE : 
			return;
		}
		for(Method method : specification.getEnforcedMethods()) {	
			getEnvironment().report(this, Severity.MESSAGE, ((JavaMethod)method).getCtMethod(), 
					message);
		}
		
	}
}
