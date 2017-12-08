#!/bin/sh
docker build -t apache/rocketmq-namesrv:4.1.0-incubating --build-arg "ROCKETMQ_VERSION=4.1.0-incubating" ./namesrv

docker build -t apache/rocketmq-broker:4.1.0-incubating --build-arg "ROCKETMQ_VERSION=4.1.0-incubating BROKER_IP1=192.168.59.203 BROKER_IP2=192.168.59.203" ./broker

#docker run -d -p 9876:9876 --name rmqnamesrv  apache/rocketmq-namesrv:4.1.0-incubating

#docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqnamesrv:rmqnamesrv -e "NAMESRV_ADDR=rmqnamesrv:9876" apache/rocketmq-broker:4.1.0-incubating
