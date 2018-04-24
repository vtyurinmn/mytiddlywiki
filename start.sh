#!/bin/sh

IP=`ip -4 a show dev eth0| grep inet | cut '-d/' -f1 | awk '{print $2}'`
echo Current IP: $IP

wikidir=/var/www/mynewwiki
if [[ ! -f ${wikidir}/tiddlywiki.info ]]; then
    mkdir -p ${wikidir}
    tiddlywiki ${wikidir} --init server
fi    
tiddlywiki ${wikidir} --server 8086 '' '' '' '' '' $IP
