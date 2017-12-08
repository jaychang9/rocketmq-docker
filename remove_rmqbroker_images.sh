docker images |grep apache/rocketmq-broker|awk '{print $3}'|xargs docker rmi

