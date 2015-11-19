FROM ubuntu:latest
MAINTAINER ember@pfragoso.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:deluge-team/ppa

RUN apt-get update -qq && \
    apt-get install -qq --force-yes python-dev libffi-dev libssl-dev python-pip deluged deluge-webui deluge-console && \
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

COPY ./deluge-daemon /etc/default/deluge-daemon
COPY ./config/deluge-daemon /etc/init.d/deluge-daemon

RUN chmod 755 /etc/init.d/deluge-daemon
RUN update-rc.d deluge-daemon defaults

COPY ./config.yml /home/flexget/.flexget/config.yml
COPY ./secrets.yml /home/flexget/.flexget/secrets.yml
CMD /usr/local/bin/flexget daemon start

