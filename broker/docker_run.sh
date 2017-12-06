#!/bin/sh 
docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --restart=always -m 2048m -e NAMESRV_ADDR='rmqnamesrv:9876' \
-e JAVA_OPT='-Xms512m -Xmx512m -XX:MetaspaceSize=256m' 
#下面这个参数可选(根据情况修改)，比如开发环境用的会比较多，因为自己开发的机器可能会去连broker，但是broker的地址不能是docker的私网ip，否则自己本地的机器连不上broker
-e JAVA_OPT_EXT = '-DbrokerIP1=192.168.59.203 -DbrokerIP2=192.168.59.203'
--link rmqnamesrv:rmqnamesrv apache/incubator-rocketmq-broker:4.1.0-incubating
