FROM ubuntu:latest
WORKDIR /
ADD workspace /workspace
RUN apt-get update && apt-get install openjdk-8-jdk wget libgtk-3-0 -y

#Eclipse for Java developers
RUN wget https://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/2020-03/M3/eclipse-java-2020-03-M3-linux-gtk-x86_64.tar.gz
RUN tar xf eclipse-java-2020-03-M3-linux-gtk-x86_64.tar.gz

ENTRYPOINT ["/eclipse/eclipse", "-data", "/workspace"]

