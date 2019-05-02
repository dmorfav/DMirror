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

	/bin/bash $main 2> $HOME/mirror/kali/error_mirror.log
	;;
     "deb" ) 
	main='./distro/Debian.Main.sh'
	backports='./distro/Debian.Backports.sh'
	multimedia='./distro/Debian.Multimedia.sh'
	security='./distro/Debian.Security.sh'
	updates='./distro/Debian.Updates.sh'

	makeDir	
	makeDir debian
	gpg --no-default-keyring --keyring trustedkeys.gpg --import /usr/share/keyrings/debian-archive-keyring.gpg
	/bin/bash $main 2> $HOME/mirror/debian/error_main_mirror.log
	/bin/bash $backports 2> $HOME/mirror/debian/error_backports_mirror.log
	/bin/bash $multimedia 2> $HOME/mirror/debian/error_multimedia_mirror.log
	/bin/bash $security 2> $HOME/mirror/debian/error_security_mirror.log
	/bin/bash $updates 2> $HOME/mirror/debian/error_updates_mirror.log
	;;
esac  
