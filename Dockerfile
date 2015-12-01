#FROM oraclelinux:latest
FROM ubuntu:14.04

MAINTAINER Erwin van Lochem

#RUN yum -y install wget tar gcc-c++ libaio make \ 
# && wget https://nodejs.org/download/release/v5.0.0/node-v5.0.0-linux-x64.tar.gz \
# && tar -C /usr/local --strip-components 1 -xzf node-v5.0.0-linux-x64.tar.gz \
# && rm node-v5.0.0-linux-x64.tar.gz

RUN apt-get -y install software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get update \
 && apt-get -y install gcc libaio1 make wget alien python \
 && wget https://nodejs.org/download/release/v5.0.0/node-v5.0.0-linux-x64.tar.gz \
 && tar -C /usr/local --strip-components 1 -xzf node-v5.0.0-linux-x64.tar.gz \
 && rm node-v5.0.0-linux-x64.tar.gz

ADD ./oracle/ .

RUN alien -i oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN alien -i oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

#RUN npm install oracledb

CMD ["/bin/bash"]