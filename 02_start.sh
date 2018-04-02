#!/bin/bash
if [[ -z $1 ]]; then
    echo "Please specify name!"
    exit 1
fi
if [[ -z $2 ]]; then
    echo "Please specify port!"
    exit 1
fi
docker run -d --rm --name=$1 -p $2:8086 mytiddlywiki:${tag:-latest}