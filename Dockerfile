FROM ubuntu:latest
MAINTAINER ember@pfragoso.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -qq --force-yes python-pip && \
    apt-get autoremove && \
    apt-get autoclean

RUN pip install -I flexget transmissionrpc

RUN useradd -d /home/flexget -m -s /bin/bash flexget

USER flexget
ENV HOME /home/flexget
ENV LANG C.UTF-8

RUN mkdir /home/flexget/.flexget
CMD /usr/local/bin/flexget daemon start

