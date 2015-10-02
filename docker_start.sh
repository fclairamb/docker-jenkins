#!/bin/sh -x

./docker_build.sh

IMAGE_ID=$1

if [ "$IMAGE_ID" = "" ]; then
	IMAGE_ID=fclairamb/jenkins-mj
fi
sudo docker rm -f jenkins-mj

mkdir -p data/jenkins
sudo docker run --name jenkins-mj --restart=always --tty --interactive --publish 8080:8080 --volume $(pwd)/data/jenkins:/var/lib/jenkins $IMAGE_ID
