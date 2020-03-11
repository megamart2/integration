FROM ubuntu:18.04
WORKDIR /LimeTB
ADD LimeTB /LimeTB
#Install LIME dependencies
RUN apt-get update && apt-get install gcc g++ clang llvm-dev xutils-dev doxygen make openjdk-8-jdk gradle patch -y

#Build LIME
RUN make



