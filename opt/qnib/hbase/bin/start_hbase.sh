#!/bin/bash
## stolen from: https://github.com/PeterGrace/opentsdb-docker/blob/master/start_hbase.sh
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk/
trap "echo stopping hbase;/usr/lib/hbase/bin/hbase-daemon.sh master stop>>/var/log/hbase-stop.log 2>&1; exit" HUP INT TERM EXIT
echo "starting hbase"
/usr/lib/hbase/bin/hbase-daemon.sh master start &
while true
do
  sleep 1
done
