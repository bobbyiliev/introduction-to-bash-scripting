# Analizador de scripts BASH para resumir sus registros de acceso a NGINX y Apache

Una de las primeras cosas que normalmente haría en caso de que note un alto uso de CPU en algunos de mis servidores Linux sería verificar la lista de procesos con top o htop y en caso de que note muchos procesos de Apache o Nginx, Verificaría rápidamente mis registros de acceso para determinar qué ha causado o está causando el pico de CPU en mi servidor o para descubrir si está sucediendo algo malicioso.

A veces, leer los registros puede resultar bastante intimidante, ya que el registro puede ser enorme y revisarlo manualmente puede llevar mucho tiempo. Además, el formato de registro sin formato puede resultar confuso para las personas con menos experiencia.

Al igual que el capítulo anterior, ¡este capítulo será un desafío! Debe escribir un breve script bash que resumiría todo el registro de acceso sin la necesidad de instalar ningún software adicional.

# Requisitos del guión

Este script BASH necesita analizar y resumir sus registros de acceso y brindarle información muy útil como:

* Las 20 páginas principales con más solicitudes POST
* Las 20 páginas principales con más solicitudes GET
* Las 20 principales direcciones IP y su ubicación geográfica

## Guión de ejemplo

Ya he preparado un script de demostración que podrías utilizar como referencia. ¡Pero te animo a que primero intentes escribir el guión tú mismo y solo después le eches un vistazo al mío!

Para descargar el script, puede clonar el repositorio con el siguiente comando:

```golpecito
clon de git https://github.com/bobbyiliev/quick_access_logs_summary.git
```

O ejecute el siguiente comando que descargará el script en su directorio actual:

```golpecito
wget https://raw.githubusercontent.com/bobbyiliev/quick_access_logs_summary/master/spike_check
```

El script no realiza ningún cambio en su sistema, solo lee el contenido de su registro de acceso y lo resume; sin embargo, una vez que haya descargado el archivo, asegúrese de revisar el contenido usted mismo.

## Ejecutando el script

Todo lo que tienes que hacer una vez descargado el script es hacerlo ejecutable y ejecutarlo.

Para hacerlo, ejecute el siguiente comando para que el script sea ejecutable:

```golpecito
chmod +x pico_check
```

Luego ejecute el script:

```golpecito
./spike_check /ruta/a/su/registro de acceso
```

Asegúrese de cambiar la ruta al archivo con la ruta real a su registro de acceso. Por ejemplo, si está utilizando Apache en un servidor Ubuntu, el comando exacto se vería así:

```golpecito
./spike_check /var/log/apache2/access.log
```

Si está utilizando Nginx, el comando exacto sería casi el mismo, pero con la ruta al registro de acceso de Nginx:

```golpecito
./spike_check /var/log/nginx/access.log
```

## Comprender el resultado

Una vez que ejecute el script, puede tardar un poco dependiendo del tamaño del registro.

El resultado que verías debería verse así:

![Registro de acceso resumido](https://imgur.com/WWHVMrj.png)

Básicamente, lo que podemos decir en este caso es que hemos recibido 16 solicitudes POST a nuestro archivo xmlrpc.php, que los atacantes suelen utilizar para intentar explotar sitios web de WordPress mediante el uso de varias combinaciones de nombre de usuario y contraseña.

En este caso específico, no fue un gran ataque de fuerza bruta, pero nos da una indicación temprana y podemos tomar medidas para evitar un ataque mayor en el futuro.

También podemos ver que había un par de direcciones IP rusas accediendo a nuestro sitio, por lo que en caso de que no espere ningún tráfico de Rusia, es posible que desee bloquear esas direcciones IP también.

## Conclusión

Este es un ejemplo de un script BASH simple que le permite resumir rápidamente sus registros de acceso y determinar si está sucediendo algo malicioso.

Por supuesto, es posible que también quieras revisar manualmente los registros, ¡pero es un buen desafío intentar automatizar esto con Bash!

>{aviso} Este contenido se publicó inicialmente en [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)