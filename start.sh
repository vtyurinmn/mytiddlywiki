#!/usr/bin/bash
mkdir --parent /var/www/mynewwiki && \
tiddlywiki /var/www/mynewwiki --init server

IP=`ip -4 a show dev eth0| grep inet | cut '-d/' -f1 | awk '{print $2}'`

echo Current IP: $IP

tiddlywiki /var/www/mynewwiki --server 8086 '' '' '' '' '' $IP
