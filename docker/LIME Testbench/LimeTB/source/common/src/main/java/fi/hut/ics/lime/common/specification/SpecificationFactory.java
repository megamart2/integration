package fi.hut.ics.lime.common.specification;

import java.io.StringReader;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Map;
import java.util.Scanner;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import fi.hut.ics.lime.common.annotation.SpecType;
import fi.hut.ics.lime.common.automaton.AutomatonAdapter;
import fi.hut.ics.lime.common.automaton.AutomatonAdapterFactory;
import fi.hut.ics.lime.common.automaton.AutomatonException;
import fi.hut.ics.lime.common.automaton.RegexpAdapter;
import fi.hut.ics.lime.common.automaton.RegularExpressionException;
import fi.hut.ics.lime.common.automaton.ast.AutomatonDefinition;
import fi.hut.ics.lime.common.automaton.ast.AutomatonDefinition.StateInfo;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomataFactory;
import fi.hut.ics.lime.common.automaton.guardedTransitionAutomaton.GuardedTransitionAutomatonException;
import fi.hut.ics.lime.common.automaton.parser.AutomatonLexer;
import fi.hut.ics.lime.common.automaton.parser.AutomatonParser;
import fi.hut.ics.lime.common.logic.TemporalLogicException;
import fi.hut.ics.lime.common.logic.ast.modifiers.FormulaRewriter;
import fi.hut.ics.lime.common.logic.ast.modifiers.NegativeNormalFormModifier;
import fi.hut.ics.lime.common.logic.ast.node.BooleanExpression;
import fi.hut.ics.lime.common.logic.ast.node.PropositionNode;
import fi.hut.ics.lime.common.logic.ast.visitors.DAGCreatingVisitor;
import fi.hut.ics.lime.common.logic.ast.visitors.PrettyPrinter;
import fi.hut.ics.lime.common.logic.ast.visitors.PropositionalSemanticAnalysisVisitor;
import fi.hut.ics.lime.common.logic.ast.visitors.SemanticAnalysisVisitor;
import fi.hut.ics.lime.common.logic.ast.visitors.SemanticException;
import fi.hut.ics.lime.common.logic.lexer.PropertyLexer;
import fi.hut.ics.lime.common.logic.parser.PLTLParser;
import fi.hut.ics.lime.common.pltl.scheck.SCheckException;
import fi.hut.ics.lime.common.regexp.lexer.LexicalException;
import fi.hut.ics.lime.common.regexp.lexer.RegExpLexer;
import fi.hut.ics.lime.common.regexp.lexer.token.LexicalToken;
import fi.hut.ics.lime.common.sourcecode.Source;
import fi.hut.ics.lime.common.sourcecode.SourceLocation;
import fi.hut.ics.lime.common.specification.propositions.PropositionFactory;
import fi.hut.ics.lime.common.specification.visitors.NamedPropositionExpanderVisitor;
import fi.hut.ics.lime.common.specification.visitors.PastTimeFormulaVisitor;
import fi.hut.ics.lime.common.utils.Debug;

/**
 * Singleton specification factory for creating specification
 * objects out of string representations of formulas.
 * @author jalampin
 * 
 */
public class SpecificationFactory {
	private static final AutomatonAdapterFactory automatonAdapterFactory = AutomatonAdapterFactory.instance();
	private static final GuardedTransitionAutomataFactory automataFactory = GuardedTransitionAutomataFactory.instance();
	private static final PropositionFactory propFactory = PropositionFactory.getInstance();
	private Map<Source, Map<String, PltlSpecification>> pltlSpecifications;
	private Map<Source, Map<String, BricsAutomatonSpecification>> regexpSpecifications;
	private Map<Source, Map<String, BricsAutomatonSpecification>> nfaSpecifications;
	private Map<Source, Map<String, Specification>> specifications;

	private static final SpecificationFactory instance = new SpecificationFactory();	
	private static final PropertyLexer propertyLexer = new PropertyLexer();
	private static final RegExpLexer regExpLexer = new RegExpLexer();
	private static final Pattern PROPERTY_PATTERN = Pattern.compile("^((?:\\w+\\s+)*)([a-zA-Z_]\\w*) ::= (.+)");
	private static final Map<String, SpecModifier> SPEC_MODIFIER_KEYWORDS =
		new HashMap<String, SpecModifier>() {
		{
			put("perthread", SpecModifier.PERTHREAD);
		}
	};
	
	/** Global access point for a singleton specification factory.
	 *  @return the specification factory instance
	 */
	public static SpecificationFactory instance() {
		return instance;
	}
	
	private SpecificationFactory() {
		this.pltlSpecifications =
			new Hashtable<Source, Map<String,PltlSpecification>>();
		this.regexpSpecifications = 
			new Hashtable<Source, Map<String,BricsAutomatonSpecification>>();
		this.nfaSpecifications = 
			new Hashtable<Source, Map<String,BricsAutomatonSpecification>>();
		this.specifications =
			new Hashtable<Source, Map<String,Specification>>();
	}
	
	/**
	 * Creates a PLTL specification from String representation of a the PLTL property.
	 * The property is given lexically in format: ^([a-zA-Z]\\w*) ::= (.+)
	 * 
	 * @param type the type of the specification; return or call
	 * @param sourceType the source type the specification corresponds to
	 * @param property the named PLTL formula
	 * @param exc The qualified name of the exception to throw by default on 
	 * spec violation.
	 * @throws SpecificationException If the specification construction
	 * is unsuccessful.
	 * @author jalampin, sliedes
	 * @param sourceLocation 
	 */
	public void createPltlSpecification(SpecType type, Source sourceType,
			String property, String exc, SourceLocation sourceLocation) 
	throws SpecificationException {
		Debug.println("+createPltlSpecification()");
		PltlSpecification specification = new PltlSpecification();
		Debug.println("createPltlSpecification: initSpec");
		initSpecification(specification, sourceType, property);
		Debug.println("createPltlSpecification: <- initSpec");
		specification.setSpecType(type);
		specification.setDefaultException(exc);
		specification.setSourceLocation(sourceLocation);
		Debug.println("createPltlSpecification: -> initPltlSpec");
		initPltlSpecification(specification);
		Debug.println("createPltlSpecification: <- initPltlSpec");
		Debug.println("-createPltlSpecification()");
	}
	
	/**
	 * 
	 * The property is given lexically in format: ^([a-zA-Z]\\w*) ::= (.+)
	 * 
	 * @param type the type of the specification; return or call 
	 * @param sourceType the source type to which the specification belongs to
	 * @param property the property as a string
	 * @param exc The qualified name of the exception to throw by default on 
	 * spec violation.
	 * @throws SpecificationException on error
	 * @author jalampin, sliedes
	 * @param sourceLocation 
	 */
	public void createRegExpSpecification(SpecType type, Source sourceType,
			String property, String exc, SourceLocation sourceLocation) 
	throws SpecificationException {
		BricsAutomatonSpecification specification = new BricsAutomatonSpecification();
		initSpecification(specification, sourceType, property);
		specification.setSpecType(type);
		specification.setDefaultException(exc);
		specification.setSourceLocation(sourceLocation);
		initRegExpSpecification(specification);
	}	

	/**
	 * 
	 * @param type the type of the specification; return or call
	 * @param sourceType the source type to which the specification belongs to
	 * @param property the property as a string
	 * @param exc The exception to throw by default on spec violation.
	 * @throws SpecificationException on error
	 * @author sliedes
	 * @param sourceLocation 
	 */
	public void createNfaSpecification(SpecType type, Source sourceType,
			String property, String exc, SourceLocation sourceLocation)
	throws SpecificationException {
		BricsAutomatonSpecification specification = new BricsAutomatonSpecification();
		initSpecification(specification, sourceType, property);
		specification.setSpecType(type);
		specification.setDefaultException(exc);
		specification.setSourceLocation(sourceLocation);
		initNfaSpecification(specification);
	}
	
	/**
	 * Getter method for specifications.
	 * @param sourceType The source type to which the specification relates to.
	 * @param name The name of the specification.
	 * @return The specification corresponding to compile time type and specification
	 *   name.
	 * @throws SpecificationException If the specification does not exist or is invalid.
	 */
	public Specification getSpecification(Source sourceType, String name) 
	throws SpecificationException {
		Map<String, PltlSpecification> pltlSpecs = pltlSpecifications.get(sourceType);
		Map<String, BricsAutomatonSpecification> regexpSpecs = regexpSpecifications.get(sourceType);
		Map<String, BricsAutomatonSpecification> nfaSpecs =
			nfaSpecifications.get(sourceType);

		if(pltlSpecs != null && pltlSpecs.containsKey(name)) {
			return pltlSpecs.get(name);
		} else if(regexpSpecs != null && regexpSpecs.containsKey(name)) {
			return regexpSpecs.get(name);
		} else if(nfaSpecs != null && nfaSpecs.containsKey(name)) {
			return nfaSpecs.get(name);
		}
		
		throw new SpecificationException(name+": invalid or non-existing specification.");
	}	
	
	
	/**
	 * Get all PLTL specs.
	 * @return all PLTL specs 
	 */
	public Map<Source, Map<String, PltlSpecification>> getPltlSpecifications() {
		return pltlSpecifications;
	}

	/**
	 * .Get all regexp specs 
	 * @return all regexp specs
	 */
	public Map<Source, Map<String, BricsAutomatonSpecification>> getRegExpSpecifications() {
		return regexpSpecifications;
	}

	/**
	 * Get all always_nfa specs.
	 * @return all always_nfa specs.
	 */
	public Map<Source, Map<String, BricsAutomatonSpecification>>
	getNfaSpecifications() {
		return nfaSpecifications;
	}
	
	/**
	 * Initialize a specification compound object.
	 * @param specification Specification object
	 * @param sourceType The source type the specification object is associated with
	 * @param specText Textual form of the specification
	 * @throws SpecificationException on syntax or logic error
	 */
	private void initSpecification(Specification specification, Source sourceType, String specText) 
	throws SpecificationException {
		Scanner scanner = new Scanner(specText);
		
		if(scanner.findInLine(PROPERTY_PATTERN) == null) {
			throw new SpecificationException("Specifications must be of the form: "+
				PROPERTY_PATTERN.pattern()+". Got: "+specText);
		}
		
		specification.setSourceType(sourceType);
		if (scanner.match().groupCount() != 3)
			throw new AssertionError("PROPERTY_PATTERN should have exactly 3 groups.");
		
		// Read the modifiers from the specification text and match them to their SpecModifier values
		Scanner modifierScanner = new Scanner(scanner.match().group(1));
		EnumSet<SpecModifier> modifiers = EnumSet.noneOf(SpecModifier.class);
		while (modifierScanner.hasNext()) {
			String modifierName = modifierScanner.next().trim();
			if (SPEC_MODIFIER_KEYWORDS.containsKey(modifierName))
				modifiers.add(SPEC_MODIFIER_KEYWORDS.get(modifierName));
			else
				throw new SpecificationException("Unidentified specification modifier " +
						modifierName + " in specification: " + specText);
		}
		specification.setModifiers(modifiers);
		
		specification.setName(scanner.match().group(2));
		specification.setDeclared(scanner.match().group(3));
	}
	
	private void initPltlSpecification(PltlSpecification specification)
	throws SpecificationException {
		String property  = specification.getDeclared();
		String name      = specification.getName();
		Source sourceType = specification.getSourceType();
		
		checkDuplicateSpecification(sourceType, name);

		// Lexical, syntactic and semantic analysis of the formula:
		BooleanExpression node = null;
		try {
			Debug.println("initPltlSpecification: parsing");
			PLTLParser pLTLParser = new PLTLParser(propertyLexer.lexProperty(property));
			node = pLTLParser.getAst();
			new SemanticAnalysisVisitor(node);
		} catch(TemporalLogicException e) {
			throw new SpecificationException(name+": "+e.getMessage(), e.getCause());
		}
	    
		// store the parsed representation of the formula:
		PrettyPrinter prettyPrinter = new PrettyPrinter(node);
		specification.setParsed(prettyPrinter.getPrettyPrint());
		
		Debug.println("initPltlSpecification: rewriting");
		
		// rewrite formulas to the internal presentation:
		node = node.accept(new FormulaRewriter());
		node = node.accept(new NegativeNormalFormModifier());
		
		Debug.println("initPltlSpecification: replacing named");
		
		// replace named propositions:		
		NamedPropositionExpanderVisitor propositionVisitor = null;
		propositionVisitor = new NamedPropositionExpanderVisitor(specification, propFactory.getPropositionNodesByType(sourceType));
		node = node.accept(propositionVisitor);
		
		if(propositionVisitor.getUndefined().size() > 0) {
			String errors = name+"Following propositions are undefined:\n";
			for(PropositionNode prop : propositionVisitor.getUndefined()) {
				errors += prop.getProposition();
			}
			throw new SpecificationException(errors);
		}		
		
		Debug.println("initPltlSpecification: creating dag");
		
		// create a DAG and assign past time indices:
		new PrettyPrinter(node);
		node.accept(new DAGCreatingVisitor());	
		specification.setNode(node);
		new PastTimeFormulaVisitor(specification);
		
		// store the final internal representation of the formula:
		prettyPrinter = new PrettyPrinter(node);
		specification.setInternal(prettyPrinter.getPrettyPrint());
		
		if(pltlSpecifications.get(sourceType) == null) {
			pltlSpecifications.put(sourceType, new Hashtable<String, PltlSpecification>());
		}
		pltlSpecifications.get(sourceType).put(name, specification);
		
		if (specifications.get(sourceType) == null) {
			specifications.put(sourceType, new Hashtable<String,Specification>());
		}
		specifications.get(sourceType).put(name, specification);
		
		Debug.println("initPltlSpecification: generating automaton");
		
		// generate automaton from the specification:
		try {
			specification.setAutomaton(automataFactory.generateAutomaton(node));
		} catch (SCheckException e) {
			throw new SpecificationException(name+": "+e.getMessage(), e.getCause());
		}
	}
	
	private void initRegExpSpecification(BricsAutomatonSpecification specification) 
	throws SpecificationException {
		String name, property;
		RegexpAdapter regexpAdapter;
		name = specification.getName();	
		property = specification.getDeclared();
		Source sourceType = specification.getSourceType();
		LinkedList<LexicalToken> tokens;
		checkDuplicateSpecification(sourceType, name);
	
		try {
			tokens = regExpLexer.lexRegExp(property);		
			regexpAdapter = automatonAdapterFactory.createFromRegexp(tokens);
			specification.setParsed(regexpAdapter.getParsedDefinition());
		} catch(LexicalException e) {
			throw new SpecificationException(specification.toString()+": "+e.getMessage(), e.getCause());
		} catch (RegularExpressionException e) {
			throw new SpecificationException(specification.toString()+": "+e.getMessage(), e.getCause());
		}
		
		// replace named propositions:
		NamedPropositionExpanderVisitor propositionVisitor = new NamedPropositionExpanderVisitor(specification, propFactory.getPropositionNodesByType(sourceType));
		for(Entry<LexicalToken, BooleanExpression> entry : regexpAdapter.getNodeMap().entrySet()) {
			BooleanExpression node = entry.getValue();
			try {
				new PropositionalSemanticAnalysisVisitor(node);
			} catch (SemanticException e) {
				throw new SpecificationException(name+": "+e.getMessage(), e.getCause());
			}
			node = node.accept(propositionVisitor);
			if(propositionVisitor.getUndefined().size() > 0) {
				String errors = name+"Following propositions are undefined:\n";
				for(PropositionNode prop : propositionVisitor.getUndefined()) {
					errors += prop.getProposition();
				}
				throw new SpecificationException(errors);
			}
			regexpAdapter.mapToken(entry.getKey(), node);
		}
		
		specification.setAdapter(regexpAdapter);
		automatonAdapterFactory.createAutomatonFromRegexp(regexpAdapter);
		specification.setInternal(regexpAdapter.getInternalDefinition());
		try {
			specification.setAutomaton(automataFactory.generateAutomaton(regexpAdapter));
		} catch (GuardedTransitionAutomatonException e) {
			throw new SpecificationException(e.getMessage());
		}
		
		if(regexpSpecifications.get(sourceType) == null) {
			regexpSpecifications.put(sourceType,
					new Hashtable<String, BricsAutomatonSpecification>());
		}
		regexpSpecifications.get(sourceType).put(name, specification);

		if (specifications.get(sourceType) == null) {
			specifications.put(sourceType, new Hashtable<String,Specification>());
		}
		specifications.get(sourceType).put(name, specification);	
	}

	private void initNfaSpecification(BricsAutomatonSpecification specification)
	throws SpecificationException {
		String name = specification.getName();
		String property = specification.getDeclared();
		Source sourceType = specification.getSourceType();
		
		AutomatonParser parser = new AutomatonParser(new AutomatonLexer(
				new StringReader(property)));
		
		checkDuplicateSpecification(sourceType, name);

		parser.setErrorReporter(new ErrorReporter(name, property));
		
		AutomatonDefinition definition;
		try {
			definition = (AutomatonDefinition)parser.parse().value;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SpecificationException(e.toString()+"\n  while parsing "+
					sourceType.getSimpleName()+" automaton.");
		}

		// replace named propositions:
		for (StateInfo state : definition.getStates())
			for (int i=0; i<state.getNumBranches(); i++) {
				NamedPropositionExpanderVisitor expander = 
					new NamedPropositionExpanderVisitor(specification,
							propFactory.getPropositionNodesByType(sourceType));
				state.setExpandedCondition(i, state.getCondition(i).accept(expander));
			}

		// construct AutomatonAdapter
		AutomatonAdapter adapter = automatonAdapterFactory.createFromAutomaton(definition);
		specification.setAdapter(adapter);
		specification.setParsed(definition.prettyPrint());
		try {
			automatonAdapterFactory.createAutomatonFromAutomatonDefinition(
					adapter, definition);
		} catch (AutomatonException e) {
			throw new SpecificationException(e.getMessage());
		}
		specification.setInternal(adapter.getInternalDefinition());
		
		try {
			specification.setAutomaton(automataFactory.generateAutomaton(adapter));
		} catch (GuardedTransitionAutomatonException e) {
			throw new SpecificationException(e.getMessage());
		}
		
		if(nfaSpecifications.get(sourceType) == null) {
			nfaSpecifications.put(sourceType,
					new Hashtable<String, BricsAutomatonSpecification>());
		}
		nfaSpecifications.get(sourceType).put(name, specification);

		if (specifications.get(sourceType) == null) {
			specifications.put(sourceType, new Hashtable<String,Specification>());
		}
		specifications.get(sourceType).put(name, specification);	
	}
	
	private void checkDuplicateSpecification(Source sourceType, String name) throws
		SpecificationException {
		if((regexpSpecifications.get(sourceType) != null && 
				regexpSpecifications.get(sourceType).get(name) != null) ||
			(pltlSpecifications.get(sourceType) != null &&
					pltlSpecifications.get(sourceType).get(name) != null)) {
			throw new SpecificationException(name+": duplicate specification.");
		}
	}
}
