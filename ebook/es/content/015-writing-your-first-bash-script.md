# Escribe tu primer script en Bash

Vamos a intentar agrupar lo que hemos aprendido hasta ahora y crear nuestro primer script en Bash

## Planeando el script

Como ejemplo, escribiremos un script que debería recopilar alguna información útil sobre nuestro servidor como:   

* Uso del disco actual
* Uso de la CPU actual
* Uso de la RAM actual
* Controlar la versión exacta del kernel

Siéntete libre de ajustar el script añadiendo o borrando las funcionalidades según tus necesidades.

## Escribiendo el script

Lo primero que necesitas hacer es crear un nuevo archivo con una extensión `.sh`. Yo crearé un archivo llamado `status.sh` ya que el script que crearemos nos dará el estado de nuestro servidor. 

Una vez hayas creado el archivo, ábrelo con tu editor de texto favorito.

Como hemos aprendido en el capítulo 1, en la primera linea de nuestro script en Bash necesitamos especificar el llamado [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)):

```bash
#!/bin/bash
```

El shebang hace dice al sistema operativo que ejecute el script con el ejecutable /bin/bash.

## Añadiendo comentarios

A continuación, como vimos en el capítulo 6, vamos a empezar añadiendo algunos comentarios para que la gente pueda entender fácilmente para que sirve el script. Para hacerlo de manera correcta, después del shebang, puedes añadir lo siguiente: 

```bash
#!/bin/bash

# Script que devuelve el estado actual del servidor 
```

## Añadiendo tu primera variable

Ahora sigamos avanzando y apliquemos lo que hemos aprendido en el capítulo 4 añadiendo algunas variables que podríamos utilizar en todo el script.

Para asignar un valor a una variable en bash, sólo tienes que usar el símbolo `=`. Por ejemplo, vamos a almacenar el nombre de nuestro servidor en una variable que podremos usar más adelante.

```bash
server_name=$(hostname)
```

Usando `$()`le decimos a bash que interprete el comando y luego le asigne el valor a nuestra variable.

Ahora si hacemos un `echo` de la variable veriamos el nombre actual del servidor. 

```bash
echo $server_name
```

## Añadiendo tu primera función

Como ya sabrás después de leer el capítulo 12, para crear una función en bash necesitas usar la siguiente estructura: 

```bash
function function_name() {
    your_commands
}
```

Vamos a crear una función que devuelva el uso actual de la memoria en nuestro servidor:

```bash
function memory_check() {
    echo ""
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo ""
}
```

Una vista rápida de la función:

* `function memory_check() {` - Esto es como definimos la función
* `echo ""` - Aquí imprimimos una nueva línea
* `echo "The current memory usage on ${server_name} is: "` - aquí imprimimos un pequeño mensaje y la variable `$server_name` 
* `}` - finalmente así es como cerramos la función.

Una vez la función ha sido definida, para llamarla, sólo tenemos que usar el nombre de la función:

```bash
# Define la función
function memory_check() {
    echo ""
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo ""
}

# Llama a la función
memory_check
```

## El desafío de agregar más funciones

Antes de comprobar la solución, te desafío a usar la función de arriba y escribir algunas funciones por tí mismo.

Las funciones deberían hacer lo siguiente:

* Uso actual del disco
* Uso actual de la CPU
* Uso actual de la RAM
* Controlar la versión exacta del kernel

Siéntete libre de usar google para obtener esa información si no estás seguro de los comandos que necesitas usar.

Una vez que termines, siéntete libre de seguir leyendo y comprobar como lo hemos hecho para comparar los resultados. 

Ten en cuenta que hay múltiples maneras correctas de hacerlo.

## El script de ejemplo

Así es como se vería el resultado final:

```bash
#!/bin/bash

##
# script en BASH que comprueba:
#	- Uso de memoria
#	- Carga de CPU
#	- Número de conexiones TCP
#	- Versión de kernel
##

server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

all_checks
```

## Conclusión

Hacer scripts en Bash es muy útil! No importa si eres un ingeniero, desarrollador o sólo un entusiasta de Linux, puedes usar los scripts en Bash para combinar diferentes comandos de Linux y automatizar tareas diarias, aburridas y repetitivas para poder enfocarte en cosas más productivas y divertidas.  

>{aviso} Esto fue inicialmente publicado en [DevDojo.com](https://devdojo.com/bobbyiliev/introduction-to-bash-scripting)
