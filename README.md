# Apache RocketMQ Docker

Apache RocketMQ Docker module provides Dockerfile and bash scripts for building docker image.

## Prequirement

* Docker Engine
* Linux / windows 
* Maven
* GIT(建议关闭git的autoclrf,以免linux下运行shell脚本的时候由于格式错误无法运行脚本)



## BUILD

先打包一个apache-rocketmq.tar.gz

```shel
git clone git@github.com:apache/rocketmq.git
cd rocketmq
# rocketmq-all-4.1.0-incubating为tag名
git checkout tags/rocketmq-all-4.1.0-incubating
# 修改rocketmq/distribution/conf/broker.conf
添加 listenPort = 10911配置【重要】
# 如果需要可以事先修改jvm参数配置,因为默认需要8g的堆内存
# 如果使用java8 可以去掉这两个参数-XX:PermSize=128m -XX:MaxPermSize=320m；用MaxMetaspaceSize替代
# 我这里改掉了runbroker.sh的jvm配置，修改如下，如果服务器资源足够，建议还是默认配置
JAVA_OPT="${JAVA_OPT} -server -Xms512m -Xmx512m -Xmn128m"
# 我也把runserver.sh的JVM配置改了下，如果服务器资源足够，建议还是默认配置
JAVA_OPT="${JAVA_OPT} -server -Xms512m -Xmx512m -Xmn128m"
# 最后执行mvn打包脚本
mvn -Prelease-all -DskipTests clean package -U 或mvn -Prelease-all -DskipTests clean install -U
# 进入目录rocketmq/distribution/target，拷贝apache-rocketmq.tar.gz到broker,namesrv的Dockerfile同一级目录下
# 分别执行namesrv、broker目录下的docker_build.sh生成rmqnamesrv、broker镜像
# 分别执行namesrv、broker目录下的docker_run.sh即可运行容器
```

## Other

这里为了方便已经打包好了一个apache-rocketmq.tar.gz，可以直接用，如果你需要自定义JVM参数，可以自行编译rocketmq源码，或者使用解压缩工具解压apache-rocketmq.tar.gz，修改bin/runbroker.sh、bin/runserver.sh