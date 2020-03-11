
SRCPROCCUP=target/generated-sources/java_cup/fi/hut/ics/lime/limec/frontend/sourceprocessor
SRCPROCJFLEX=target/generated-sources/jflex/fi/hut/ics/lime/limec/frontend/sourceprocessor

ASRCPROCCUP=target/generated-sources/java_cup/fi/hut/ics/lime/isl_c/frontend/sourceprocessor
ASRCPROCJFLEX=target/generated-sources/jflex/fi/hut/ics/lime/isl_c/frontend/sourceprocessor

ISLPARSERCUP=target/generated-sources/java_cup/fi/hut/ics/lime/limec/islparser/
ISLPARSERJFLEX=target/generated-sources/java_cup/fi/hut/ics/lime/limec/islparser/

AISLPARSERCUP=target/generated-sources/java_cup/fi/hut/ics/lime/isl_c/islparser/
AISLPARSERJFLEX=target/generated-sources/java_cup/fi/hut/ics/lime/isl_c/islparser/

all: parser compile_java


compile_java:
	gradle build
	cp build/libs/limec.jar ../../lib/lime/limec-2.2.0.jar

parser:
	mkdir -p $(SRCPROCCUP)
	mkdir -p $(SRCPROCJFLEX)
	mkdir -p target/generated-sources/resources/fi/hut/ics/lime/limec/frontend
	cp src/main/java/fi/hut/ics/lime/limec/frontend/Doxyfile target/generated-sources/java_cup/fi/hut/ics/lime/limec/frontend/
	cp src/main/java/fi/hut/ics/lime/limec/frontend/Doxyfile target/generated-sources/resources/fi/hut/ics/lime/limec/frontend/Doxyfile
	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(SRCPROCCUP) -parser DoxygenParser src/main/java/fi/hut/ics/lime/limec/frontend/sourceprocessor/DoxygenParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(SRCPROCJFLEX) src/main/java/fi/hut/ics/lime/limec/frontend/sourceprocessor/DoxygenStripper.jflex


	mkdir -p $(ASRCPROCCUP)
	mkdir -p $(ASRCPROCJFLEX)
	mkdir -p target/generated-sources/resources/fi/hut/ics/lime/isl_c/frontend/
	cp src/main/java/fi/hut/ics/lime/isl_c/frontend/Doxyfile target/generated-sources/java_cup/fi/hut/ics/lime/isl_c/frontend/
	cp src/main/java/fi/hut/ics/lime/isl_c/frontend/Doxyfile target/generated-sources/resources/fi/hut/ics/lime/isl_c/frontend/
	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(ASRCPROCCUP) -parser DoxygenParser src/main/java/fi/hut/ics/lime/isl_c/frontend/sourceprocessor/DoxygenParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(ASRCPROCJFLEX) src/main/java/fi/hut/ics/lime/isl_c/frontend/sourceprocessor/DoxygenStripper.jflex
	

	mkdir -p $(ISLPARSERCUP)
	mkdir -p $(ISLPARSERJFLEX)

	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(ISLPARSERCUP) -parser ISLParser src/main/java/fi/hut/ics/lime/limec/islparser/ISLParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(ISLPARSERJFLEX) src/main/java/fi/hut/ics/lime/limec/islparser/ISLLexer.jflex

	mkdir -p $(AISLPARSERCUP)
	mkdir -p $(AISLPARSERJFLEX)

	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(AISLPARSERCUP) -parser ISLParser src/main/java/fi/hut/ics/lime/isl_c/islparser/ISLParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(AISLPARSERJFLEX) src/main/java/fi/hut/ics/lime/isl_c/islparser/ISLLexer.jflex

	
clean:
	rm -rf target build
