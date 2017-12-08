#!/bin/sh
cp apache-rocketmq.tar.gz ./namesrv && cp apache-rocketmq.tar.gz ./broker && cp rocketmq-console-ng-1.0.0.jar ./console

docker build -t apache/rocketmq-namesrv:4.1.0-incubating --build-arg "ROCKETMQ_VERSION=4.1.0-incubating" ./namesrv

docker build -t apache/rocketmq-broker:4.1.0-incubating \ 
 --build-arg "ROCKETMQ_VERSION=4.1.0-incubating" \ 
 --build-arg "BROKER_IP1=192.168.59.203" \ 
 --build-arg "BROKER_IP2=192.168.59.203" \ 
 ./broker

docker build -t apache/rocketmq-console:1.0.0 ./console

docker run -d -p 9876:9876 --name rmqnamesrv --restart=always apache/rocketmq-namesrv:4.1.0-incubating

docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --restart=always -m 2048m \ 
 -e "NAMESRV_ADDR=rmqnamesrv:9876" \ 
 -e "JAVA_OPT=-XX:MetaspaceSize=256m" \ 
 -v /opt/rocketmq/logs:/opt/logs \ 
 -v /opt/rocketmq/store:/opt/store \ 
 --link rmqnamesrv:rmqnamesrv apache/rocketmq-broker:4.1.0-incubating

docker run -d -p 8888:8080 --name rmqconsole --restart=always -m 512m \ 
 -e NAMESRV_ADDR='rmqnamesrv:9876' \
 --link rmqnamesrv:rmqnamesrv apache/rocketmq-console:1.0.0
