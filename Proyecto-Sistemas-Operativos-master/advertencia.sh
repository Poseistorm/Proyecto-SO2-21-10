#!/bin/bash
let lineaInicial=`tput lines`-3
let colMitad=`tput cols`/2
tput cup $pos 0
tput setab 1
tput setaf 7
if true
then
	let filaAdvertencia=$lineaInicial+1
	let filaNoPago=$lineaInicial+2
	let colAdvertencia=$colMitad-7
	let colNoPago=$colMitad-20
	tput cup $filaAdvertencia
	echo -n ""
	tput cup $filaAdvertencia $colAdvertencia
	echo "ADVERTENCIA"
	tput cup $filaNoPago $colNoPago
	echo "Los siguientes usuarios no han pagado hace 4 meses o mas"
	echo ""
fi
tput setab 0