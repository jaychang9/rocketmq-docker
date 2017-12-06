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
                                                                         
# Rocketmq home
ENV ROCKETMQ_CONSOLE_HOME  /opt/rocketmq-console
                              
WORKDIR  ${ROCKETMQ_CONSOLE_HOME}
				
# Configure ustc alipine software source and timezone
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/latest-stable/main\nhttps://mirrors.ustc.edu.cn/alpine/latest-stable/community" > /etc/apk/repositories && \
    apk update &&\
    apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" >  /etc/timezone
          
ADD rocketmq-console-ng-1.0.0.jar .
                                                                                                                                                              
CMD java -jar rocketmq-console-ng-1.0.0.jar -DnamesrvAddr=${NAMESRV_ADDR}

EXPOSE 8080
