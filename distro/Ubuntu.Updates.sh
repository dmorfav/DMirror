#!/bin/bash

clear
echo "Actualizando repositorio Updates"
 
# introduce la direccion de tu repositorio!
HOST=repositorios.une.cu;
 
# directorio de destino
DEST=$HOME/mirror/ubuntu
 
# verion(es) Debian para replicar
DIST=bionic
 
# arquitectura
ARCH=i386,amd64
 
# log timestamp
logger -t mirror[$$] updating Ubuntu mirror
 
debmirror ${DEST} \
 --nosource \
 --host=${HOST} \
 --dist=${DIST} \
 --root=/ubuntu \
 --section=bionic-updates,main,restricted,multiverse,universe \
 --i18n \
 --arch=${ARCH} \
 
logger -t mirror[$$] finished updating Ubuntu mirror
