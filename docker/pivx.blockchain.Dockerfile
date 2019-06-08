FROM ubuntu:18.04

WORKDIR /root/
RUN mkdir build
WORKDIR /root/build
RUN apt update -y && apt upgrade -y && apt install -y git
RUN git clone --progress --verbose https://github.com/PIVX-Project/PIVX.git

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y \
  autoconf libtool libboost-all-dev bsdmainutils libssl-dev curl \
  libdb++-dev wget libevent-dev libgmp-dev

WORKDIR /root/build/PIVX/depends
RUN make
WORKDIR /root//build/PIVX
RUN ./autogen.sh
RUN ./configure \
  --prefix=/opt/yescoin \
  --oldincludedir=/usr/include \
  --disable-silent-rules \
  --with-incompatible-bdb \
  --with-unsupported-ssl
RUN make
RUN make install
