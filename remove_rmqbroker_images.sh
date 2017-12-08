docker images |grep apache/incubator-rocketmq-broker|awk '{print $3}'|xargs docker rmi

