FROM ubuntu:latest
MAINTAINER ember@pfragoso.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -qq --force-yes python-dev libffi-dev libssl-dev python-pip && \
    apt-get autoremove && \
    apt-get autoclean

RUN apt-get purge -q -y python-dev libffi-dev libssl-dev && \
    apt-get -y autoremove

RUN pip install requests[security]

RUN pip install flexget --upgrade

RUN mkdir -p /home/flexget/.flexget
RUN chmod -R 777 /home/flexget

RUN useradd -d /home/flexget -m -s /bin/bash flexget

USER flexget
ENV HOME /home/flexget
ENV LANG C.UTF-8

COPY ./config.yml /home/flexget/.flexget/config.yml
COPY ./secrets.yml /home/flexget/.flexget/secrets.yml
CMD /usr/local/bin/flexget daemon start

