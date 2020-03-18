FROM ubuntu:16.04
WORKDIR /aiphs
ADD src /aiphs/src
RUN apt-get update && apt-get install xterm wget make tclsh wish xz-utils libnspr4 default-jdk libgtk-3-0 libgtk2.0-0 vim man rsync build-essential -y
RUN wget https://www.gaisler.com/products/grlib/grlib-gpl-2019.4-b4246.tar.gz
RUN tar xvzf grlib-gpl-2019.4-b4246.tar.gz
RUN wget https://www.gaisler.com/anonftp/bcc2/bin/bcc-2.1.1-gcc-linux64.tar.xz
RUN tar xf bcc-2.1.1-gcc-linux64.tar.xz -C /opt
RUN wget https://www.gaisler.com/anonftp/bcc2/bin/bcc-2.1.1-llvm-linux64.tar.xz
RUN tar xf bcc-2.1.1-llvm-linux64.tar.xz -C /opt
RUN wget https://www.gaisler.com/anonftp/grmon/grmon-eval-64-3.2.1.tar.gz
RUN tar xf grmon-eval-64-3.2.1.tar.gz -C /opt
RUN cp -r src/HW/monitoring_system/ grlib-gpl-2019.4-b4246/lib/grlib/amba/
RUN cp src/HW/vhdlsyn.txt grlib-gpl-2019.4-b4246/lib/grlib/amba/
RUN cp src/HW/leon3mp.vhd ./grlib-gpl-2019.4-b4246/designs/leon3-digilent-nexys4ddr/
#Vivado
COPY Xilinx_Vivado_SDK_Web_2017.4_1216_1_Lin64.bin .
#Eclipse C/C++
RUN wget https://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/2019-09/RC2/eclipse-cpp-2019-09-R-linux-gtk-x86_64.tar.gz
RUN tar xf eclipse-cpp-2019-09-R-linux-gtk-x86_64.tar.gz
RUN useradd -m aiphs
RUN chown -R aiphs.users /opt
RUN chown -R aiphs.users /aiphs
USER aiphs
RUN echo 'export PATH=$PATH:/opt/grmon-eval-3.2.1/linux/bin64' >> /home/aiphs/.bashrc && . ~/.bashrc


