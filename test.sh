PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

exclude=""
filter=(
"*.bak"
".*"
"/usr/jails/basejail/data/"
)
for i in "${filter[@]}" ; do
  exclude="$exclude --exclude=$i"
done 

date=`date +%Y%m%d`

targetDir1="/usr/jails"
targetDir2="/usr/local/etc/ezjail/"
targetFile="/etc/rc.conf /etc/rc.local /etc/fstab /etc/fstab.* /etc/crontab /usr/local/etc/ezjail.conf"
zipFile="/tmp/backup_jails_$date.tar.bz2"
  
DataDir="/usr/jails/basejail/data/"

tar -jcf $zipFile $EXCLUDE -C $targetDir1 $(ls $targetDir1) $targetDir2 $(ls $targetDir2) $targetFile

cp $zipFile $DataDir
ls -al $DataDir
exit 0;
