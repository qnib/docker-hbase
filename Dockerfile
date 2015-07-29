###### grafana images
FROM qnib/terminal:light
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y automake \
                   gnuplot \
                   java-1.7.0-openjdk.x86_64 \
                   python-devel \
                   unzip
RUN curl -Ls -o /tmp/hbase-0.94.27.tar.gz http://apache.org/dist/hbase/hbase-0.94.27/hbase-0.94.27.tar.gz && \
   tar xzf /tmp/hbase-*gz && rm /tmp/hbase-*gz && \
   mv hbase-* /opt/hbase
ADD etc/hbase/conf/hbase-site.xml /etc/hbase/conf/hbase-site.xml
ADD etc/supervisord.d/hbase.ini /etc/supervisord.d/
ADD opt/qnib/hbase/bin/start_hbase.sh /opt/qnib/hbase/bin/start_hbase.sh
VOLUME ["/data/hbase/"]
ADD etc/consul.d/check_hbase.json /etc/consul.d/check_hbase.json
