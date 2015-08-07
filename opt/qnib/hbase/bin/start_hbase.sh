#!/bin/bash
source /etc/bashrc

mkdir -p /opt/hbase/logs/
chown -R hadoop /opt/hbase/logs/
echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

function check_hdfs {
    cnt_hdfs=$(curl -s localhost:8500/v1/catalog/service/hdfs|grep -c "\"Node\":\"$(hostname)\"")
    if [ ${cnt_hdfs} -ne 1 ];then
        echo "[start_hbase] No running 'hdfs service yet, sleep 5 sec'"
        sleep 5
        check_hdfs
    fi
}

check_hdfs
sleep 10
echo "starting hbase"
su -c '/opt/hbase/bin/hbase master start' hadoop 
