FROM ubuntu:20.04

RUN apt-get update && apt-get install -y wget git build-essential zlib1g-dev

RUN wget http://ftp.gnu.org/gnu/m4/m4-latest.tar.gz -O /root/m4latest.tar.gz && \
	tar -xf /root/m4latest.tar.gz -C /root && \
	rm -f /root/m4latest.tar.gz && \
	cd /root/m4* && \
	./configure && make && make install && \
	cd / && rm -rf /root/m4*

RUN wget http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz -O /root/aulatest.tar.gz && \
	tar -xf /root/aulatest.tar.gz -C /root && \
	rm -f /root/aulatest.tar.gz && \
	cd /root/autoconf* && \
	./configure && make && make install && \
	cd / && rm -rf /root/autoconf*

RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz -O /root/boost.tar.gz && \
	tar -xf /root/boost.tar.gz -C /root && \
	rm -f /root/boost.tar.gz && \
	cd /root/boost* && \
	./bootstrap.sh && ./b2 && ./b2 install && \
	cd / && rm -rf /root/boost*

RUN cd /root && git clone https://github.com/ParBLiSS/FastANI.git && \
	cd FastANI && ./bootstrap.sh && ./configure --with-boost=/usr/local && make

COPY expand_output.sh /root/FastANI
COPY prepare_list.sh /root/FastANI
COPY get_refs.sh /root/FastANI

RUN chmod +x /root/FastANI/expand_output.sh /root/FastANI/prepare_list.sh /root/FastANI/get_refs.sh

WORKDIR /root/FastANI

