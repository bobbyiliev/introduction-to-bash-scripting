# BASH Script parser para resumir sus registros de acceso de NGINX y Apache

Una de las primeras cosas que suelo hacer en caso de notar un alto uso de CPU en algunos de mis servidores Linux sería comprobar la lista de procesos con top o htop y en caso de que note una gran cantidad de procesos Apache o Nginx comprobaría rápidamente mis registros de acceso para determinar qué ha causado o está causando el pico de CPU en mi servidor o para averiguar si algo malicioso está ocurriendo.

A veces la lectura de los registros puede ser bastante intimidante ya que el registro puede ser enorme y recorrerlo manualmente puede llevar mucho tiempo. Además, el formato crudo de los registros puede ser confuso para las personas con menos experiencia.

Al igual que el capítulo anterior, ¡este capítulo va a ser un reto! Necesita escribir un pequeño script bash que resuma todo el registro de acceso sin necesidad de instalar ningún software adicional.

# Requisitos del script

Este script BASH necesita analizar y resumir tus registros de acceso y proporcionarte información muy útil como:

* Las 20 páginas con más peticiones POST
* Las 20 páginas con más peticiones GET
* Las 20 direcciones IP más visitadas y su geolocalización

## Script de ejemplo

Ya he preparado un script de demostración que puede usar como referencia. Pero le animo a que primero intente escribir el script usted mismo y sólo después eche un vistazo a mi script.

Para descargar el script, puede clonar el repositorio con el siguiente comando:


```bash
git clone https://github.com/bobbyiliev/quick_access_logs_summary.git
```

O ejecutar el siguiente comando que descargará el script en su directorio actual:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/quick_access_logs_summary/master/spike_check
```

El script no realiza ningún cambio en su sistema, sólo lee el contenido de su registro de acceso y lo resume para usted, sin embargo, una vez que haya descargado el archivo, asegúrese de revisar el contenido usted mismo.

## Ejecutar el script

Todo lo que tiene que hacer una vez descargado el script es hacerlo ejecutable y ejecutarlo.

Para conseguirlo, ejecute el siguiente comando:

```bash
chmod +x spike_check
```

Luego ejecute el script:

```bash
./spike_check /ruta/a/su/registro_de_acceso
```

Asegúrese de cambiar la ruta al archivo con la ruta real a su registro de acceso. Por ejemplo, si utiliza Apache en un servidor Ubuntu, el comando exacto sería el siguiente:

```bash
./spike_check /var/log/apache2/access.log
```

Si está usando Nginx el comando exacto sería casi el mismo, pero con la ruta al registro de acceso de Nginx:

```bash
./spike_check /var/log/nginx/access.log
```

## Entendiendo la salida

Una vez ejecutado el script, puede tardar un poco dependiendo del tamaño del log.

La salida que vería debería parecerse a esto:

![Registro de acceso resumido](https://imgur.com/WWHVMrj.png)

Esencialmente, lo que podemos decir en este caso es que hemos recibido 16 peticiones POST a nuestro archivo xmlrpc.php, que a menudo es utilizado por los atacantes para tratar de explotar sitios web de WordPress mediante el uso de varias combinaciones de nombre de usuario y contraseña.

En este caso concreto, no se trata de un gran ataque de fuerza bruta, pero nos da una indicación temprana y podemos tomar medidas para evitar un ataque mayor en el futuro.

También podemos ver que había un par de direcciones IP rusas accediendo a nuestro sitio, por lo que en caso de que no espere ningún tráfico desde Rusia, es posible que desee bloquear esas direcciones IP también.

## Conclusión

Este es un ejemplo de un simple script BASH que te permite resumir rápidamente tus registros de acceso y determinar si algo malicioso está sucediendo.

Por supuesto, puede que también quiera revisar manualmente los registros, ¡pero es un buen reto intentar automatizar esto con Bash!

>{notice} Este contenido fue publicado inicialmente en [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
