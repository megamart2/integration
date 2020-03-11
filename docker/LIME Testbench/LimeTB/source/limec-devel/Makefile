SRCPROCCUP=target/generated-sources/java_cup/fi/hut/ics/lime/limec/sourceprocessor
SRCPROCJFLEX=target/generated-sources/jflex/fi/hut/ics/lime/limec/sourceprocessor

ISLPARSERCUP=target/generated-sources/java_cup/fi/hut/ics/lime/limec/islparser/
ISLPARSERJFLEX=target/generated-sources/java_cup/fi/hut/ics/lime/limec/islparser/

all:

	mkdir -p $(SRCPROCCUP)
	mkdir -p $(SRCPROCJFLEX)
	cp src/main/java/fi/hut/ics/lime/limec/Doxyfile target/generated-sources/java_cup/fi/hut/ics/lime/limec/
	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(SRCPROCCUP) -parser DoxygenParser src/main/java/fi/hut/ics/lime/limec/sourceprocessor/DoxygenParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(SRCPROCJFLEX) src/main/java/fi/hut/ics/lime/limec/sourceprocessor/DoxygenLexer.jflex

	mkdir -p $(ISLPARSERCUP)
	mkdir -p $(ISLPARSERJFLEX)

	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(ISLPARSERCUP) -parser ISLParser src/main/java/fi/hut/ics/lime/limec/islparser/ISLParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(ISLPARSERJFLEX) src/main/java/fi/hut/ics/lime/limec/islparser/ISLLexer.jflex

	
clean:
	rm -rf target/generated-sources/java_cup
	rm -rf target/generated-sources/jflex
