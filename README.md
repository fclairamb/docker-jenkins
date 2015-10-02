# Jenkins instance

This is a draft of a docker instance with jenkins + postfix.

This docker instance is a mix of the [official docker](https://github.com/jenkinsci/docker), itself built from [this docker](https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile).

You can test it like this:

    mkdir -p $HOME/jenkins-mj/data/jenkins
    docker run -ti -v $HOME/jenkins-mj/data/jenkins:/var/lib/jenkins -p 8080:8080 fclairamb/jenkins-mj
    
