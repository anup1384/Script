#!/bin/bash
function prod.public.process_7_2018 {
echo "`docker exec  -t kafka /bin/bash bin/kafka-consumer-groups.sh --bootstrap-server kafka:9092 --describe --group process_prod | awk '{print $1, $5}'| grep "prod.public.process_7_2018" | awk '{print $2}'`"
}
function prod.public.process_6_2018 {
echo "`docker exec -t kafka /bin/bash bin/kafka-consumer-groups.sh --bootstrap-server kafka:9092 --describe --group process_prod | awk '{print $1, $5}'| grep "prod.public.process_6_2018" | awk '{print $2}'`"
}
# Run the requested function
$1



#############################################
http://blog.yancy.cc/2017/06/05/Bigdata-hadoop/Kafka/Zabbix-Monitoring%20Kafka%20Consumer%20%7C%20kafka%E7%9A%84%E7%9B%91%E6%8E%A7%E5%92%8C%E5%91%8A%E8%AD%A6/

sudo usermod -aG docker zabbix

UserParameter=kafka.[*],/etc/zabbix/monitor_kafka.sh $1

kafka.[staging.public.process_12_2017]

#############################################
