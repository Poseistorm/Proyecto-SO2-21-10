#!/bin/bash
sh shelllogo.sh
 
bash verificar.sh

op=19

while [ $op -ne 4 ]
do
	clear
	let mitad=`tput cols`/2

	tput cup 0 `expr $mitad - 7`
	tput setaf 3
	echo "MENU ADMIN"
	tput setaf 2
	tput cup 1 1
	echo "1.Ingresar usuario"
	tput cup 2 1
	echo "2.Crear usuario"
	tput cup 3 1
	echo "3.Cambiar contrasenia"
	tput cup 4 1
	echo "4.Salir"
	tput sgr0

	echo -n "Opcion: "
	read op
	case $op in
		1)

			op=19

			while [ $op -ne 4 ]
			do
				clear
				tput cup 0 `expr $mitad - 7`
				tput setaf 3
				echo "INGRESA USUARIO"
				tput setaf 2
				tput cup 1 1
				echo "Usuario:"
				tput cup 2 1
				echo "Contrasenia:"
				tput cup 1 9
				read usr
				tput cup 2 13
				read pass
				if [ `cat datosAdmin | grep "$usr:$pass" -c` -eq 1 ]
				then
					op=4
					bash menu.sh
				else
					tput cup 60 90
					tput setab 1
					tput setaf 7
					tput cup 62 0
					echo ""
					echo ""
					echo ""
					echo ""
					echo ""
					tput setab 16
					tput cup 63 `expr $mitad - 40`
					echo "Usuario o contrasenia incorrectos: desea reintentar (s/n):"
					read cont
					if [ $cont = "n" ]
					then
						op=4
						clear
					fi
					tput sgr0
				fi
			done
			;;
		2)
			clear
			op=0
			while [ $op -ne 4 ]
			do
				tput cup 0 `expr $mitad - 7`
				tput setaf 3
				echo "REGISTRO"
				tput setaf 2
				tput cup 1 1
				echo "Ingrese usuario:"
				tput cup 2 1
				echo "Ingrese contrasenia:"
				tput cup 3 1

				echo "Repite contrasenia:"
				tput cup 1 17
				read usr


				if [ $usr ]
				then
					tput cup 2 21
					read pass0
					tput cup 3 20
					read pass1
					if [ $pass0 ]
					then
						if [ $pass0 = $pass1 ]
						then
							if [ `cat datosAdmin | grep "$usr:$pass0" -c` -eq 0 ]
							then
								echo "$usr:$pass1" >> datosAdmin

								tput setaf 7
								tput cup 63 `expr $mitad - 40`
								echo "Ha sido registrado"
								sleep 2
								op=4
							else
								tput cup 60 90
								tput setab 1
								tput setaf 7
								tput cup 62 0
								echo ""
								echo ""
								echo ""
								echo ""
								echo ""
								tput setaf 7
								tput cup 63 `expr $mitad - 40`
								echo "Este usuario ya ha sido registrado"
								tput sgr0	
							fi
						else
							tput cup 60 90
							tput setab 1
							tput setaf 7
							tput cup 62 0
							echo ""
							echo ""
							echo ""
							echo ""
							echo ""
							tput setaf 7
							tput cup 63 `expr $mitad - 40`
							echo "Las contrasenias no coinciden"
							tput sgr0
						fi
					else
						tput cup 60 90
						tput setab 1
						tput setaf 7
						tput cup 62 0
						echo ""
						echo ""
						echo ""
						echo ""
						echo ""
						tput setaf 7
						tput cup 63 `expr $mitad - 40`
						echo "La contrasenia no puede ser nula"
						tput sgr0
					fi
				else
					tput cup 60 90
					tput setab 1
					tput setaf 7
					tput cup 62 0
					echo ""
					echo ""
					echo ""
					echo ""
					echo ""
					tput setaf 7
					tput cup 63 `expr $mitad - 40`
					echo "Usuario no puede ser nulo"
					tput sgr0
				fi
				sleep 2
				tput setab 16
				clear
			done
			;;
		3)
			echo "3"
			;;
		4)
			echo "Nos vemos luego!!!!!!!!!!"
			op=4
			;;
		*)
			tput cup 60 90
			tput setab 1
			tput setaf 7
			tput cup 62 0
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			tput setab 16
			tput setab 1
			tput cup 62 `expr $mitad - 10`
			echo "Ingreso una opcion incorrecta"
			tput sgr0
		   	;;
	esac
done
clear
