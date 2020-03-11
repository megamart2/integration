The code is tested in Ubuntu 18.04 LTS (It may also work on Ubuntu 16.04 LTS)

The tools in these release depend on the following additional packages:
	gcc, g++, clang, llvm-dev, xutils-dev, doxygen, make
	openjdk-8-jdk
	
All other dependencies are included in the distribution.

To build all components of the project go to directory LimeTB and run make
  $ cd LimeTB
  $ make


LimeTB has different components. Follow the instructions provided
here for testing them.

Component LIMT-C
  - this component can be used to monitor C code with regular
    expressions. 
  - more details about this tool are available in LimeTB/doc/LIMT-README
  - test LIMT-C:
      $ cd LimeTB
	  $ . setpath (to add LimeTB/bin to the PATH)
      $ cd examples/limt/example_c_lock
      $ ./runtest
  
Component LIMT-Java
  - this component can be used to monitor Java code with regular
    expressions, and linear temporal logic formulas.
  - more details about this tool are available in LimeTB/doc/LIMT-README
  - test LIMT-Java:
  
      $ cd LimeTB
	  $ . setpath
      $ cd examples/limt/example_lock
      $ limejc .
      $ cd spoon; limejava example_lock.Main; cd ..
  
  - this should run without problems.
  - editing the file Main.java and remove the comment for the last
    occurence of lock.lock(); and run again:
	 
      $ limejc .
      $ cd spoon; limejava example_lock.Main; cd ..
	   
  - this should throw an exception because the new lock call is
    not capture by the automaton defined in Lock.java
  
Component LCT
  - the LCT component can be used to explore all executions paths
    of a Java program.
  - more details about this tool are available in LimeTB/doc/LCT-README
  - test LCT:
      $ cd LimeTB
      $ . setpath
	  $ LCTserver (this will start the LCT server that keeps track of 
	    all runnings of the program under test)
	  - open another shell (bash)
	  
      $ cd LimeTB
      $ . setpath
      $ cd examples/lct
      $ LCTcompile Test1.java
      $ LCTinstrument Test1
      $ cd output
      $ LCTrun Test1 all

Component LIMT-LCT
  - this component shows how LIMT and LCT can be used together
    to test all executions paths of a program while also monitoring
	some regular or LTL properties. 
  - more details about this tool are available in LimeTB/doc/LIMT-LCT-Instructions
  - test LIMT-LCT:
  
      $ cd LimeTB
      $ . setpath
	  $ LCTserver (this will start the LCT server that keeps track of 
	    all runnings of the program under test)
	  - open another shell (bash)

      $ cd LimeTB
      $ . setpath
      $ cd examples/limt-lct/example_factory
      $ limejc .
      $ cd spoon
      $ LCTinstrument example_factory.Main
      $ cd output
      $ LCTrun example_factory.Main all
  
Component LJUT
  - This component uses LCT to generate JUnit test cases.
  - more details about this tool are available in LimeTB/doc/LJUT-README
  - test LJUT:
      $ cd LimeTB
      $ . setpath
      $ LCTserver (this will start the LCT server that keeps track of 
        all runnings of the program under test)
      - open another shell (bash)

      $ cd LimeTB
      $ . setpath
      $ cd examples/ljut
      $ mkdir test
      $ cp File* test
      $ cd test
      $ javac File.java
      $ javac FileImpl.java
      $ ljut-interface File "FileImpl()" 3
      $ LCTcompile FileImplLCTDriver.java
      $ LCTinstrument FileImplLCTDriver
      $ cd output
      $ LCTrun FileImplLCTDriver all
      $ cd ..
      $ cp testcases FileImplLCTDriver.parameters
      $ ljut-junit FileImplLCTDriver.properties
        - it should generate FileImplLCTDriverTestCase.java containing test cases. 

It is possible to create a, Eclipse workspace for developing the tools described 
here. For this following the steps:
  -s tart Eclipse, and choose a new workspace 
  - goto Menu -> File -> Import
  - expand General 
  - select Project from Folder or Archive -> Next
  - select LimeTB/source -> OK
  - select all projects (source/aspect-monitor, source/common, ...) 
    except top level source
  - click Finish
  - now all LimeTB projects are imported in the current work space.
