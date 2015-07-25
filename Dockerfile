###### grafana images
FROM qnib/terminal:light
MAINTAINER "Christian Kniep <christian@qnib.org>"

ADD etc/yum.repos.d/cdh.repo /etc/yum.repos.d/
RUN yum install -y hbase-master
RUN mkdir -p /data/{zookeeper,hbase} && \
    chown -R hbase:hbase /data/hbase/ 
ADD etc/zookeeper/conf/zoo.cfg /etc/zookeeper/conf/zoo.cfg
ADD etc/hbase/conf/hbase-site.xml /etc/hbase/conf/hbase-site.xml
ADD etc/supervisord.d/hbase.ini /etc/supervisord.d/
ADD opt/qnib/hbase/bin/start_hbase.sh /opt/qnib/hbase/bin/start_hbase.sh
