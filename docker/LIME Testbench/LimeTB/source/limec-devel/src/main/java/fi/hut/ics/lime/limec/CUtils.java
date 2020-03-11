package fi.hut.ics.lime.limec;

import java.util.List;

import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.limec.aspect.components.CAspectMethod;
import fi.hut.ics.lime.limec.aspect.components.CAspectVariable;

public class CUtils {
	
	private static final String PRINTF = "_LIME_print";
	
	public static boolean verbose = true;
	public static int obslimit = -1;
	public static int errorexit = -1;
	public static int violationexit = -1;
	
	public static String printError(String message, String shortmessage) {
		StringBuilder code = new StringBuilder();
		if (verbose) {
			code.append(PRINTF+"(\""+message+"\");\n");
		}
		else {
			code.append(PRINTF+"(\""+shortmessage+"\");\n");
		}
		if (errorexit > 0) {
			code.append("exit("+errorexit+");\n");
		}
		else {
			code.append("lime_enabled = 0;\n");
		}
		return code.toString();
	}
	
	public static String getEnabledCheck() {
		return "if (!lime_enabled)\nreturn;\n";
	}
	
	public static String getObserverStruct(List<CAspectVariable> statevariables) {
		StringBuilder code = new StringBuilder();
		code.append("typedef struct lime_observer {\n");
		code.append("unsigned long id;\n");
		for (CAspectVariable var : statevariables) {
			code.append(var.getType()+" "+var.getName()+";\n");
		}
		if (obslimit > 0) {
			code.append("char reserved;\n");
		}
		else {
			code.append("struct lime_observer *next;\n");
		}
		code.append("} lime_observer_t;\n");
		if (obslimit > 0) {
			code.append("lime_observer_t lime_observers["+obslimit+"];\n");
			code.append("static int lime_obscount = 0;\n");
			code.append("static char lime_obsinit = 0;\n");
		}
		else {
			code.append("static lime_observer_t *lime_root = 0;\n");
		}
		code.append("\n");
		return code.toString();
	}
	
	public static String getObserverInitializer(List<CAspectVariable> statevariables) {
		StringBuilder code = new StringBuilder();
		code.append("static void lime_init_obs(lime_observer_t *obs, unsigned long id) {\n");
		code.append("    obs->id = id;\n");
		for (CAspectVariable var : statevariables) {
			if (var.getValue() != null)
				code.append("    obs->"+var.getName()+" = "+var.getValue()+";\n");
		}
		if (obslimit > 0) {
			code.append("    obs->reserved = 1;\n");
		}
		else {
			code.append("    obs->next = 0;\n");
		}
		code.append("}\n\n");
		return code.toString();
	}
	
	public static CAspectMethod getObserverChangeMethod(String specname) {
		CAspectMethod method = new CAspectMethod("lime_change_obs", Visibility.STATIC);
		method.addArgument("unsigned long id");
		method.setReturnType("int");
		method.addEnd(getEnabledCheck());
		if (obslimit > 0) {
			method.addEnd("    int i = 0;\n");
			method.addEnd("    while (i < "+obslimit+") {\n");
			method.addEnd("        if (lime_observers[i].reserved && lime_observers[i].id == id) {\n");
			method.addEnd("            lime_obs = &lime_observers[i];\n");
		}
		else {
			method.addEnd("    lime_observer_t *tmp = lime_root;\n");
			method.addEnd("    while (tmp) {\n");
			method.addEnd("        if (tmp->id == id) {\n");
			method.addEnd("            lime_obs = tmp;\n");
		}
		method.addEnd("            return 1;\n");
		method.addEnd("        }\n");
		if (obslimit > 0) {
			method.addEnd("        i++;\n");
		}
		else {
			method.addEnd("        tmp = tmp->next;\n");
		}
		method.addEnd("    }\n");
		method.addEnd(printError(
				specname+" ERROR: tried to use an observer with id that does not exist\\n", 
				specname+": obs change failed: not found\\n"));
		method.addEnd("return 0;\n");
		return method;
	}
	
	public static CAspectMethod getCreateObserverMethod(String specname) {
		CAspectMethod method = new CAspectMethod(specname+"_lime_create_obs", Visibility.NONSTATIC);
		method.addArgument("unsigned long id");
		method.addEnd(getEnabledCheck());
		if (obslimit > 0) {
			// if no observer has been created yet, initialize the array
			method.addEnd("    int i = 0;\n");
			method.addEnd("    if (!lime_obsinit) {\n");
			method.addEnd("        while (i < "+obslimit+") {\n");
			method.addEnd("            lime_observers[i].reserved = 0;\n");
			method.addEnd("            i++;\n");
			method.addEnd("        }\n");
			method.addEnd("        lime_obsinit = 1;\n");
			method.addEnd("    }\n");
			// first check that observer with same id doesn't exist
			method.addEnd("    i = 0;\n");
			method.addEnd("    while (i < "+obslimit+") {\n");
			method.addEnd("        if (lime_observers[i].reserved && lime_observers[i].id == id) {\n");
			method.addEnd(printError(
					specname+" ERROR: tried to create an observer with id that is already in use\\n", 
					specname+": obs create failed: id\\n"));
			method.addEnd("return;\n");
			method.addEnd("        }\n");
			method.addEnd("        i++;\n");
			method.addEnd("    }\n");
			// then create a new observer to the first free spot
			method.addEnd("    i = 0;\n");
			method.addEnd("    while (i < "+obslimit+") {\n");
			method.addEnd("        if (!lime_observers[i].reserved) {\n");
			method.addEnd("            lime_init_obs(&lime_observers[i], id);\n");
			method.addEnd("            lime_obs = &lime_observers[i];\n");
			method.addEnd("            return;\n");
			method.addEnd("        }\n");
			method.addEnd("        i++;\n");
			method.addEnd("    }\n");
			method.addEnd(printError(
					specname+" ERROR: tried to create an observer but observer limit was reached\\n", 
					specname+": obs create failed: limit\\n"));
			method.addEnd("return;\n");
		}
		else {
			method.addEnd("    lime_observer_t *tmp = lime_root;\n");
			method.addEnd("    lime_observer_t *prev = 0;\n");
			method.addEnd("    while(tmp) {\n");
			method.addEnd("        if (tmp->id == id) {\n");
			method.addEnd(printError(
					specname+" ERROR: tried to create an observer with id that is already in use\\n", 
					specname+": obs create failed: id\\n"));
			method.addEnd("return;\n");
			method.addEnd("        }\n");
			method.addEnd("        prev = tmp;\n");
			method.addEnd("        tmp = tmp->next;\n");
			method.addEnd("    }\n");
			method.addEnd("    tmp = malloc(sizeof(lime_observer_t));\n");
			method.addEnd("    if (!tmp) {\n");
			method.addEnd(printError(
					specname+" ERROR: tried to create an observer but memory could not be allocated\\n", 
					specname+": obs create failed: malloc\\n"));
			method.addEnd("return;\n");
			method.addEnd("    }\n");
			method.addEnd("    lime_init_obs(tmp, id);\n");
			// if no observer has been created yet, create a new one as the root observer
			method.addEnd("    if (!prev) {\n");
			method.addEnd("        lime_root = tmp;\n");
			// else create the new one as the next one in the list
			method.addEnd("    } else {\n");
			method.addEnd("        prev->next = tmp;\n");
			method.addEnd("    }\n");
			// always default to the most recently created observer
			method.addEnd("    lime_obs = tmp;\n");
		}
		return method;
	}
	
	public static CAspectMethod getFreeObserverMethod(String specname) {
		CAspectMethod method = new CAspectMethod(specname+"_lime_free_obs", Visibility.NONSTATIC);
		method.addArgument("unsigned long id");
		method.addEnd(getEnabledCheck());
		if (obslimit > 0) {
			method.addEnd("    int i = 0;\n");
			method.addEnd("    while (i < "+obslimit+") {\n");
			method.addEnd("        if (lime_observers[i].reserved && lime_observers[i].id == id) {\n");
			method.addEnd("            lime_observers[i].reserved = 0;\n");
			// update lime_obs to point to some observer, unless the deleted one
			// was the last
			method.addEnd("            lime_obs = 0;\n");
			method.addEnd("            i = 0;\n");
			method.addEnd("            while (i < "+obslimit+") {\n");
			method.addEnd("                if (lime_observers[i].reserved) {;\n");
			method.addEnd("                    lime_obs = &lime_observers[i];\n");
			method.addEnd("                }\n");
			method.addEnd("                i++;\n");
			method.addEnd("            }\n");
			method.addEnd("            return;\n");
			method.addEnd("        }\n");
			method.addEnd("        i++;\n");
			method.addEnd("    }\n");
		}
		else {
			method.addEnd("    lime_observer_t *tmp = lime_root;\n");
			method.addEnd("    lime_observer_t *prev = 0;\n");
			method.addEnd("    while(tmp) {\n");
			// if we find the observer we are looking for, free it and update the pointers accordingly
			method.addEnd("        if (tmp->id == id) {\n");
			method.addEnd("            if (!prev) {\n");
			method.addEnd("                lime_root = tmp->next;\n");
			method.addEnd("                lime_obs = tmp->next;\n");
			method.addEnd("            } else {\n");
			method.addEnd("                prev->next = tmp->next;\n");
			method.addEnd("                lime_obs = prev;\n");
			method.addEnd("            }\n");
			method.addEnd("            free(tmp);\n");
			method.addEnd("            return;\n");
			method.addEnd("        }\n");
			method.addEnd("        prev = tmp;\n");
			method.addEnd("        tmp = tmp->next;\n");
			method.addEnd("    }\n");
		}
		method.addEnd(printError(
				specname+" ERROR: tried to free an observer with id that is not in use\\n", 
				specname+": obs free failed: id\\n"));
		method.addEnd("return;\n");
		return method;
	}
	
	public static String createObserverSanityCheck(String specname) {
		StringBuilder code = new StringBuilder();
		code.append("/* sanity check to make sure observer is created before it is used */\n");
		code.append("if (!lime_enabled) {\n");
		code.append("    // just continue to proceed()\n");
		code.append("} else if (!lime_obs) {\n");
		code.append(printError(
				specname+" ERROR: tried to use an observer that does not exist\\n", 
				specname+": obs does not exist\\n"));
		code.append("} else {\n");
		return code.toString();
	}
	
	public static CAspectMethod createViolationMethod(String specname) {
		CAspectMethod method = new CAspectMethod("lime_violation", Visibility.STATIC);
		method.setReturnType("void");
		method.addArgument("char *method");
		method.addArgument("char *caller");
		if (verbose) {
			method.addEnd(PRINTF+"(\"SPECIFICATION VIOLATION: "+specname+" violated in \");\n");
			method.addEnd(PRINTF+"(method);\n");
			method.addEnd(PRINTF+"(\" called from \");\n");
			method.addEnd(PRINTF+"(caller);\n");
			method.addEnd(PRINTF+"(\"\\n\");\n");
		}
		else {
			method.addEnd(PRINTF+"(\""+specname+" violation in \");\n");
			method.addEnd(PRINTF+"(method);\n");
			method.addEnd(PRINTF+"(\" from \");\n");
			method.addEnd(PRINTF+"(caller);\n");
			method.addEnd(PRINTF+"(\"\\n\");\n");
		}
		if (violationexit > 0) {
			method.addEnd("exit("+violationexit+");\n");
		}
		else {
			method.addEnd("lime_enabled = 0;\n");
		}
		return method;
	}
	
}
