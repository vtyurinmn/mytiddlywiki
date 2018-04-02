#!/bin/bash

docker build --force-rm -t mytiddlywiki:${tag:-latest} . 

# remove temporary images
if [ $(docker images | grep '<none>' | wc -l) -ne 0 ]
then
    echo "Cleaning..."
    docker rmi $(docker images | grep '<none>' | awk '{ print $3 }')
fi 