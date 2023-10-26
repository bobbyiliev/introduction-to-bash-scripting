# Escribe tu primer script Bash

¡Intentemos reunir lo que hemos aprendido hasta ahora y crear nuestro primer script Bash!

## Planificando el guión

Como ejemplo, escribiremos un script que recopilará información útil sobre nuestro servidor como:

* Uso actual del disco
* Uso actual de la CPU
* Uso actual de RAM
* Verifique la versión exacta del Kernel

Siéntase libre de ajustar el script agregando o eliminando funciones para que se ajuste a sus necesidades.

## Escribiendo el guión

Lo primero que debe hacer es crear un nuevo archivo con una extensión `.sh`. Crearé un archivo llamado `status.sh` ya que el script que crearemos nos dará el estado de nuestro servidor.

Una vez que haya creado el archivo, ábralo con su editor de texto favorito.

Como aprendimos en el capítulo 1, en la primera línea de nuestro script Bash debemos especificar el llamado [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)):

```golpecito
#!/bin/bash
```

Todo lo que hace el shebang es indicarle al sistema operativo que ejecute el script con el ejecutable /bin/bash.

## Agregar comentarios

A continuación, como se discutió en el capítulo 6, comencemos agregando algunos comentarios para que la gente pueda entender fácilmente para qué se usa el script. Para hacerlo justo después del shebang, simplemente puede agregar lo siguiente:

```golpecito
#!/bin/bash

# Script que devuelve el estado actual del servidor
```

## Agregando tu primera variable

Luego sigamos adelante y apliquemos lo que hemos aprendido en el capítulo 4 y agreguemos algunas variables que quizás queramos usar en todo el guión.

Para asignar un valor a una variable en bash, solo tienes que usar el signo `=`. Por ejemplo, almacenemos el nombre de host de nuestro servidor en una variable para poder usarlo más tarde:

```golpecito
nombre_servidor=$(nombre de host)
```

Al usar `$()` le decimos a bash que realmente interprete el comando y luego asigne el valor a nuestra variable.

Ahora, si hiciéramos eco de la variable, veríamos el nombre de host actual:

```golpecito
echo $nombre_servidor
```

## Agregando tu primera función

Como ya sabes después de leer el capítulo 12, para crear una función en bash necesitas usar la siguiente estructura:

```golpecito
función nombre_función() {
     tus_comandos
}
```

Creemos una función que devuelva el uso de memoria actual en nuestro servidor:

```golpecito
función memoria_check() {
     eco ""
echo "El uso actual de memoria en ${server_name} es: "
libre -h
eco ""
}
```

Desglose rápido de la función:

* `function Memory_check() {` - así es como definimos la función
* `echo ""` - aquí simplemente imprimimos una nueva línea
* `echo "El uso actual de memoria en ${server_name} es: "` - aquí imprimimos un pequeño mensaje y la variable `$server_name`
* `}` - finalmente así es como cerramos la función

Luego una vez definida la función, para llamarla basta con utilizar el nombre de la función:

```golpecito
# Definir la función
función memoria_check() {
     eco ""
echo "El uso actual de memoria en ${server_name} es: "
libre -h
eco ""
}

# Llamar a la función
comprobación de memoria
```

## Desafío de agregar más funciones

Antes de comprobar la solución, te reto a que uses la función anterior y escribas algunas funciones tú mismo.

Las funciones deben hacer lo siguiente:

* Uso actual del disco
* Uso actual de la CPU
* Uso actual de RAM
* Verifique la versión exacta del Kernel

No dude en utilizar Google si no está seguro de qué comandos necesita utilizar para obtener esa información.

Una vez que esté listo, no dude en desplazarse hacia abajo y comprobar cómo lo hemos hecho y comparar los resultados.

¡Tenga en cuenta que existen varias formas correctas de hacerlo!

## El guión de muestra

Así es como se vería el resultado final:

```golpecito
#!/bin/bash

##
# Script BASH que verifica:
#   - Uso de memoria
# - carga de CPU
# - Número de conexiones TCP
#   - Versión del núcleo
##

nombre_servidor=$(nombre de host)

función memoria_check() {
     eco ""
echo "El uso de memoria en ${server_name} es: "
libre -h
eco ""
}

función cpu_check() {
     eco ""
echo "La carga de CPU en ${server_name} es: "
     eco ""
tiempo de actividad
     eco ""
}

función tcp_check() {
     eco ""
echo "Conexiones TCP en ${server_name}: "
     eco ""
gato /proc/net/tcp | baño -l
     eco ""
}

función kernel_check() {
     eco ""
echo "La versión del kernel en ${server_name} es: "
eco ""
uname -r
     eco ""
}

función all_checks() {
comprobación de memoria
CPU_check
tcp_check
kernel_check
}

todos_controles
```

## Conclusión

¡Las secuencias de comandos Bash son increíbles! No importa si es un ingeniero, desarrollador o simplemente un entusiasta de Linux en DevOps/SysOps, puede usar scripts Bash para combinar diferentes comandos de Linux y automatizar tareas diarias aburridas y repetitivas, para que pueda concentrarse en cosas más productivas y divertidas.

>{aviso} Esto se publicó inicialmente en [DevDojo.com](https://devdojo.com/bobbyiliev/introduction-to-bash-scripting)