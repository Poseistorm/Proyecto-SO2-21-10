#!/bin/bash
clear
echo "Ingrese la CI"
read CI
echo "Ingrese el nro de depto"
read depto

if [ `cat BBDD/Propietarios | grep "$CI:$depto" -c` -eq 1 ]
then
  echo "Esta persona debe: "

  dinero=$(cat BBDD/Propietarios| grep "$CI:$depto" | cut -d: -f5)

  echo "$dinero"

  echo "Cuando dinero quiere ingresar?"
  read monto

  let balance=$dinero-$monto
  echo "$balance"
  

fi
