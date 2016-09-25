PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#!/bin/sh
#filter=$@
#set "*.bak" ".*" "/usr/jails/basejail/data/"
#for i in $@
#do
#  exclude="$exclude --exclude=$i"
#done
#set $filter

exclude="--exclude=*.log --exclude=*.tmp --exclude=/usr/jails/basejail --exclude=/usr/jails/newjail"

date=`date +%Y%m%d`

targetDir="/usr/local/etc/ezjail/* /usr/jails/*"
targetFile="/etc/rc.conf /etc/rc.local /etc/fstab /etc/fstab.* /etc/crontab /usr/local/etc/ezjail.conf"
zipFile="/tmp/backup_jails_$date.tar.gz"

tar $exclude -zcvpPf $zipFile -C $targetDir $targetFile

mv $zipFile /usr/jails/basejail/data/backup-from-server/

ls -al $DataDir
exit 0;

