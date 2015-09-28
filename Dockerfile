FROM jenkins # See https://github.com/jenkinsci/docker

USER root

# We update
RUN apt-get update -y

# We get our tools
RUN apt-get install make g++ -y

USER jenkins
