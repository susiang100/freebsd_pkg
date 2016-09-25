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

exclude="--exclude=.* --exclude=/usr/jails/basejail/data"

date=`date +%Y%m%d`

targetDir="/usr/local/etc/ezjail/* /usr/jails/*"
targetFile="/etc/rc.conf /etc/rc.local /etc/fstab /etc/fstab.* /etc/crontab /usr/local/etc/ezjail.conf"
zipFile="/tmp/backup_jails_$date.tar.gz"

tar $exclude -zcvpPf $zipFile -C $targetDir $targetFile

cp $zipFile $DataDir
ls -al $DataDir
exit 0;
