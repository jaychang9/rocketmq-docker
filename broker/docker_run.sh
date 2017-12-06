#!/bin/sh 
docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker -m 4096m -e NAMESRV_ADDR='rmqnamesrv:9876' -e JAVA_OPT='-Xms512m -Xmx512m -XX:MetaspaceSize=256m' --link rmqnamesrv:rmqnamesrv apache/incubator-rocketmq-broker:4.1.0-incubating
