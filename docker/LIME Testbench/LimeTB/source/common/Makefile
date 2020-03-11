SRCPROCCUP=target/generated-sources/java_cup/fi/hut/ics/lime/common/automaton/parser
SRCPROCJFLEX=target/generated-sources/jflex/fi/hut/ics/lime/common/automaton/parser/


all: parser compile_jar

parser:
	mkdir -p $(SRCPROCCUP)
	mkdir -p $(SRCPROCJFLEX)
	java -cp ../../lib/external/java-cup-11a.jar java_cup.Main -destdir $(SRCPROCCUP) -parser AutomatonParser src/main/java/fi/hut/ics/lime/common/automaton/parser/AutomatonParser.cup
	java -cp ../../lib/external/JFlex.jar JFlex.Main -d $(SRCPROCJFLEX) src/main/java/fi/hut/ics/lime/common/automaton/parser/AutomatonLexer.jflex

compile_jar:
	gradle build
	cp build/libs/common.jar ../../lib/lime/common-2.2.0.jar
	
clean:
	rm -rf build target
