#!/bin/sh 
docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --restart=always -m 2048m \
 -e "NAMESRV_ADDR=rmqnamesrv:9876" \
 -e "JAVA_OPT=-XX:MetaspaceSize=256m" \
 -v /opt/rocketmq/logs:/opt/rocketmq/logs \
 -v /opt/rocketmq/store:/opt/rocketmq/store \
  --link rmqnamesrv:rmqnamesrv apache/rocketmq-broker:4.1.0-incubating