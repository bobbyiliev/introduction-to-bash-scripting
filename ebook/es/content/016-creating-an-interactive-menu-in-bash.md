# Creando un menú interactivo en Bash

En este tutorial te enseñaré como puedes crear un menú multi-opción en Bash para que tus usuarios puedan escoger que acción debería ser ejecutada.

Reutilizaremos algo de código del capítulo anterior, así que si no lo has leído todavía asegurate de hacerlo.

## Planeando la funcionalidad

Empezaremos otra vez repasando la principal funcionalidad del script:

* Controlar el uso del disco actual
* Controlar el uso de la CPU actual
* Controlar el uso de RAM actual
* Controlar la versión exacta del kernel

En el caso de que no lo tengas a mano, aquí está el script:

```bash
#!/bin/bash

##
# Menú del script en Bash que controla:
#	- Uso de memoria
#	- Carga de CPU
#	- Número de conexiones TCP
#	- Versión de kernel
##

nombre_de_servidor=$(hostname)

function chequeo_de_memoria() {
    echo ""
	echo "Uso de memória en ${nombre_de_servidor} es: "
	free -h
	echo ""
}

function Chequeo_de_CPU() {
    echo ""
	echo "Carga de CPU en ${nombre_de_servidor} es: "
    echo ""
	uptime
    echo ""
}

function chequeo_tcp() {
    echo ""
	echo "Conexiones TCP en ${nombre_de_servidor}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function chequeo_del_kernel() {
    echo ""
	echo "Versión del kernel en ${nombre_de_servidor} es: "
	echo ""
	uname -r
    echo ""
}

function todos_los_chequeos() {
	chequeo_de_memoria
	chequeo_de_cpu
	chequepo_tcp
	chequeo_del_kernel
}
```

Construiremos un menú que permita al usuario escoger que función será ejecutada.

Por supuesto, puedes ajustar la función o añadir nuevas dependiendo de lo que necesites.

## Añadiendo colores

Con el fin de hacer el menú un poco más 'legible' y fácil de comprender a primera vista, añadiremos algunas funciones de color.

Al principio de tu script añade las siguientes funciones de color:

```bash
##
# Variables de color
##
verde='\e[32m'
azul='\e[34m'
clear='\e[0m'

##
# Funciones de color
##

ColorGreen(){
	echo -ne $verde$1$clear
}
ColorBlue(){
	echo -ne $azul$1$clear
}
```

Puedes usar las funciones de color de la siguiente manera:

```bash
echo -ne $(ColorAzul 'Escribe tu texto aquí')
```

La línea de encima imprimirá por pantalla un string `Escribe tu texto aquí` y será azul.

# Añadiendo el menú

Finalmente, para añadir el menú, crearemos una función separada con un switch case para nuestro menú de opciones:

```bash
menu(){
echo -ne "
Mi Menu
$(ColorVerde '1)') Uso de memoria
$(ColorVerde '2)') Carga de CPU
$(ColorVerde '3)') Número de conexiones TCP
$(ColorVerde '4)') Versión del kernel
$(ColorVerde '5)') Chequear todo
$(ColorVerde '0)') Salir
$(ColorAzul 'Selecciona una opción:') "
        read a
        case $a in
	        1) chequeo_de_memoria ; menu ;;
	        2) chequeo_de_cpu ; menu ;;
	        3) chequeo_tcp ; menu ;;
	        4) chequeo_del_kernel ; menu ;;
	        5) todos_los_chequeos ; menu ;;
			0) exit 0 ;;
			*) echo -e $red"Opción incorrecta."$clear; WrongCommand;;
        esac
}
```

### Echemos un vistazo al código

Primero imprimimos las opciones del menú con algún color:

```
echo -ne "
Mi Menu
$(ColorVerde '1)') Uso de memoria
$(ColorVerde '2)') Carga de CPU
$(ColorVerde '3)') Número de conexiones TCP
$(ColorVerde '4)') Versión del kernel
$(ColorVerde '5)') Chequear todo
$(ColorVerde '0)') Salir
$(ColorAzul 'Selecciona una opción:') "
```

Después leemos la respuesta del usuario y la almacenamos en la variable llamada `$a`:

```bash
        read a
```

Finalmente, tenemos un switch case con desencadenadores a diferentes funciones dependiendo del valor de `$a`:

```bash
        case $a in
	        1) chequeo_de_memoria ; menu ;;
	        2) chequeo_de_cpu ; menu ;;
	        3) chequeo_tcp ; menu ;;
	        4) chequeo_del_kernel ; menu ;;
	        5) todos_los_chequeos ; menu ;;
			0) exit 0 ;;
			*) echo -e $red"Opción incorrecta."$clear; WrongCommand;;
        esac
```

Al final es necesario llamar a la función menú para imprimir el menú:

```bash
# Llama a la función menú
menu
```

## Probando el script

Al final tu script se verá así:

```bash
#!/bin/bash

##
# Menú del script en Bash que controla:
#	- Uso de memoria
#	- Carga de CPU
#	- Número de conexiones TCP
#	- Versión de kernel
##

nombre_de_servidor=$(hostname)

function chequeo_de_memoria() {
    echo ""
	echo "Uso de memória en ${nombre_de_servidor} es: "
	free -h
	echo ""
}

function Chequeo_de_CPU() {
    echo ""
	echo "Carga de CPU en ${nombre_de_servidor} es: "
    echo ""
	uptime
    echo ""
}

function chequeo_tcp() {
    echo ""
	echo "Conexiones TCP en ${nombre_de_servidor}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function chequeo_del_kernel() {
    echo ""
	echo "Versión del kernel en ${nombre_de_servidor} es: "
	echo ""
	uname -r
    echo ""
}

function todos_los_chequeos() {
	chequeo_de_memoria
	chequeo_de_cpu
	chequepo_tcp
	chequeo_del_kernel
}

##
# Variables de color
##
verde='\e[32m'
azul='\e[34m'
clear='\e[0m'

##
# Funciones de color
##

ColorVerde(){
	echo -ne $verde$1$clear
}
ColorAzul(){
	echo -ne $azul$1$clear
}

menu(){
echo -ne "
Mi Menu
$(ColorVerde '1)') Uso de memoria
$(ColorVerde '2)') Carga de CPU
$(ColorVerde '3)') Número de conexiones TCP
$(ColorVerde '4)') Versión del kernel
$(ColorVerde '5)') Chequear todo
$(ColorVerde '0)') Salir
$(ColorAzul 'Selecciona una opción:') "
        read a
        case $a in
	        1) chequeo_de_memoria ; menu ;;
	        2) chequeo_de_cpu ; menu ;;
	        3) chequeo_tcp ; menu ;;
	        4) chequeo_del_kernel ; menu ;;
	        5) todos_los_chequeos ; menu ;;
			0) exit 0 ;;
			*) echo -e $red"Opción incorrecta."$clear; WrongCommand;;
        esac
}


# Llama a la función menú
menu
```

Para probar el script, crea un nuevo archivo con una extensión `.sh`, por ejemplo: `menu.sh`y después ejecútalo:

```bash
bash menu.sh
```

La salida debe verse así:

```bash
Mi Menu
1) Uso de memória
2) Carga de CPU
3) Número de conexiones TCP
4) Versión del kernel
5) Chequear todo
0) Salir
Selecciona una opción:
```

Deberás ser capaz de escoger una opción diferente de la lista y cada número deberá llamar a una función diferente del script:  

![Bonito menú interactivo de Bash](https://imgur.com/8EgxX4m.png)

## Conclusión

Ahora sabes cómo crear un menú en Bash e implementarlo en tus scripts para que los usuarios puedan selecionar diferentes valores.

>{aviso} Este contenido ha sido inicialmente publicado en [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)