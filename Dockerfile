###### Docker Image
FROM qnib/hadoop

ENV HBASE_VER=0.98.17 \
    HBASE_EXTRA="-hadoop2"
RUN curl -fsL http://www.interior-dsgn.com/apache/hbase/${HBASE_VER}/hbase-${HBASE_VER}${HBASE_EXTRA}-bin.tar.gz | tar xzf - -C /opt && mv /opt/hbase-${HBASE_VER}${HBASE_EXTRA} /opt/hbase
ADD etc/hbase/conf/hbase-site.xml /etc/hbase/conf/hbase-site.xml
ADD etc/supervisord.d/hbase.ini /etc/supervisord.d/
ADD opt/qnib/hbase/bin/start_hbase.sh /opt/qnib/hbase/bin/start_hbase.sh
ADD etc/consul.d/check_hbase.json /etc/consul.d/check_hbase.json
ADD etc/bashrc.hbase /etc/bashrc.hbase
RUN echo "source /etc/bashrc.hbase" >> /etc/bashrc && \
    echo "tail -f /var/log/supervisor/hbase.log" >> /root/.bash_history

