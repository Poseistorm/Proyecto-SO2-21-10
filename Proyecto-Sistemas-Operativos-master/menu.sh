#!/bin/bash
clear
sh shelllogo.sh
sleep 2
sh verificar.sh
let mitad=`tput cols`/2
sh advertencia.sh
let inicio=$mitad-7

op=1
while [ $op -ne 0 ]
do
	clear
	tput cup 0 $inicio
	tput setaf 3
	echo "ADMINISTRACION"
	tput setaf 2
	tput cup 1 1
	echo "0. Salir"
	tput cup 2 1
	echo "1. Ingresar nuevo pago"
	tput cup 3 1
	echo "2. Estado de cuenta"
	tput cup 4 1
	echo "3. Situacion del propietario"
	tput sgr0
	echo -n "Elije:"
	read op

	case $op in

		1)
			echo "seleccionaste op1"
			sh ingreso.sh
			;;
		2)
			echo "seleccionaste op2"
			sh advertencia.sh
	
			;;
	
		3)
			echo "seleccionaste op3"
		
			;;
	
		0)
			echo "Saliendo..."
			;;
		*) 
			echo "Incorrecto"
			;;
	esac
	sleep 1
done
	
