#!/bin/bash
worker=`curl --max-time 10 --connect-timeout 0 -XGET 'localhost:9600/_node/pipelines?pretty' | grep workers | awk '{print $3}' | sed 's/\,//g'`
if [ "$worker" = 0 ];
then
curl "http://196.52.17.73/sendSMS.php?mobile=9711197051&message=app1(Worker-count-is-"$worker")%20logstash%20stopped"
elif [ "$worker" = "" ]; 
then
curl "http://196.52.17.73/sendSMS.php?mobile=9711197051&message=app1(Connection-timeout)%20logstash%20stopped"
else
echo "All Ok"
fi
