#!/bin/sh -x

./docker_build.sh

IMAGE_ID=$1

if [ "$IMAGE_ID" = "" ]; then
	IMAGE_ID=fclairamb/docker-jenkins
fi
sudo docker rm -f docker-jenkins

mkdir -p data/jenkins && sudo chown 1000:1000 data/jenkins -R
sudo docker run --name docker-jenkins --restart=always --tty --interactive --publish 8080:8080 --volume $(pwd)/data/jenkins:/var/lib/jenkins $IMAGE_ID
