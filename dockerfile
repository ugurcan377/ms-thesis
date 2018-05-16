FROM ubuntu:xenial

COPY . /opt/nginx
WORKDIR /opt/nginx

RUN apt-get update && apt-get install -y \
	libexpat1 \
	libgeoip1 \
	libgd3 \
	libluajit-5.1-2 \
	perl \
	libxml2 \
	libxslt1.1 \
	libhiredis0.13 \
	libssl1.0.0

RUN dpkg -i \
	nginx-common_1.12.2-0+xenial0_all.deb \
	libnginx-mod-* \
	nginx-full_1.12.2-0+xenial0_amd64.deb

WORKDIR /
RUN rm -rf /opt/nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
