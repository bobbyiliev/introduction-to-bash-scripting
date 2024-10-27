# Redirección en Bash

Un superusuario de Linux debe tener un buen conocimiento de las pipes y la redirección en Bash. Es un componente esencial del sistema y a menudo es útil en el campo de la Administración de Sistemas Linux.

Cuando ejecuta un comando como ``ls``, ``cat``, etc., obtiene una salida en la terminal. Si escribe un comando incorrecto, pasa una bandera incorrecta o un argumento incorrecto en la línea de comandos, obtendrá un error en la terminal.
En ambos casos, se le da algo de texto. Puede parecerle "sólo texto", pero el sistema trata este texto de forma diferente. Este identificador se conoce como Descriptor de Archivo (fd).

En Linux, hay 3 Descriptores de Archivos, **STDIN** (0); **STDOUT** (1) y **STDERR** (2).

**STDIN** (fd: 0): Gestiona la entrada en el terminal.
**STDOUT** (fd: 1): Gestiona el texto de salida en el terminal.
**STDERR** (fd: 2): Gestiona el texto de error en el terminal.

# Diferencia entre Pipes y Redirecciones

Tanto *pipes* como *redirections* redirigen flujos `(descriptor de archivo)` del proceso que se está ejecutando. La principal diferencia es que  las *redirecciones* tratan con `flujos de archivos`, enviando el flujo de salida a un archivo o enviando el contenido de un archivo dado al flujo de entrada del proceso.

Por otro lado una pipe conecta dos comandos enviando el flujo de salida del primero al flujo de entrada del segundo, sin ninguna redirección especificada.

# Redirección en Bash

## STDIN (Entrada Estándar)
Cuando introduce algún texto de entrada para un comando que lo solicita, en realidad está introduciendo el texto en el descriptor de archivo **STDIN**. Ejecute el comando ``cat`` sin ningún argumento en la línea de comandos.
Puede parecer que el proceso se ha detenido, pero en realidad es ``cat`` preguntando por **STDIN**. ``cat`` es un programa sencillo e imprimirá el texto pasado a **STDIN**. Sin embargo, puede extender el caso de uso redirigiendo la entrada a los comandos que toman **STDIN**.

Ejemplo con ``cat``:
```
cat << EOF
¡Hola Mundo!
¿Cómo estás?
EOF
```
Esto simplemente imprimirá el texto proporcionado en la terminal:
```
¡Hola Mundo!
¿Cómo estás?
```
Lo mismo se puede hacer con otros comandos que toman la entrada a través de STDIN. Como, ``wc``:
```
wc -l << EOF
¡Hola Mundo!
¿Cómo estás?
EOF
```
La bandera ``-l`` usada con ``wc`` cuenta el número de líneas.
Este bloque de código bash imprimirá el número de líneas en la terminal:
```
2
```

## STDOUT (Salida estándar)
El texto normal (que no sea error) ue aparece en la pantalla de su terminal se imprime a través del descriptor de archivo **STDOUT**. El **STDOUT** de un comando puede ser redirigido a un archivo, de tal manera que la salida del comando se escriba en un archivo en lugar de imprimirse en la pantalla de la terminal.
Esto se hace simplemente con la ayuda de los operadores ``>`` y ``>>``.

Ejemplo:
```
echo "¡Hola Mundo!" > archivo.txt
```
El comando anterior no imprimirá "¡Hola Mundo!" en la terminal, en su lugar creará un archivo llamado ``archivo.txt`` y escribirá la cadena de texto "¡Hola Mundo!" en el mismo.
Esto se puede comprobar ejecutando el comando ``cat`` en el archivo ``archivo.txt``.
```
cat archivo.txt
```
Sin embargo, cada vez que redirija el **STDOUT** de cualquier comando varias veces al mismo archivo, eliminará el contenido existente del archivo para escribir el nuevo.

Ejemplo:
```
echo "¡Hola Mundo!" > archivo.txt
echo "¿Cómo estás?" > archivo.txt
```

Al ejecutar ``cat`` en el archivo ``archivo.txt``:
```
cat archivo.txt
```

Sólo se imprimirá la cadena de texto "¿Cómo estás?".
```
¿Cómo estás?
```

Esto se debe a que la cadena de text "¡Hola Mundo!" ha sido sobrescrita.
Este comportamiento puede evitarse utilizando el operador ``>>``.

El ejemplo anterior se puede escribir como:
```
echo "¡Hola Mundo!" > archivo.txt
echo "¿Cómo estás?" >> archivo.txt
```

Al ejecutar ``cat`` en el archivo ``archivo.txt``, obtendrá el resultado deseado.
```
¡Hola Mundo!
¿Cómo estás?
```

Alternativamente, el operador de redirección para **STDOUT** también puede escribirse como ``1>``. Así,
```
echo "¡Hola Mundo!" 1> file.txt
```

## STDERR (Error estándar)
El texto de error en la terminal se imprime a través de **STDERR**. Por ejemplo:
```
ls --hola
```
daría un mensaje de error. Este mensaje de error es la salida del flujo **STDERR** del comando.

**STDERR** puede ser redirigido usando el operador ``2>``.
```
ls --hello 2> error.txt
```

Este comando redirigirá el mensaje de error al archivo ``error.txt`` y lo escribirá en él. Esto puede verificarse ejecutando el comando ``cat`` en el archivo ``error.txt``.

También puede usar el operador ``2>>`` para **STDERR** del mismo que usó ``>>`` para **STDOUT**.

Los mensajes de error en scripts Bash pueden ser indeseables a veces. Puede elegir ignorarlos redirigiendo el mensaje de error al archivo ``/dev/null``.
``/dev/null`` es un pseudo-dispositivo que recibe texto y lo descarta inmediatamente.

El ejemplo anterior puede escribirse de la siguiente manera para ignorar completamente el texto de error:
```
ls --hello 2> /dev/null
```

Por supuesto, puede redirigir tanto **STDOUT** como **STDERR** en el mismo comando o script.
```
./instalar_paquete.sh > salida.txt 2> error.txt
```

Ambos pueden ser redirigidos al mismo archivo también.
```
./instalar_paquete.sh > archivo.txt 2> archivo.txt
```

También hay una forma más corta de hacer esto.
```
./instalar_paquete.sh > archivo.txt 2>&1
```

# Canalización (Piping)

Hasta ahora hemos visto como redirigir el **STDOUT**, **STDIN** y **STDOUT** desde y hacia un archivo.
Para concatenar la salida del programa *(comando)* como entrada de otro programa *(comando) * se puede utilizar una barra vertical `|`. Esto se conoce como canalización (más popularmente por su nombre en inglés: ``piping``).

Ejemplo:
```
ls | grep ".txt"
```
Este comando listará los archivos en el directorio actual y pasará la salida al comando *`grep`* que entonces filtrará la salida para mostrar sólo los archivos que contengan la cadena ".txt".

Sintaxis:
```
[time [-p]] [!] [comando1 [ | ó |& comando2 ] ...
```

También puede construir cadenas arbitrarias de comandos enlazándolos para conseguir un resultado potente.

Este ejemplo crea un listado de todos los usuarios que poseen un archivo en un directorio dado, así como cuántos archivos y directorios poseen:
```
ls -l /proyectos/bash_scripts | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq -c
```

Salida:
```
8 anne
34 harry
37 tina
18 ryan
```

# HereDocument

El símbolo `<<` se puede utilizar para crear un archivo temporal [heredoc] y redirigir desde él en la línea de comandos.
```
COMANDO << EOF
    ContenidoDelDocumento
    ...
    ...
EOF
```
Observe que `EOF` representa el delimitador (fin de archivo) del heredoc. De hecho, podemos utilizar cualquier palabra alfanumérica en su lugar para indicar el inicio y el final del archivo. Por ejemplo, ésta es un heredoc válido:
```
cat << palabraaleatoria1
    Este script imprimirá estas líneas en la terminal.
    Tenga en cuenta que cat puede leer desde la entrada estándar. Usando este heredoc, podemos
    crear un archivo temporal con estas líneas como su contenido y canalizar ello
    hacia cat.
palabraaleatoria1
```

Efectivamente, parecerá como si el contenido del heredoc se introdujera en el comando. Esto puede hacer el script muy limpio si múltiples líneas necesitan ser canalizadas dentro de un programa.

Además, podemos adjuntar más pipes como se muestra:
```
cat << palabraaleatoria1 | wc
    Este script imprimirá estas líneas en la terminal.
    Tenga en cuenta que cat puede leer desde la entrada estándar. Usando este heredoc, podemos
    crear un archivo temporal con estas líneas como su contenido y canalizar ello
    hacia cat.
palabraaleatoria1
```
También se pueden usar variables predefinidas dentro de los heredocs.

# Herestrings

Herestrings son bastante similares a heredocs pero usan `<<<`. Estos se utilizan para cadenas de una sola línea que tienen que ser canalizados en algún programa. Esto parece más limpio que heredocs ya que no tenemos que especificar el delimitador.
```
wc <<<"esta es una forma fácil de pasar cadenas a la entrada estándar de un programa (en este caso wc)»
```

Al igual que los heredocs, los herestrings pueden contener variables.

## Resumen
|**Operador** |**Descripción** |
|:---|:---|
|`>`|`Guardar la salida a un archivo`|
|`>>`|`Añadir la salida a un archivo`|
|`<`|`Leer una entrada desde un archivo`|
|`2>`|`Redirigir mensajes de error`|
|`\|`|`Enviar la salida de un programa como entrada a otro`|
|`<<`|`Canalizar múltiple líneas a un programa limpiamente`|
|`<<<`|`Canalizar una única línea a un programa limpiamente`|

