#!/bin/bash
worker=`curl --max-time 10 --connect-timeout 0 -XGET 'localhost:9600/_node/pipelines?pretty' | grep workers | awk '{print $3}' | sed 's/\,//g'`
if [ "$worker" = 0 ];
then
curl "http://198.57.153.77/sendSMS.php?mobile=9711197051&message=DHL-bat(Worker-count-is-"$worker")%20logstash%20stopped"
elif [ "$worker" = "" ]; 
then
curl "http://198.57.153.77/sendSMS.php?mobile=9711197051&message=DHL-bat(Connection-timeout)%20logstash%20stopped"
else
echo "All Ok"
fi
