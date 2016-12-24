#!/bin/bash
# 2016, Gilles Casse <gcasse@oralux.org>
#

. ./conf.inc

if [ "$(id -u)" != "0" ]; then
    echo "please run this script as root."
    exit 0
fi  

echo "This script uninstalls the speakup connector on $DISTRO and reinstalls espeakup"
echo "This script will reboot your system"
echo "If you agree to start, type yes and Enter"
read a
if [ "$a" != "yes" ]; then
    echo "Bye"
    exit 1
fi 

rm -f $LOG2

cd $BASE/build
if [ ! -d "$VOXINUP_DIR" ]; then
    wget $VOXINUP_URL &>> $LOG2
    tar -zxf voxinup_install-$VOXINUP_VERSION.tar.gz &>> $LOG2
fi

cd $VOXINUP_DIR
./uninstall.sh
reboot
