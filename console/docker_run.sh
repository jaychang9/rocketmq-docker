#!/bin/sh 
docker run -d -p 8888:8080 --name rmqconsole -m 512m -e NAMESRV_ADDR='rmqnamesrv:9876' --link rmqnamesrv:rmqnamesrv apache/rocketmq-console:1.0.0
