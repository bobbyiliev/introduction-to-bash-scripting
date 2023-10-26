# Creando comandos bash personalizados

Como desarrollador o administrador de sistemas, es posible que tengas que pasar mucho tiempo en tu terminal. Siempre trato de buscar formas de optimizar las tareas repetitivas.

Una forma de hacerlo es escribir scripts bash cortos o crear comandos personalizados, también conocidos como alias. Por ejemplo, en lugar de escribir un comando muy largo cada vez, puedes simplemente crear un atajo para él.

## Ejemplo

Comencemos con el siguiente escenario: como administrador del sistema, es posible que deba verificar las conexiones a su servidor web con bastante frecuencia, por lo que usaré el comando `netstat` como ejemplo.

Lo que normalmente haría cuando accedo a un servidor que tiene problemas con las conexiones al puerto 80 o 443 es verificar si hay algún servicio escuchando en esos puertos y la cantidad de conexiones a los puertos.

El siguiente comando `netstat` nos mostraría cuántas conexiones TCP en los puertos 80 y 443 tenemos actualmente:

```golpecito
planta netstat | grep '80\|443' | grep -v ESCUCHAR | baño -l
```
Este es un comando bastante largo, por lo que escribirlo cada vez puede llevar mucho tiempo a largo plazo, especialmente cuando desea obtener esa información rápidamente.

Para evitar eso, podemos crear un alias, de modo que en lugar de escribir el comando completo, podríamos simplemente escribir un comando corto. Por ejemplo, digamos que queremos poder escribir "conn" (abreviatura de conexiones) y obtener la misma información. Todo lo que necesitamos hacer en este caso es ejecutar el siguiente comando:

```golpecito
alias conn="netstat -plant | grep '80\|443' | grep -v ESCUCHAR | wc -l"
```

De esa manera estamos creando un alias llamado "conn" que esencialmente sería un "atajo" para nuestro comando largo "netstat". Ahora, si ejecutas solo `conn`:

```golpecito
conectar
```

Obtendría el mismo resultado que el comando largo `netstat`.
Puedes ser aún más creativo y agregar algunos mensajes informativos como este aquí:

```golpecito
alias conn="echo 'Total de conexiones en los puertos 80 y 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Ahora, si ejecuta `conn`, obtendrá el siguiente resultado:

```golpecito
Conexiones totales en el puerto 80 y 443:
12
```
Ahora, si cierra sesión y vuelve a iniciarla, su alias se perderá. En el siguiente paso verás cómo hacer que esto sea persistente.

## Hacer que el cambio sea persistente

Para que el cambio sea persistente, necesitamos agregar el comando `alias` en nuestro archivo de perfil de shell.

De forma predeterminada en Ubuntu, este sería el archivo `~/.bashrc`; para otros sistemas operativos, este podría ser el archivo `~/.bash_profle`. Con tu editor de texto favorito abre el archivo:

```golpecito
nano ~/.bashrc
```

Vaya al final y agregue lo siguiente:

```golpecito
alias conn="echo 'Total de conexiones en los puertos 80 y 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Guarde y luego salga.

De esa manera, incluso si cierra sesión y vuelve a iniciarla, su cambio persistirá y podrá ejecutar su comando bash personalizado.

## Listado de todos los alias disponibles

Para enumerar todos los alias disponibles para su shell actual, simplemente debe ejecutar el siguiente comando:

```golpecito
alias
```

Esto sería útil en caso de que observe algún comportamiento extraño con algunos comandos.

## Conclusión

Esta es una forma de crear comandos bash personalizados o alias de bash.

Por supuesto, podrías escribir un script bash y agregarlo dentro de tu carpeta `/usr/bin`, pero esto no funcionaría si no tienes acceso root o sudo, mientras que con alias puedes hacerlo sin necesidad. de acceso raíz.

>{aviso} Esto se publicó inicialmente en [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-create-custom-bash-commands)