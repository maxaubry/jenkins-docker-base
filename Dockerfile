FROM debian:jessie
MAINTAINER Floran Brutel <f.brutel@hexanet.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# curl an wget
RUN apt-get install -y curl wget

# JAVA
RUN apt-get install -y openjdk-7-jre-headless

# SSH
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# GIT
RUN apt-get install -y git-core

# Ant
RUN apt-get install -y ant

RUN apt-get clean -y

# Users
RUN useradd -m -d /home/jenkins -s /bin/bash jenkins
RUN echo jenkins:jenkins | chpasswd
RUN echo "root:root" | chpasswd

EXPOSE 22

CMD /usr/sbin/sshd -D
