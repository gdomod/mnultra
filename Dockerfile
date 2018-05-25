FROM ubuntu:18.04

WORKDIR /tmp/

#RUN apt-get update -y && apt-get install software-properties-common -y && add-apt-repository -y ppa:bitcoin/bitcoin
#RUN apt install -y make build-essential libtool software-properties-common autoconf libssl1.0-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw fail2ban pkg-config libevent-dev libzmq5

#RUN git clone https://github.com/ultranatum/ultranatum /root/wallet
#RUN chmod -R 755 /root/wallet && cd /root/wallet && ./autogen.sh && ./configure --disable-tests --disable-bench --with-gui=no --disable-silent-rules --with-incompatible-bdb --with-unsupported-ssl  && make && make install
#RUN rm -r /root/*

RUN wget https://github.com/ultranatum/ultranatum/releases/download/1.0.0.1/ultranatumcore-1.0.0.1-linux64.tar.gz .
RUN tar -xvf ultranatumcore-1.0.0.1-linux64.tar.gz ultranatumcore-1.0.0.1 --one-top-level=/usr --strip 1


ENV PORT 23546



ADD run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]

CMD []

