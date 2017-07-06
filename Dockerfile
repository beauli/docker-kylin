FROM sequenceiq/ambari:7.2-v4
MAINTAINER Beauli

RUN yum install -y pig hbase tez hadoop snappy snappy-devel hadoop-libhdfs ambari-log4j hive hive-hcatalog hive-webhcat webhcat-tar-hive webhcat-tar-pig mysql-connector-java mysql-server

RUN curl -sL https://archive.apache.org/dist/kylin/apache-kylin-2.0.0/apache-kylin-2.0.0-bin-hbase098.tar.gz | tar -xz -C /usr/local
RUN cd /usr/local && ln -s ./apache-kylin-2.0.0-bin kylin
ENV KYLIN_HOME=/usr/local/kylin

ADD serf /usr/local/serf
ADD install-cluster.sh /tmp/
ADD kylin-singlenode.json /tmp/
ADD kylin-multinode.json /tmp/
ADD wait-for-kylin.sh /tmp/
ADD deploy.sh /usr/local/kylin/deploy.sh

EXPOSE 7070
