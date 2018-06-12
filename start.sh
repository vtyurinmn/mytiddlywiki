#!/bin/sh

IP=`ip -4 a show dev eth0| grep inet | cut '-d/' -f1 | awk '{print $2}'`
echo Current IP: $IP

wikidir=${WIKI_HOME}/mynewwiki/wikidata
if [[ ! -d ${wikidir} ]]; then
    mkdir -p ${wikidir}
    tiddlywiki ${wikidir} --init server
fi    
tiddlywiki ${wikidir} --server 8086 '' '' '' '' '' $IP
