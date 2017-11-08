#!/bin/bash
#
# Script principal para la puesta en funcionamiento
# del Mirror local de Kali Linux
#
# Nombre del Archivo: START.mirror.sh
# Fecha: 08-11-2017
# Version 1.0
####################################################

# Directorio de Descarga
rutaWork='/home/ronadmin/Kalimirror'
cd $rutaWork
# Script responsable del repositorio
main='Kali.Main.sh'

/bin/bash $rutaWork/$main 2> $rutaWork/error_mirror.log
sleep 10
exit
