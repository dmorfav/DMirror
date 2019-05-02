#!/bin/bash

clear
echo "Actualizando repositorio Backports"
 
# introduce la direccion de tu repositorio!
HOST=download.jovenclub.cu;
 
# directorio de destino
DEST=$HOME/mirror/debian
 
# verion(es) Debian para replicar
DIST=stretch
 
# arquitectura
ARCH=i386,amd64
 
# log timestamp
logger -t mirror[$$] updating Debian mirror
 
debmirror ${DEST} \
 --nosource \
 --host=${HOST} \
 --dist=${DIST} \
 --root=/repos/debian/stretch-backports \
 --section=stretch-backports,main,contrib,non-free \
 --i18n \
 --arch=${ARCH} \
 
logger -t mirror[$$] finished updating Debian mirror
