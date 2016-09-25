PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH
EXCLUDE=""
FILTER=(
"*.bak"
".*"
"/usr/jails/basejail/data/"
)
for i in "${FILTER[@]}" ; do
EXCLUDE="$EXCLUDE --exclude=$i"
done

DATE=$(date +%Y%m%d)

TARGET_DIR1="/usr/jails"
TARGET_DIR2="/usr/local/etc/ezjail/"
TARGET_FILE1="/etc/rc.conf /etc/rc.local /etc/fstab /etc/fstab.* /etc/crontab /usr/local/etc/ezjail.conf"
ZIP_FILE="/tmp/backup_jails_$DATE.tar.bz2"
  
DATA_DIR="/usr/jails/basejail/data/"

tar -jcf $ZIP_FILE $EXCLUDE -C $TARGET_DIR1 $(ls $TARGET_DIR1) $TARGET_DIR2 $(ls $TARGET_DIR2) $TARGET_FILE1

cp $ZIP_FILE $DATA_DIR
ls -al $DATA_DIR
exit 0;
