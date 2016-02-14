###### Docker Image
FROM qnib/hadoop

VOLUME ["/data/hbase/"]
ENV HBASE_VER 1.1.3
RUN curl -fLs http://apache.org/dist/hbase/${HBASE_VER}/hbase-${HBASE_VER}-bin.tar.gz | tar xzf - -C /opt && mv /opt/hbase-${HBASE_VER} /opt/hbase
ADD opt/hbase/conf/hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD etc/supervisord.d/hbase.ini /etc/supervisord.d/
ADD opt/qnib/hbase/bin/start_hbase.sh /opt/qnib/hbase/bin/start_hbase.sh
ADD etc/consul.d/check_hbase.json /etc/consul.d/check_hbase.json
ADD etc/bashrc.hbase /etc/bashrc.hbase
RUN echo "source /etc/bashrc.hbase" >> /etc/bashrc && \
    echo "tail -f /var/log/supervisor/hbase.log" >> /root/.bash_history

