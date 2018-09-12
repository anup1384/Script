#!/usr/bin/env bash
MAIL_FROM=anup.hnu@outlook.com
MAIL_TO=anup.hnu@gmail.com
MAIL_SUBJECT="Alert: Child table is not created"
MESSAGE="Table will be created on 1st of next month or create manually"



readonly connections=(       
                        
                            
                            'stg.anup.com|JeVMzRRUnI4VHXdHRggK3k8P2BDHGv54'
                            'qa.anup.com|IQYKgbPOx4mb8xXyD6xaNjjWmxqENS2Q'
                            'dev.anup.com|IE1qhWwlY72E3VivrlzfAxtrxa9GOYYk'
                    )

function set_connections(){
    local url api
    for fields in ${connections[@]}
    do
            IFS=$'|' read -r url api <<< "$fields"
         status=`curl -s -o /dev/null -w "%{http_code}" "https://"$url"/api/v1/create_tables?nextMonth=true&api_key="$api""`
     echo $status
if [ "$status" -ne "200" ];
then
echo -e "From: ${MAIL_FROM} \nTo: ${MAIL_TO} \nSubject:${MAIL_SUBJECT} on "$url" with status code "$status""\
"\n\n${MESSAGE}" | /usr/sbin/sendmail -f ${MAIL_FROM} ${MAIL_TO}
fi
      
 
    done
}

set_connections

