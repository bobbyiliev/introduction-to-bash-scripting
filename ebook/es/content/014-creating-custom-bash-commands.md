# Creando comandos bash personalizados

Como desarrollador o administrador del sistema, es posible que deba pasar mucho tiempo en su terminal. Siempre trato de buscar formas de optimizar las tareas repetitivas.

Una forma de hacerlo es escribir scripts bash cortos o crear comandos personalizados, también conocidos como alias. Por ejemplo, en lugar de escribir un comando muy largo cada vez, podría crear un atajo para él.

## Ejemplo

Comencemos con el siguiente escenario, como administrador del sistema, es posible que deba verificar las conexiones a su servidor web con bastante frecuencia, por lo que usaré el comando `netstat` como ejemplo.

Lo que normalmente haría cuando accedo a un servidor que tiene problemas con las conexiones al puerto 80 o 443 es verificar si hay algún servicio escuchando en esos puertos y la cantidad de conexiones a los puertos.

El siguiente comando `netstat` nos mostraría cuántas conexiones TCP en los puertos 80 y 443 tenemos actualmente:

```bash
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l
```
Este es un comando bastante largo, por lo que escribirlo cada vez puede llevar mucho tiempo a largo plazo, especialmente cuando desea obtener esa información rápidamente.

Para evitar eso, podemos crear un alias, así que en lugar de escribir el comando completo, podríamos escribir un comando corto en su lugar. Por ejemplo, digamos que queríamos poder escribir `conx` (abreviatura de conexiones) y obtener la misma información. Todo lo que tenemos que hacer en este caso es ejecutar el siguiente comando:

```bash
alias conx="netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

De esa manera estamos creando un alias llamado `conx` que sería esencialmente un 'atajo' para nuestro comando largo `netstat`. Ahora, si ejecuta simplemente `conx`:

```bash
conx
```

Obtendría el mismo resultado que el comando largo `netstat`.
Puede ser aún más creativo y agregar algunos mensajes de información como este:

```bash
alias conx="echo 'Total de conexiones en los puertos 80 y 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Ahora, si ejecuta `conx` obtendrá el siguiente resultado:

```bash
Total de conexiones en los puertos 80 y 443:
12
```
Ahora, si cierra sesión y vuelve a iniciarla, su alias se perderá. En el siguiente paso, verá cómo hacer que esto sea persistente.

## Hacer que el cambio sea persistente

Para que el cambio sea persistente, debemos agregar el comando `alias` en nuestro archivo de perfil de shell.

De forma predeterminada en Ubuntu, este sería el archivo `~/.bashrc`, para otros sistemas operativos, podría ser `~/.bash_profile`. Con tu editor de texto favorito abre el archivo:

```bash
nano ~/.bashrc
```

Ve al final y agrega lo siguiente:

```bash
alias conx="echo 'Total de conexiones en los puertos 80 y 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Guardar y luego salir.

De esa manera, ahora, incluso si cierra sesión y vuelve a iniciar sesión, su cambio se mantendrá y podrá ejecutar su comando bash personalizado.

## Listado de todos los alias disponibles

Para enumerar todos los alias disponibles para su shell actual, solo tiene que ejecutar el siguiente comando:

```bash
alias
```

Esto sería útil en caso de que vea algún comportamiento extraño con algunos comandos.

## Conclusión

Esta es una forma de crear comandos bash personalizados o alias bash.

Por supuesto, podría escribir un script bash y agregar el script dentro de su carpeta `/usr/bin`, pero esto no funcionaría si no tiene acceso root o sudo, mientras que con los alias puede hacerlo sin la necesidad de acceso root.

>{aviso} Esto se publicó inicialmente en [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-create-custom-bash-commands)
