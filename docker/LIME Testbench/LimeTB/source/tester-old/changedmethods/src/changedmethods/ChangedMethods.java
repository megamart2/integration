package changedmethods;

import japa.parser.JavaParser;
import japa.parser.ParseException;
import japa.parser.ast.CompilationUnit;
import japa.parser.ast.body.BodyDeclaration;
import japa.parser.ast.body.ClassOrInterfaceDeclaration;
import japa.parser.ast.body.MethodDeclaration;
import japa.parser.ast.visitor.VoidVisitorAdapter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import difflib.Delta;
import difflib.DiffUtils;
import difflib.Patch;
import difflib.UnifiedDiff;

public class ChangedMethods {
	public static void main(String args[]) throws IOException, ParseException {

		if (args.length != 1) {
			System.out.println("Usage: java ChangedMethods [unified patch]");
			System.exit(1);
		}
			
		for (UnifiedDiff unifieddiff : DiffUtils.splitUnifiedDiff(fileToLines(args[0]))) {
			Patch patch = DiffUtils.parseUnifiedDiff(unifieddiff.getLines());
			ArrayList<Integer> changed_lines = new ArrayList<Integer>();
			for (Delta delta : patch.getDeltas()) {
				switch (delta.getType()) {
				case INSERT:
					changed_lines.add(delta.getOriginal().getPosition()+1);
					break;
				default: // CHANGE or DELETE
					for (int i = 0; i < delta.getOriginal().size(); i++) {
						changed_lines
								.add(delta.getOriginal().getPosition() + i + 1);
						
					}
					break;
				}
				//System.out.println("Line changed: "+changed_lines.get(changed_lines.size()-1));
			}
			
			//System.out.println(unifieddiff.getOriginalFilename());
			
			FileInputStream in = new FileInputStream(unifieddiff.getOriginalFilename());
			
			CompilationUnit cu;
			try {
				cu = JavaParser.parse(in);
			} finally {
				in.close();
			}

			new ClassVisitor(cu.getPackage().getName().getName()).visit(cu, changed_lines);
			
		}

		
		

	}

	
	private static class ClassVisitor extends VoidVisitorAdapter {
		
		String package_name;
		
		public ClassVisitor(String package_name) {
			this.package_name = package_name;
		}
		
		@Override
        public void visit(ClassOrInterfaceDeclaration c, Object arg) {
			ArrayList<Integer> changed_lines = (ArrayList<Integer>)arg;

			 List<BodyDeclaration> members = c.getMembers();
	         for (BodyDeclaration member : members) {
	        	 if (member instanceof MethodDeclaration) {
	        		 	MethodDeclaration method = (MethodDeclaration) member;
	                 
	        		 	ArrayList<Integer> method_lines = new ArrayList<Integer>();
	             		for(int i = method.getBeginLine(); i <= method.getEndLine(); i++) {
	             			method_lines.add(i);
	             		}
	             	
	             		method_lines.retainAll(changed_lines);
	             		if(!method_lines.isEmpty()) {
	             			System.out.println(package_name+"."+c.getName()+"."+method.getName()+" lines "+method.getBeginLine()+" - "+method.getEndLine());
	             		}
	             }
	         }

			
        	
		}
	}
	
	
}
