#!/bin/sh

[ $(id -u) != 0 ] && { echo "Not root. Exiting."; exit; }

WORKING_DIR="/tmp/.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)"
ARCHIVE_NAME="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1).tar.gz"

mkdir $WORKING_DIR && cd $WORKING_DIR
wget https://github.com/Kellermaenn/vlany.fixed/archive/master.zip -O $ARCHIVE_NAME
unzip $ARCHIVE_NAME && rm $ARCHIVE_NAME
cd vlany.fixed-master
chmod +x install.sh
./install.sh

rm -rf $WORKING_DIR
