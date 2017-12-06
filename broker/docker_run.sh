#!/bin/sh 
docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --restart=always -m 2048m -e JAVA_OPT='-XX:MetaspaceSize=128m' --link rmqnamesrv:rmqnamesrv apache/incubator-rocketmq-broker:4.1.0-incubating
