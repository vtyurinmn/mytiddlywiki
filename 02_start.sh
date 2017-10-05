#!/bin/bash
if [[ -z $1 ]]; then
    echo "Please specify port!"
    exit 1
fi
docker run -d --rm --name=max-wiki -p $1:8086 max-v/tiddlywiki