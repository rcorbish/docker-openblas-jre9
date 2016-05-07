FROM java:9-jre

#
# Thanks to: http://pastebin.com/F0Rv2uEk
#
RUN apt-get -y update ; apt-get -y install git build-essential gfortran ; git clone https://github.com/xianyi/OpenBLAS.git
RUN cd OpenBLAS ; make FC=gfortran ; make PREFIX=/opt/OpenBLAS install

RUN  update-alternatives --install "/usr/lib/libblas.so" libblas.so /opt/OpenBLAS/lib/libopenblas.so 500
RUN  update-alternatives --install "/usr/lib/libblas.so.3" libblas.so.3 /opt/OpenBLAS/lib/libopenblas.so 500
 
RUN  update-alternatives --install "/usr/lib/liblapack.so" liblapack.so /opt/OpenBLAS/lib/libopenblas.so 500
RUN  update-alternatives --install "/usr/lib/liblapack.so.3" liblapack.so.3 /opt/OpenBLAS/lib/libopenblas.so 500
 
RUN  update-alternatives --set libblas.so /opt/OpenBLAS/lib/libopenblas.so
RUN  update-alternatives --set libblas.so.3 /opt/OpenBLAS/lib/libopenblas.so
RUN  update-alternatives --set liblapack.so /opt/OpenBLAS/lib/libopenblas.so
RUN  update-alternatives --set liblapack.so.3 /opt/OpenBLAS/lib/libopenblas.so

