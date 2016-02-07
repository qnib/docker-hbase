### HBase Image
FROM qnib/hadoop

ENV HBASE_VER 1.1.3
RUN curl -fLs http://apache.org/dist/hbase/${HBASE_VER}/hbase-${HBASE_VER}-bin.tar.gz | tar xzf - -C /opt && mv /opt/hbase-${HBASE_VER} /opt/hbase
ADD opt/hbase/conf/hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD etc/supervisord.d/hbase.ini /etc/supervisord.d/
ADD opt/qnib/hbase/bin/start_hbase.sh /opt/qnib/hbase/bin/start_hbase.sh
VOLUME ["/data/hbase/"]
ADD etc/consul.d/check_hbase.json /etc/consul.d/check_hbase.json
