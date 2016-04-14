FROM ubuntu:14.04

RUN apt-get update && \
	apt-get --assume-yes install wget

RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" > /etc/apt/sources.list.d/nginx.list

RUN wget -q -O- http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

RUN apt-get update && \
	apt-get --assume-yes install nginx

VOLUME ["/nginx"]

CMD ["/usr/sbin/nginx", "-c", "/nginx/conf/nginx.conf"]
