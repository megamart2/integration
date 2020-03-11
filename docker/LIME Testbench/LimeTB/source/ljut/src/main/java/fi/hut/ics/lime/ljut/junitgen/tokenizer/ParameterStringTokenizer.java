package fi.hut.ics.lime.ljut.junitgen.tokenizer;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import fi.hut.ics.lime.ljut.Debug;

/**
 * Implements tokenizing testing parameter strings.
 * 
 * @author osaariki
 */
public class ParameterStringTokenizer {

	private static final Pattern VALUE = Pattern.compile("(-?\\d+)|(true|false)|(.)");
	private static final Pattern OBJECT = Pattern.compile("o\\d+=o\\d+");
	private static final Pattern ASSIGNMENT = Pattern.compile("o\\d+\\.([\\p{Alpha}_\\$][\\p{Alpha}_\\$\\d]*)="
			+ "((o\\d+)|(-?\\d+)|(true|false))");

	private ParameterStringTokenizer() {
	}

	/**
	 * Tokenizes one line in a testing parameters file.
	 * 
	 * @param parameterString the parameter string.
	 * @return a list of tokens identified from the testing parameter string.
	 * @throws TokenizingException if invalid or unidentified tokens are encountered.
	 */
	public static List<Token> tokenize(String parameterString) throws TokenizingException {
		List<Token> tokens = new ArrayList<Token>();

		String[] lexemes = parameterString.split(" ");

		for (String lexeme : lexemes) {
			if (VALUE.matcher(lexeme).matches()) {
				Debug.printDetail("Value token read: " + lexeme);
				tokens.add(new ValueToken(lexeme));
			} else if (OBJECT.matcher(lexeme).matches()) {
				Debug.printDetail("Object token read: " + lexeme);
				String[] subLexemes = lexeme.split("=");
				// This check may be a bit redundant as the regex already ensures this
				if (subLexemes.length != 2)
					throw new TokenizingException("Invalid object token encountered: " + lexeme);
				String left = subLexemes[0];
				String right = subLexemes[1];
				tokens.add(new ObjectToken(left, right));
			} else if (ASSIGNMENT.matcher(lexeme).matches()) {
				Debug.printDetail("Assignment token read: " + lexeme);
				String[] subLexemes = lexeme.split("\\.|=");
				// This check may be a bit redundant as the regex already ensures this
				if (subLexemes.length != 3)
					throw new TokenizingException("Invalid assignment token encountered: " + lexeme);
				String left = subLexemes[0];
				String field = subLexemes[1];
				String right = subLexemes[2];
				tokens.add(new AssignmentToken(left, field, right));
			} else {
				throw new TokenizingException("Unidentified token encountered: " + lexeme);
			}
		}

		return tokens;
	}
}
