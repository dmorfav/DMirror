#!/bin/bash
 
# introduce la direccion de tu repositorio!
HOST=ftp.debian.org;
 
# directorio de destino
DEST=$HOME/mirror/debian
 
# verion(es) Debian para replicar
DIST=stretch
 
# arquitectura
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
