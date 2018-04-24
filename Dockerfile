# TiddlyWiki over NodeJS on Alpine Linux
#
# VERSION 0.3
#
FROM alpine:3.7
EXPOSE 8086
ENV WIKI_HOME=/home/wiki
RUN apk add --update nodejs iproute2 \
    && npm install -g tiddlywiki \
    && tiddlywiki --version
COPY ./start.sh ${WIKI_HOME}/start.sh
RUN addgroup wiki && adduser -G wiki -h /home/wiki -D wiki \
    && chmod +x ${WIKI_HOME}/start.sh \
    && mkdir -p /var/www && chown -R wiki:wiki /var/www
USER wiki
WORKDIR ${WIKI_HOME}
ENTRYPOINT ["./start.sh"]
VOLUME ["/var/www"]
