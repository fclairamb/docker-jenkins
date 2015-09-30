#!/bin/sh -x

./docker_build.sh

IMAGE_ID=$1

if [ "$IMAGE_ID" = "" ]; then
	IMAGE_ID=fclairamb/jenkins-mj
fi
sudo killall -9 docker && sleep 5

mkdir -p data/jenkins
sudo docker run -ti -p 8080:8080 -v $(pwd)/data/jenkins:/var/lib/jenkins $IMAGE_ID
