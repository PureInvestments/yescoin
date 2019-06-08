FROM yescoin:pivx.blockchain

RUN apt install -y strace
RUN mkdir -p /root/logs/
WORKDIR /root/build/
RUN strace -vvttff -o /root/logs/pivx /opt/yescoin/bin/test_pivx > /root/logs/pivx.stdout
