#!/bin/sh
docker build -t apache/rocketmq-namesrv:4.1.0-incubating --build-arg "ROCKETMQ_VERSION=4.1.0-incubating" ./namesrv
