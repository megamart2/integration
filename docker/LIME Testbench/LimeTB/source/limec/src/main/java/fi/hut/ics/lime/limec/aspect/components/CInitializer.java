package fi.hut.ics.lime.limec.aspect.components;

/**
 * Contains the generated AspeCt-oriented C code to initialize the aspect. 
 * @author lharpf
 */
public class CInitializer {
	private String name, code;
	public CInitializer() {
		// Have to include <stddef.h>; otherwise size_t doesn't work. This
		// include, among other includes, is done in ACCAspectFactory.java
		code = "";
		
		// Prototypes of the helper functions (not really necessary)
		//code += "static char * lime_concatenate(char *, const char *);\n";
		//code += "static size_t lime_strlen(char *);\n\n";
		
		// A helper function to avoid including string.h 
		code += "/* A helper function added by CInitializer */\n";
		code += "static size_t lime_strlen(char *str) {\n";
		code += "    size_t rv;\n";
		code += "    for(rv = 0; str[rv]; rv++);\n";
		code += "    return rv;\n";
		code += "}\n\n";
		
		// A helper function to avoid including string.h
		code += "/* A helper function added by CInitializer */\n";
		code += "static char * lime_concatenate(char *dest, const char *src) {\n";
		code += "    size_t dest_len = lime_strlen(dest);\n";
		code += "    size_t i;\n\n"; 
		code += "    for (i = 0 ; src[i] != '\\0' ; i++) {\n";
		code += "        dest[dest_len + i] = src[i];\n";
		code += "    }\n";
		code += "    dest[dest_len + i] = '\\0';\n\n";
		code += "    return dest;\n";
		code += "}\n\n";
		
		// The method for changing instances.
		code += "/* instance changing method */\n";
		code += "static void lime_changeinstance(unsigned long id) {\n";
		code += "    if (!lime_root) {\n";
		code += "        printf(\"ERROR: Observer not created, exiting.\\n\");\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    lime_instance_t *tmp = lime_findinstance(id);\n";
		code += "    if (!tmp) {\n";
		code += "        printf(\"ERROR: Observer instance (id: %lu) not found, exiting.\\n\", id);\n";
		code += "        exit(1);\n";
		code += "    }\n";
		code += "    lime_state = &(tmp->state);\n";
		code += "}\n\n";
		
		name = "DefaultCInitializer";
	}
	
	/**
	 * Get the body of the aspect initializer.
	 * 
	 * @return the body of the aspect initializer as a string
	 */ 
	public String getCode() {
		return code;
	}

	/**
	 * Get the name of the aspect.
	 * 
	 * @return the name of the aspect
	 */
	public String getName() {
		return name;
	}

	/**
	 * Set the body of the aspect initializer.
	 * 
	 * @param code the body of the aspect initializer as a string of 
	 * AspeCt-oriented C code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * Set the name of the aspect
	 * 
	 * @param name the new name of the aspect
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Append code to the end of the initializer body.
	 *  
	 * @param code C code to execute
	 */
	public void addCode(String code) {
		this.code += code;
	}
	
	/**
	 * Append code to the beginning of the initializer body.
	 * 
	 * @param code C code to execute
	 */
	public void addCodeToBeginning(String code) {
		this.code = code + this.code;
	}
	
	/**
	 * Get a AspeCt-oriented C code block for the initializer definition.
	 */
	@Override
	public String toString() {
		return code+"\n";
	}
}
