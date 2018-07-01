FROM ubuntu:18.04

WORKDIR /tmp/

RUN apt-get update && apt-get install curl -y
ADD https://github.com/ultranatum/ultranatum/releases/download/1.1.0.1/ultranatumcore-1.1.0.1-linux64.tar.gz .
RUN tar -xvf ultranatumcore-1.1.0.1-linux64.tar.gz ultranatumcore-1.1.0.1 --one-top-level=/usr/local --strip 1

ENV PORT 23654

ADD run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]

CMD []
