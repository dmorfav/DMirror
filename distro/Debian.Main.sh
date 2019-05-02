#!/bin/bash
 
# sourcehost: choose a mirror in your proximity!
HOST=ftp.debian.org;
 
# destination directory
DEST=$HOME/mirror/debian
 
# Debian version(s) to mirror
DIST=stretch
 
# architecture
ARCH=i386,amd64
 
# log timestamp
logger -t mirror[$$] updating Debian mirror
 
su root -c \
 "debmirror ${DEST} \
 --nosource \
 --host=${HOST} \
 --root=/debian \
 --dist=${DIST} \
 --section=main,contrib,non-free,main/debian-installer \
 --i18n \
 --arch=${ARCH} \
 --passive --cleanup \
 $VERBOSE"
 
logger -t mirror[$$] finished updating Debian mirror
