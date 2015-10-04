# Jenkins container

This is a draft of a docker container with jenkins + postfix.

This docker container is inspired from the [official docker container](https://github.com/jenkinsci/docker), 
itself built from [a java8 container](https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile).

You can test it like this:

    mkdir -p $HOME/jenkins-mj/data/jenkins
    docker run -ti -v $HOME/jenkins-mj/data/jenkins:/var/lib/jenkins -p 8080:8080 fclairamb/jenkins-mj
    
