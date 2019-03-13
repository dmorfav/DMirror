#!/bin/bash

####################################################
# 	Nombre del Archivo: START.mirror.sh        #
# 	Fecha: 08-11-2017			   #
# 	Version 1.0				   #
####################################################


echo "Script para Mirrors a distribuciones linux"
echo "Seleccione una distribución"
echo "####################################################"
echo "# 1-Kali                                           #"
echo "# 2-Debian                                         #"
echo "####################################################"
read distro 

# Script responsable del repositorio

 #Directorio donde se almacenan los repositorios
 DIR="$HOME/mirror" 

mkdir $DIR

if [ $? -eq 0 ];
    then
    echo "$DIR ha sido creado"
else
    echo "$DIR no pudo ser creado"
fi

case $distro in
     1 )
	main='Kali.Main.sh'
	echo "Creado directorio $DIR/kali"
	mkdir -p $DIR/kali
	/bin/bash $main 2> $DIR/kali/error_mirror.log
	;;
     2 ) 
	main='Debian.Main.sh'
	echo "Creado directorio $DIR/debian"
	mkdir -p $DIR/debian
	/bin/bash $main 2> $DIR/debian/error_mirror.log
	;;
esac  
