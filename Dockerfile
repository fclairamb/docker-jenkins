# See https://github.com/jenkinsci/docker
FROM jenkins

USER root

# We update
RUN apt-get update -y

# We get our build tools
RUN apt-get install make g++ -y

# We get our notification tools
RUN apt-get install python-pip -y

# Let's install pygments
RUN pip install pygments

USER jenkins
