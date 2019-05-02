#!/bin/bash

####################################################
# 	Nombre del Archivo: START.mirror.sh        #
# 	Fecha: 08-11-2017			   #
# 	Version 1.0				   #
####################################################

# Script responsable del repositorio 
function makeDir(){
#Directorio donde se almacenan los repositorios
DIR="$HOME/mirror";
	mkdir $DIR/$1 >/dev/null 2>&1
	if [ $? -eq 0 ];
    		then
    			echo "$DIR ha sido creado"
		else
    			echo "$DIR no pudo ser creado porque ya existe"
	fi
}

case $1 in
     "kal" )
	main='./distro/Kali.Main.sh'
	makeDir	
	makeDir Kali
	gpg --no-default-keyring --keyring trustedkeys.gpg --import /usr/share/keyrings/debian-archive-keyring.gpg
	gpg --list-keys --keyring trustedkeys.gpg
	/bin/bash $main 2> $HOME/mirror/kali/error_mirror.log
	;;
     "deb" ) 
	main='./distro/Debian.Main.sh'
	makeDir	
	makeDir debian
	/bin/bash $main 2> $HOME/mirror/debian/error_mirror.log
	;;
esac  
