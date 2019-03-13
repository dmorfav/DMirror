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
function makeDir(){
#Directorio donde se almacenan los repositorios
DIR="$HOME/mirror";
#//TODO revisar porque da error esta condicion
if [$# -eq 0];
   then 
	mkdir $DIR >/dev/null 2>&1
	if [ $? -eq 0 ];
    		then
    			echo "$DIR ha sido creado"
		else
    			echo "$DIR no pudo ser creado porque ya existe"
	fi
else 
	mkdir $DIR/$1 >/dev/null 2>&1
	if [ $? -eq 0 ];
    		then
    			echo "$DIR/$1 ha sido creado"
		else
    			echo "$DIR/$1 no pudo ser creado porque ya existe"
	fi
fi
}

case $distro in
     1 )
	main='./distro/Kali.Main.sh'
	makeDir	
	makeDir kali
	/bin/bash $main 2> $HOME/mirror/kali/error_mirror.log
	;;
     2 ) 
	main='./distro/Debian.Main.sh'
	makeDir	
	makeDir debian
	/bin/bash $main 2> $HOME/mirror/debian/error_mirror.log
	;;
esac  
