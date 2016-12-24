#!/bin/bash
# 2016, Gilles Casse <gcasse@oralux.org>
#

. ./conf.inc

if [ "$(id -u)" != "0" ]; then
    echo "please run this script as root."
    exit 0
fi  

echo "This script update voxin and install its speakup connector on $DISTRO"
echo "Please note that:"
echo "- espeakup will be uninstalled,"
echo "- the speakup connector can prevent the use of audio by other softwares (Orca, Emacspeak, aplay,...)."
echo "This script will reboot your system at the end"
echo "If you agree to start, type yes and Enter"
read a

if [ "$a" != "yes" ]; then
    echo "Bye"
    exit 1
fi 

rm -f $LOG

cd build

echo "Step 1: updating Voxin to version $VOXIN_VERSION"
if [ ! -d "voxin-$VOXIN_VERSION" ]; then
    wget $VOXIN_URL &>> $LOG
    tar -zxf voxin-update-$VOXIN_VERSION.tgz &>> $LOG
fi
cd voxin-$VOXIN_VERSION/voxin-update-$VOXIN_VERSION
./voxin-installer.sh

cd $BASE/build
echo "Step 2: installing Voxinup"

if [ ! -d "$VOXINUP_DIR" ]; then
    wget "$VOXINUP_URL" &>> $LOG
    tar -zxf voxinup_install-$VOXINUP_VERSION.tar.gz &>> $LOG
fi

cd $VOXINUP_DIR
./install.sh
reboot
