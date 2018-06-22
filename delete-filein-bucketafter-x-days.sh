#!/bin/bash
 aws s3 ls s3://$1 | while read -r line;
 do 
    createDate=`echo $line|awk {'print $1" "$2'}`
    createDate=`date -d"$createDate" +%s`
    olderThan=`date -d"-$2" +%s`
    if [[ $createDate -lt $olderThan ]]
      then 
        fileName=`echo $line|awk {'print $4'}`
        echo $fileName
#        if [[ $fileName != "" ]]
#          then
#            aws s3 rm  s3://$1/"$fileName"
#       fi
    fi
 done;
