# TiddlyWiki over NodeJS on CentOS
#
# VERSION               0.1
#
# The following Dockerfile installs AWS CLI on CentOS
FROM centos:latest
EXPOSE 8086
VOLUME /var/www
RUN yum -y update && \
	curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - && \
	yum -y install nodejs iproute && \
	npm install -g tiddlywiki 
	#mkdir --parent /var/www/mynewwiki && \
	#tiddlywiki /var/www/mynewwiki --init server
#

COPY ./start.sh /root
ENTRYPOINT ["/root/start.sh"]	
