#!/bin/sh

AWSPASSWORD=`/usr/bin/aws ecr get-login --no-include-email --region ap-south-1 | awk '{print $6}'` > /dev/null 2>&1
docker login -u AWS -p ${AWSPASSWORD} https://$1
if [ $? -ne 0 ] ; then
    echo "[ERR] AWS repository login has failed !"
    exit 1
else
    echo "[INFO] AWS repository logged in !"
fi

# Building and pulling required images
docker build -t finder-app .
docker build -t finder-application .
docker pull consul
docker pull redis:4.0

# Tagging created images
docker tag finder-app:latest $1/finder-app:latest
docker tag finder-application:latest $1/finder-application:latest
docker tag consul:latest $1/consul:latest
docker tag redis:4.0 $1/redis:latest


# Pushing images to ECR
docker push $1/finder-app:latest
docker push $1/finder-application:latest
docker push $1/consul:latest
docker push $1/redis:latest
