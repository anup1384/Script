#!/bin/bash

zone_id="17a922skjljlksajdlkaklsajdkljdsd"
email="bdmgroup@outlook.com"
auth_key="djsjklsjlskslnskansk9sxs"

curl -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/settings/security_level" -H "X-Auth-Email: ${email}" -H "X-Auth-Key: ${auth_key}" -H "Content-Type:application/json" | grep -w "under_attack"
if [ $? -eq 0  ]
then
 echo "Already under attack.!. Exiting"
 exit 0
fi

now=$(date)
cat /proc/loadavg | colrm 6 > /root/ddos.ini
egrep [1].[3-9][0-9] ddos.ini > /dev/null

if [ $? -eq 0 ]
then
 printf  "$now  ATTACK!!!\n"
 curl -X PATCH "https://api.cloudflare.com/client/v4/zones/${zone_id}/settings/security_level" -H "X-Auth-Email: ${email}" -H "X-Auth-Key: ${auth_key}" -H "Content-Type: application/json" --data '{"value":"under_attack"}'
 echo "High CPU reported on CentralFX Webserver. Enabling Under Attack on Cloudflare" | mail -s "Centralfx Potential Attack." linuxadmin@outlook.com,infosec@outlook.com
else
 echo "All Good."
fi
