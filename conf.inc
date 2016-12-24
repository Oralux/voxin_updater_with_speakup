
DISTRO="Vinux 5.0"

VOXIN_VERSION=1.6
VOXIN_URL=http://voxin.oralux.net/update/voxin-update-$VOXIN_VERSION.tgz

VOXINUP_VERSION=1.2+u1404
VOXINUP_DIR=voxinup_install-1.2-u1404
VOXINUP_URL=https://soft.oralux.net/speakup/voxinup_install/vinux/voxinup_install-$VOXINUP_VERSION.tar.gz

BASE=$PWD
LOG=$BASE/log/install_voxin_updater_with_speakup.log
LOG2=$BASE/log/uninstall_voxin_updater_with_speakup.log

mkdir -p $BASE/log $BASE/build
