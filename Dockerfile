FROM ubuntu:latest
MAINTAINER ember@pfragoso.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -qq --force-yes python-dev libffi-dev libssl-dev python-pip && \
    apt-get autoremove && \
    apt-get autoclean

RUN pip install -I requests[security] flexget transmissionrpc

RUN apt-get purge -q -y python-dev libffi-dev libssl-dev && \
    apt-get -y autoremove

RUN useradd -d /home/flexget -m -s /bin/bash flexget

USER flexget
ENV HOME /home/flexget
ENV LANG C.UTF-8

RUN mkdir /home/flexget/.flexget
COPY ./config.yml /home/flexget/.flexget/config.yml
COPY ./secrets.yml /home/flexget/.flexget/secrets.yml
CMD /usr/local/bin/flexget daemon start

