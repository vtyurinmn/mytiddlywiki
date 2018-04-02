#!/bin/sh

IP=`ip -4 a show dev eth0| grep inet | cut '-d/' -f1 | awk '{print $2}'`

echo Current IP: $IP

if [[ ! -d /var/www/mynewwiki ]]; then
    tiddlywiki /var/www/mynewwiki --init server
fi    
tiddlywiki /var/www/mynewwiki --server 8086 '' '' '' '' '' $IP
