/**
 * An utility class used by the classes in fi.hut.ics.lime.limec.xmlreaders
 * package. This class takes a Node (which represents an XML tag) and
 * creates a new CMethod (an object representing a C function) from the
 * information contained in the Node.
 * 
 * @author lharpf
 */
package fi.hut.ics.lime.limec.xmlreaders.generators;

import java.util.ArrayList;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import fi.hut.ics.lime.common.sourcecode.Method;
import fi.hut.ics.lime.common.sourcecode.Parameter;
import fi.hut.ics.lime.common.sourcecode.Visibility;
import fi.hut.ics.lime.limec.sourcecode.CMethod;
import fi.hut.ics.lime.limec.sourcecode.CParameter;
import fi.hut.ics.lime.limec.sourcecode.CSource;

public class CMethodGenerator {

    /** 
     * Creates a new CMethod object based on the data in the node given
     * as a parameter. Associates the new CMethod with the C source file
     * cSource.
     *  
     * @param functionNode The node that contains a memberdef describing a
     *        function
     * @param cSource The C source file this function belongs to 
     */
    public static void createFunction(Node functionNode, CSource cSource) {
        
        NamedNodeMap aNodeAttr = functionNode.getAttributes();
        
        // Let's store the function. Placeholders for the information
        // required to create a new CMethod (which represents a function).
        String funcName = null;
        String funcReturnType = null;
        ArrayList<Node> funcISLNodes = new ArrayList<Node>();
        ArrayList<Parameter> parameters = new ArrayList<Parameter>();
        
        Visibility funcIsStatic = null;
        boolean funcIsInline = false;
        
        // Check whether this is a static function or not
        Node funcStatic = aNodeAttr.getNamedItem("static");
        
        if (funcStatic.getNodeValue().equals("yes")) {
            funcIsStatic = Visibility.STATIC;
        } else {
            funcIsStatic = Visibility.NONSTATIC;
        }
        
        // Check whether this is an inline function or not
        Node funcInline = aNodeAttr.getNamedItem("inline");

        if (funcInline.getNodeValue().equals("yes")) {
            funcIsInline = true;
        } else {
            funcIsInline = false;
        }
        
        // Get the rest of the information regarding the function
        NodeList funcDetails = functionNode.getChildNodes();
            
        for (int j = 0; j < funcDetails.getLength(); j++) {
            Node attributeNode = funcDetails.item(j);

            if (attributeNode.getNodeName().equals("type")) {
                // Store return type
                assert funcReturnType == null : "Double return type " +
                                                "definition for function.";
                funcReturnType = attributeNode.getTextContent();
            } else if (attributeNode.getNodeName().equals("name")) {
                // Store name
                assert funcName == null : "Double name definition for function.";
                funcName = attributeNode.getTextContent();
            } else if (attributeNode.getNodeName().equals("detaileddescription")) {
                // Store the raw ISL of the function. All ISL related to the
                // function is in the para subtag of the detaileddescription tag
                NodeList paramNodes = attributeNode.getChildNodes();
                
                for(int k = 0; k < paramNodes.getLength(); k++) {
                    Node para = paramNodes.item(k);
                    
                    if (para.getNodeName().equals("para")) {
                        // Store the ISL string to be associated with this function.
                        funcISLNodes.add(para);
                        //System.out.println(para.getTextContent() + "\n");
                    }
                    
                }
                
            } else if (attributeNode.getNodeName().equals("param")) {       
                // Let's attempt to create the parameter. If it is "void",
                // we'll get from createCParameter - otherwise, we'll get
                // a C parameter object
                Parameter cParameter = createCParameter(attributeNode);
                
                if (cParameter != null) { 
                    parameters.add(cParameter);
                }
                
            }
                
        }
        
        // Create the new function from the information gathered and associate
        // it with the C source file cSource.
        Method tempFunction = new CMethod(cSource, funcName, 
                funcReturnType, parameters, funcIsStatic, funcIsInline);
        
        // If the function was associated with ISL, create the 
        // ISL and associate it with the function.
        for(Node funcISLNode : funcISLNodes) {
            ISLGenerator.createISL(funcISLNode, (CMethod)tempFunction);
        }
        
        cSource.addMethod(tempFunction);
        
    }
    
    /**
     * Creates a new CParameter object (which represents a formal parameter
     * of a function) based on the XML information passed to the function.
     * This method is only supposed to be invoked with a Node that
     * represents a Doxygen param tag associated with a function. 
     * 
     * @param attributeNode a Node representing a doxygen param tag
     * @return the new Parameter created based on the XML information,
     *         or null if the XML represents a parameter of type void
     *         (indicating "this function does not take parameters")
     */
    private static Parameter createCParameter(Node attributeNode) {
        
        assert attributeNode.getNodeName().equals("param") : 
            "createCParameter is only supposed to be invoked with an " +
            "attributeNode representing a param tag.";
        
        // Get parameter details and store them
        NodeList paramNodes = attributeNode.getChildNodes();
        
        // Temporarily store the information regarding this parameter
        // into variables that are then fed to the CParameter
        // constructor.
        String paramDefName = null;
        String paramDeclName = null;
        String paramType = null;
        String paramRef = null;
        boolean paramIsArray = false;
        
        for (int k = 0; k < paramNodes.getLength(); k++) {
            
            Node paramAttribute = paramNodes.item(k);
        
            /* 
             * declname contains the name of the parameter as
             * specified in the declaration of the function.
             * 
             * defname contains the name of the parameter as
             * specified in the definition of the function.
             * 
             * This can get tricky; if we have a parameter X of type 
             * "union aSimpleUnion", defname may contain
             * 'aSimpleUnion' or 'X' depending on the situation. 
             */
            
            if (paramAttribute.getNodeName().equals("declname")) {
                paramDeclName = paramAttribute.getTextContent();
            } if (paramAttribute.getNodeName().equals("defname")) {
                paramDefName = paramAttribute.getTextContent();
            } else if(paramAttribute.getNodeName().equals("type")) {
                
                if (paramAttribute.getTextContent().equals("void")) {
                    // This is a parameter of type void, which means
                    // it is actually not a true parameter at all. */
                    return null;
                } else if (paramAttribute.getTextContent().equals("...")) {
                	
                    // This is a special parameter type that indicates a
                    // function with a variable length argument list.
                	
                    // AspeCt-oriented C does not support this functionality
                    // yet; let's print out a warning and ignore the parameter. */
                    
                    // TODO once AspeCt-oriented C starts supporting functions
                    // with variable-length argument lists, add functionality
                    // here
                    
                    String warningMsg =
                        "WARNING: Source file contains functions that have " +
                        "variable-length parameter lists (e. g. void myFunc " +
                        "int j, ...).\n\n" +
                        
                        "Support for these functions is missing; the aspect " +
                        "generated may not work properly.\n";
                    
                    System.out.println(warningMsg);
                    return null;
                    
                }
                
                // Store the type of the parameter, which is not "void"
                // (i.e. this is actually a parameter)
                
                paramType = paramAttribute.getTextContent();
                // The ref tag of the type tag may contain more details
                // about the type, so we'll want it too
                NodeList typeSubTags = paramAttribute.getChildNodes();

                // TODO: remove this if found irrelevant, make sure it works
                // before removing it though
                
                /*for (int l = 0; l < typeSubTags.getLength(); l++) {
                    Node possibleRefTag = typeSubTags.item(l);
                
                    if (possibleRefTag.getNodeName().equals("ref")) {
                        assert paramRef == null : "Two or more ref " +
                            "tags within a type tag, unknown Doxygen" +
                            " syntax.";
                        paramRef = possibleRefTag.getTextContent();
                    }
                }*/
                
                
            } else if(paramAttribute.getNodeName().equals("array")) {
                // Store whether the parameter is an array or not
                paramIsArray = true;
            }
            
        }
        
        // Create the new parameter and add it to the list of parameters 
        // for this function */
        String paramName = null;
        
        // Set the type of this parameter
        if (paramRef != null) {
            // paramRef contains the entire type or further details 
            // about it; paramDefName contains parameter name
            if (paramType != null && !paramType.equals(paramRef)) {
                paramType += " " + paramRef;
            } else {
                // If paramType and paramRef are exact matches, we
                // just ignore paramType; the type probably only 
                // contains the ref tag
                paramType = paramRef;
            }
            
            assert paramDefName != null : "Encountered a type ref" +
            " tag, but no defname tag was found. Unknown doxygen" +
            " syntax.";
            
            paramName = paramDefName; 
        } else if (paramType.equals("struct") || 
                   paramType.equals("union")){
        	
            // TODO when the Doxygen bug 545503 is fixed, this might
            // have to be modified
            
            // Union or struct, but no additional information in 
            // paramDeclName might contain further details about the type;
            // paramDefName contains parameter name
        	
            if (paramDeclName != null) {
                paramType += " " + paramDeclName;
            }
            
            assert paramDefName != null : "Encountered a struct or" +
            " union without a ref tag. No defname tag was found." + 
            " Unknown doxygen syntax.";
            
            paramName = paramDefName; 
        } else {
            // Not union or struct; let's take paramDefName as the
            // name if it exists; otherwise, let's settle for
            // paramDeclName
            if (paramDefName != null) {
                paramName = paramDefName; 
            } else {
                paramName = paramDeclName;
            }
        }
        
        
        Parameter tempParam = new CParameter(paramName, paramType, 
                                             paramIsArray);
        
        return tempParam;
    }
    
}
