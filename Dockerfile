FROM ubuntu:trusty
MAINTAINER Clayton Hynfield "clayton.hynfield@kroger.com"

ADD sources.list /etc/apt

RUN apt-get clean
RUN apt-get update

ENTRYPOINT /bin/bash
