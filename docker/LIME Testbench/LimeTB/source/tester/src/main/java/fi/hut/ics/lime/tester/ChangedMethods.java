package fi.hut.ics.lime.tester;

import japa.parser.JavaParser;
import japa.parser.ParseException;
import japa.parser.ast.CompilationUnit;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import soot.Body;
import soot.BodyTransformer;
import soot.PackManager;
import soot.Scene;
import soot.SceneTransformer;
import soot.SootClass;
import soot.SootMethod;
import soot.Transform;
import soot.Unit;
import soot.jimple.JimpleBody;
import soot.tagkit.LineNumberTag;
import difflib.Delta;
import difflib.DiffUtils;
import difflib.Patch;
import difflib.UnifiedDiff;

public class ChangedMethods {
	
	/**
	 * @param args
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws IOException, ParseException {
			
		HashSet<String> changed_method_signatures = new HashSet<String>();
		AppTransformer app_transformer = new AppTransformer(changed_method_signatures);
		
		HashMap<String, TreeSet<Integer>> original_files2check = new HashMap<String, TreeSet<Integer>>();
		HashMap<String, TreeSet<Integer>> revised_files2check = new HashMap<String, TreeSet<Integer>>();
				
		for (UnifiedDiff unifieddiff : DiffUtils.splitUnifiedDiff(ChangedMethods.fileToLines(args[0]))) {
			Patch patch = DiffUtils.parseUnifiedDiff(unifieddiff.getLines());
			
			TreeSet<Integer> added_lines = new TreeSet<Integer>();
			TreeSet<Integer> changed_lines = new TreeSet<Integer>();
			
			for (Delta delta : patch.getDeltas()) {
				if(delta.getType() == Delta.TYPE.INSERT) {
					for(int i = 0; i < delta.getRevised().size(); i++) {
						added_lines.add(delta.getRevised().getPosition() + i + 1); // index + 1 = line number
					}
				}
				else { // CHANGE or DELETE
					for(int i = 0; i < delta.getOriginal().size(); i++) {
						changed_lines.add(delta.getOriginal().getPosition() + i + 1);
					}
				}
			}
			
			if(!added_lines.isEmpty()) {
				File file = new File(unifieddiff.getOriginalFilename());
				if(file.exists()) { // don't check new files for changed methods
					revised_files2check.put(unifieddiff.getRevisedFilename(), added_lines);
				}
			}
			if(!changed_lines.isEmpty()) {
				original_files2check.put(unifieddiff.getOriginalFilename(), changed_lines);
			}		
			
		}
				
		
		if(!original_files2check.isEmpty()) {
		
			app_transformer.setClass2LinesMap(original_files2check);
				
			soot.G.reset();
			PackManager.v().getPack("wjtp").add(new Transform("wjtp.app_transformer", app_transformer));
			soot.Main.main(getSootParameters(original_files2check.keySet(), System.getenv("ORIGINAL_CLASSPATH")));
			
		}
		if(!revised_files2check.isEmpty()) {
				
			app_transformer.setClass2LinesMap(revised_files2check);
						
			soot.G.reset();
			PackManager.v().getPack("wjtp").add(new Transform("wjtp.app_transformer", app_transformer));
			soot.Main.main(getSootParameters(revised_files2check.keySet(), System.getenv("REVISED_CLASSPATH")));
		}
	
		
		try{
			
			  FileWriter fstream = new FileWriter(args[1]);
			  BufferedWriter out = new BufferedWriter(fstream);
			  Iterator<String> line_iterator = changed_method_signatures.iterator();
			  while(line_iterator.hasNext()) {
				  String line = line_iterator.next();
				  out.write(line+System.getProperty("line.separator"));
			  }
			  out.close();
		}
		catch (Exception e) {
			  System.err.println("Error: " + e.getMessage());
		}
		
	}
	
	private static String[] getSootParameters(Set<String> java_files, String lib_classpath) throws ParseException, IOException {
		ArrayList<String> soot_args = new ArrayList<String>();
		soot_args.add("-f");
		soot_args.add("none");	
		soot_args.add("-p");
		soot_args.add("cg");
		soot_args.add("enabled:false");
		soot_args.add("-w");
		soot_args.add("-keep-line-number");
		soot_args.add("-pp");	
		soot_args.add("-cp");
		
		ArrayList<String> class_list = new ArrayList<String>();
		ArrayList<String> class_path = new ArrayList<String>();
		String soot_class_path = "";
		
		for(String input_file : java_files) {
		
			String parts[] = parsePathPackageClassName(input_file);
			
			if(!class_path.contains(parts[0])) {
				class_path.add(parts[0]);
			}
		
			class_list.add(parts[1]);
		}
		
		Iterator<String> class_path_iterator = class_path.iterator();
		while(class_path_iterator.hasNext()) {
			soot_class_path += class_path_iterator.next()+":";
		}
		
		if(lib_classpath != null) {
			soot_class_path += lib_classpath+":";
		}
		 		
		soot_class_path = soot_class_path.substring(0,soot_class_path.length()-1);
		soot_args.add(soot_class_path);
		soot_args.addAll(class_list);
		
		System.out.println(Arrays.toString(soot_args.toArray()));
		
		return soot_args.toArray(new String[0]);
	}
	
	private static String[] parsePathPackageClassName(String filename) throws ParseException, IOException {
		
		String result[] = new String[3];
		
		//System.out.println("Parsing file: "+filename);
		
		FileInputStream in = new FileInputStream(filename);
		CompilationUnit cu;
	    try {
	        cu = JavaParser.parse(in);
	    } finally {
	    	in.close();
	    }
	    
	    String package_name = null;
	    
	    if(cu.getPackage() != null) {
	    	package_name = cu.getPackage().getName().toString();
	    }
	  	//System.out.println("Package is: "+package_name);
				
		int postfix_start = filename.lastIndexOf(".");
		int filename_start = filename.lastIndexOf("/")+1;
		String class_name = filename.substring(filename_start, postfix_start);
		
		String class_qname = class_name;
		if(package_name != null) class_qname = package_name+"."+class_qname;
		
		result[1] = class_qname;
		
		int path_end = filename.indexOf((class_qname).replace('.', '/'));
		result[0] = filename.substring(0,path_end);
				
		return result;
	}

	private static class AppTransformer extends SceneTransformer {
		HashMap<String, TreeSet<Integer>> class2lines_map = new HashMap<String, TreeSet<Integer>>();
		HashSet<String> changed_method_signatures;		
		
		public AppTransformer(HashSet<String> changedMethodSignatures) {
			this.changed_method_signatures = changedMethodSignatures;
		}

		public void setClass2LinesMap(HashMap<String, TreeSet<Integer>> file2lines_map) throws ParseException, IOException {
			for(String filename : file2lines_map.keySet()) {
				String parts[] = parsePathPackageClassName(filename);
				this.class2lines_map.put(parts[1], file2lines_map.get(filename));
			}
		}
		
		@Override
		protected void internalTransform(String phaseName, Map options) {
			
			TreeSet<Integer> interesting_lines;
			
			Iterator<SootClass> classes = Scene.v().getApplicationClasses().iterator();
						
			while (classes.hasNext()) {
	            SootClass theClass = (SootClass) classes.next();
	         
	                       
	            System.out.println("Checking class: "+theClass.getName());
	            
	            interesting_lines = this.class2lines_map.get(theClass.getName());
	            if(interesting_lines == null) {
	            	interesting_lines = new TreeSet<Integer>();
	            }
	            
	            System.out.println("Looking for lines: "+Arrays.toString(interesting_lines.toArray()));
	            
	            Iterator<SootMethod> methods = theClass.getMethods().iterator();
	            
	            while (methods.hasNext()) {
	                SootMethod method = (SootMethod)methods.next();

	                if(!method.hasActiveBody()) continue;
	                
	                try {
	                        JimpleBody body             = (JimpleBody) method.retrieveActiveBody();
	                        BodyTransformer transformer = (BodyTransformer) (new MethodTransformer(method.getSignature(), interesting_lines, this.changed_method_signatures));
	                        
	                        transformer.transform(body, phaseName, options);
	                } catch (RuntimeException ex) {
	                    System.err.println("Exception occurred while processing " + method);
	                    throw ex;
	                }

	            }
	        }
			
		}
	
	}
	
	private static class MethodTransformer extends BodyTransformer {

		Set<Integer> interesting_lines;
		String method_signature;
		Set<String> changed_method_signatures;
		
		public MethodTransformer(String method_signature, Set<Integer> interesting_lines, Set<String> changed_method_signatures) {
			this.method_signature = method_signature;
			this.interesting_lines = interesting_lines;
			this.changed_method_signatures = changed_method_signatures;
		}
		
		@Override
		protected void internalTransform(Body body, String arg1, Map arg2) {
	
			System.out.println("Checking method: "+this.method_signature);
						
			for(Unit unit : body.getUnits()) {
				
				LineNumberTag tag = (LineNumberTag)unit.getTag("LineNumberTag");
				if (tag != null) {
				     int line_number = tag.getLineNumber();
				     
				     if(this.interesting_lines.contains(Integer.valueOf(line_number))) {
				    	 this.changed_method_signatures.add(this.method_signature);
				    	 System.out.println("Method has changed! Matching line "+line_number);
				    	 return;
				     }
				}
				
				
			}
			
		}
		
	}
	
	public static List<String> fileToLines(String filename) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(filename));
		ArrayList<String> file_lines = new ArrayList<String>();
		String line;
		while ((line = br.readLine()) != null) {
			file_lines.add(line);
		}
		return file_lines;
	}
}
