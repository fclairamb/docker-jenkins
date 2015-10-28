# This docker file was widely inspired from https://github.com/jenkinsci/docker
FROM debian

USER root

# Installing few tools and setting up the jenkins user as a sudoer.
# All the CI scripts will have to install their dependencies themselves.
RUN \
  apt-get update -y && \
  apt-get install rsyslog wget ca-certificates postfix make sudo -y && \
  useradd -d /var/lib/jenkins -u 1000 -m -s /bin/bash jenkins && \
  echo "jenkins ALL= NOPASSWD: ALL" >>/etc/sudoers
VOLUME /var/lib/jenkins

# Installing java
RUN \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install oracle-java8-installer -y && \
  rm -rf /var/cache/oracle-jdk8-installer /var/cache/apt/archives/*

# Installing jenkins (LTS version)
RUN \
  echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
  wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
  apt-get update && \
  apt-get install jenkins net-tools -y && \
  chown jenkins /var/lib/jenkins -Rf && \
  rm -rf /var/cache/apt/archives/*
EXPOSE 8080

# Some dirty setup around emails
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get install postfix -y && \
  postconf -e myhostname=florent.clairambault.fr mydomain=clairambault.fr && \
  echo Europe/Paris > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

# We setup a start point
COPY start.sh /usr/local/bin/start.sh
ENTRYPOINT /usr/local/bin/start.sh
