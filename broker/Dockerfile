#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start from a Java image.                                           
FROM java:openjdk-8u111-alpine                                     

# Rocketmq version
# ENV ROCKETMQ_VERSION if build-arg not set the default value is 4.1.0-incubating
ARG ROCKETMQ_VERSION
ENV ROCKETMQ_VERSION ${ROCKETMQ_VERSION:-4.1.0-incubating}

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

WORKDIR ${ROCKETMQ_HOME}

# Rocketmq broker ip
ARG BROKER_IP1
ARG BROKER_IP2
ENV BROKER_IP1 ${BROKER_IP1}
ENV BROKER_IP2 ${BROKER_IP2}
                  
RUN mkdir -p \                       
        /opt/logs \
        /opt/store
                                                    
# Configure ustc alipine software source and timezone
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/latest-stable/main\nhttps://mirrors.ustc.edu.cn/alpine/latest-stable/community" > /etc/apk/repositories && \
    apk update && \
    apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" >  /etc/timezone            

ADD apache-rocketmq.tar.gz .           

# If you want your develop computer can link broker that runs in docker,please remove the `#` and modify the ip address as your docker host machine's ip address
# RUN echo -e "\nbrokerIP1 = 192.168.59.203\nbrokerIP2 = 192.168.59.203" >> ./conf/broker.conf
RUN if [ -n "$BROKER_IP1" ] ; then echo -e "\nbrokerIP1 = $BROKER_IP1\nbrokerIP2 = $BROKER_IP2" >> ./conf/broker.conf ; fi
                                                                                                                                                              
RUN chmod +x bin/mqbroker

CMD cd ${ROCKETMQ_HOME}/bin && export JAVA_OPT="${JAVA_OPT} -Duser.home=/opt" && sh mqbroker -n ${NAMESRV_ADDR} -c ../conf/broker.conf

EXPOSE 10909 10911
VOLUME /opt/logs \
       /opt/store

