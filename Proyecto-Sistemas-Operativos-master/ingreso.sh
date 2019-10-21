#!/bin/bash



fecha=`date +%D`
dia=$(echo $fecha | cut -d'/' -f2)
menu=1 
while [ $menu -ne 0 ]
do
  #statements

  clear
  
  

  let mitad=`tput cols`/2
  tput sgr0
  echo -n "Ingrese la CI:"
  read CI
  echo -n "Ingrese el nro de depto:"
  read depto

  if [ `grep "$CI:$depto" BBDD/Propietarios -c` -eq 1 ]
  then
    echo "Esta persona debe: "
    dinero=$(grep "$CI:$depto" BBDD/Propietarios | cut -d: -f5)

    echo "$dinero Pesos"


    echo -n "Cuando dinero quiere ingresar?:"
    read monto
    
    if [ $dia -lt 10 ] 
    then
   		

   

    fi
    
    let balance=$dinero-$monto
    nombre=`grep "$CI:$depto" BBDD/Propietarios | cut -d: -f3`
    ape=`grep "$CI:$depto" BBDD/Propietarios | cut -d: -f4`
    fechadebe=`grep "$CI:$depto" BBDD/Propietarios | cut -d: -f6`

#Guardo pago



#Actualizo Propietario


    grep -v "$CI:$depto" BBDD/Propietarios > BBDD/PropietariosAux
    rm BBDD/Propietarios
    mv BBDD/PropietariosAux BBDD/Propietarios
    echo "$CI:$depto:$nombre:$ape:$balance:$fechadebe" >> BBDD/Propietarios 
	
	echo -n "Desea Continuar(s/n):"   
    read op
    if [ $op = 'n' ]
    then
	menu=0
    fi
 else 
    tput cup 60 90
    tput setab 1
    tput setaf 7
    tput cup 62 0

	echo ''
    echo ''
    tput setaf 7
    tput cup 32 `expr $mitad - 40`
    echo -n 'La persona ingresada no esta registrada: desea reintentar (s/n):'
    tput cup 31 83
    read cont
    tput sgr0
    if [ $cont = 'n' ]
    then
      menu=0
      clear
    fi
  fi
  
done
