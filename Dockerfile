FROM jenkins

USER root

RUN apt-get update -y

RUN apt-get install make g++ -y

USER jenkins
