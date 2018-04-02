# TiddlyWiki over NodeJS on Alpine Linux
#
# VERSION               0.2
#
FROM alpine:3.7
EXPOSE 8086
VOLUME ["/var/www"]
RUN apk add --update nodejs iproute2 && \
	npm install -g tiddlywiki && \
	tiddlywiki --version && \
	mkdir -p /var/www/mynewwiki && \
	tiddlywiki /var/www/mynewwiki --init server
COPY ./start.sh /root
ENTRYPOINT ["/root/start.sh"]	
