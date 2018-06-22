#!/bin/bash

# chkconfig: 2345 84 02
# description: Script to stop zabixx
# Remove autoscaling servers from zabbix monitoring
api_key=sjdhkdhalkdlajdas89u3y8938983
server=zm.zabbix.com
start() {
 /bin/touch /var/lock/subsys/remove-zabbix.sh
}



stop() {

 /bin/rm -f /var/lock/subsys/remove-zabbix.sh

 HOST_NAME=`echo $(hostname)`

 # Get This Host HostId
 HostID=`curl -s -H 'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"host.get\",\"params\":{\"output\":\"extend\",\"filter\":{\"host\":[\""$HOST_NAME"\"]}},\"auth\":\""$api_key"\",\"id\":0}" http://$server/zabbix/api_jsonrpc.php | jq -r .result[0].hostid`

 # Remove Host
 curl -s -H 'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"host.delete\",\"params\":[\""${HostID}"\"],\"auth\":\""$api_key"\",\"id\":0}" http://$server/zabbix/api_jsonrpc.php

}

case $1 in
	start)
	  start
	;;

        stop)
          stop
        ;;

        restart)
          stop
          start
        ;;

esac
exit 0
