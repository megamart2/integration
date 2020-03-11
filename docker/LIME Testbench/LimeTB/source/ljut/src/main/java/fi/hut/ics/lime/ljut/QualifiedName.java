package fi.hut.ics.lime.ljut;

/**
 * Parses qualified class names. This class overrides {@link Object#toString()} for getting the fully qualified name.
 * 
 * @author osaariki
 */
public class QualifiedName {

	/**
	 * Initializes a new instance with the given package and class names. A package name of <code>null</code> indicates
	 * the default package.
	 * 
	 * @param packageName
	 *            a package name (e.g. java.lang) or <code>null</code>.
	 * @param className
	 *            a class name.
	 */
	public QualifiedName(String packageName, String className) {
		this.packageName = packageName;
		this.className = className;
	}

	/**
	 * Parses a fully qualified name (e.g. java.lang.String) into a {@link QualifiedName} instance.
	 * 
	 * @param name
	 *            the name to parse.
	 * @return the QualifiedName instance.
	 * @throws SignatureParsingException
	 *             if the supplied name is not a valid qualified name.
	 */
	public static QualifiedName parseQualifiedName(String name) throws SignatureParsingException {
		if (SignatureUtils.QUALIFIED_NAME.matcher(name).matches()) {
			String[] substrings = name.split("\\.");

			String className = substrings[substrings.length - 1];

			String packageName = null;
			if (substrings.length > 1) {
				StringBuilder sb = new StringBuilder();
				sb.append(substrings[0]);
				for (int i = 1; i < substrings.length - 1; ++i) {
					sb.append(".").append(substrings[i]);
				}
				packageName = sb.toString();
			}

			return new QualifiedName(packageName, className);
		} else
			throw new SignatureParsingException("Invalid qualified class name: " + name);
	}

	/**
	 * @return the package name or <code>null</code> for the default package.
	 */
	public String getPackageName() {
		return packageName;
	}

	/**
	 * @return the class name.
	 */
	public String getClassName() {
		return className;
	}

	@Override
	public String toString() {
		return packageName + "." + className;
	}

	private String packageName, className;
}
