# Ejecutar scripts BASH en múltiples servidores remotos

Cualquier comando que pueda ejecutar desde la línea de comandos se puede utilizar en un script bash. Los scripts se utilizan para ejecutar una serie de comandos. Bash está disponible de forma predeterminada en los sistemas operativos Linux y macOS.

Tengamos un escenario hipotético en el que necesita ejecutar un script BASH en varios servidores remotos, pero no desea copiar manualmente el script en cada servidor, luego volver a iniciar sesión en cada servidor individualmente y solo luego ejecutar el script.

Por supuesto, podrías usar una herramienta como Ansible, ¡pero aprendamos cómo hacerlo con Bash!

## Requisitos previos

Para este ejemplo usaré 3 servidores Ubuntu remotos implementados en DigitalOcean. Si aún no tiene una cuenta de Digital Ocean, puede registrarse en DigitalOcean y obtener $100 de crédito gratis a través de este enlace de referencia aquí:

[https://m.do.co/c/2a9bba940f39](https://m.do.co/c/2a9bba940f39)

Una vez que tenga lista su cuenta de Digital Ocean, continúe e implemente 3 gotas.

Seguí adelante y creé 3 servidores Ubuntu:

![Servidores DigitalOcean Ubuntu](https://imgur.com/09xmq41.png)

Pondré las IP de esos servidores en un archivo `servers.txt` que usaría para realizar un bucle con nuestro script Bash.

Si eres nuevo en DigitalOcean, puedes seguir los pasos sobre cómo crear un Droplet aquí:

* [Cómo crear un droplet desde el panel de control de DigitalOcean](https://www.digitalocean.com/docs/droplets/how-to/create/)

También puede seguir los pasos de este video aquí sobre cómo realizar la configuración inicial del servidor:

* [Cómo realizar la configuración inicial del servidor con Ubuntu](https://youtu.be/7NL2_4HIgKU)

O mejor aún, puedes seguir este artículo aquí sobre cómo automatizar la configuración inicial de tu servidor con Bash:

[Automatización de la configuración inicial del servidor con Ubuntu 18.04 con Bash](https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ubuntu-18-04)

Con los 3 nuevos servidores instalados, podemos seguir adelante y concentrarnos en ejecutar nuestro script Bash en todos ellos con un solo comando.

## El script BASH

Reutilizaré el script de demostración del capítulo anterior con algunos ligeros cambios. Simplemente ejecuta algunas comprobaciones como el uso actual de la memoria, el uso actual de la CPU, la cantidad de conexiones TCP y la versión del kernel.

```golpecito
#!/bin/bash

##
# Script BASH que verifica lo siguiente:
#   - Uso de memoria
# - carga de CPU
# - Número de conexiones TCP
#   - Versión del núcleo
##

##
# Comprobación de memoria
##
nombre_servidor=$(nombre de host)

función memoria_check() {
     eco "#######"
echo "El uso actual de memoria en ${server_name} es: "
libre -h
eco "#######"
}


función cpu_check() {
     eco "#######"
echo "La carga actual de CPU en ${server_name} es: "
     eco ""
tiempo de actividad
     eco "#######"
}

función tcp_check() {
     eco "#######"
echo "Total de conexiones TCP en ${server_name}: "
     eco ""
gato /proc/net/tcp | baño -l
     eco "#######"
}

función kernel_check() {
     eco "#######"
echo "La versión exacta del kernel en ${server_name} es: "
eco ""
uname -r
     eco "#######"
}

función all_checks() {
comprobación de memoria
CPU_check
tcp_check
kernel_check
}

todos_controles
```

Copie el código a continuación y agréguelo en un archivo llamado `remote_check.sh`. También puede obtener el script desde [aquí](https://devdojo.com/bobbyiliev/executing-bash-script-on-multiple-remote-server).

## Ejecutando el script en todos los servidores

Ahora que tenemos el script y los servidores listos y que hemos agregado esos servidores en nuestro archivo servers.txt, podemos ejecutar el siguiente comando para recorrer todos los servidores y ejecutar el script de forma remota sin tener que copiar el script a cada servidor y conectarse individualmente a cada servidor.

```golpecito
para el servidor en $(cat servers.txt); haga ssh your_user@${server} 'bash -s' < ./remote_check.sh; hecho
```

Lo que hace este bucle for es recorrer cada servidor en el archivo servers.txt y luego ejecuta el siguiente comando para cada elemento de la lista:

```golpecito
ssh tu_usuario@la_ip_servidor 'bash -s' < ./remote_check.sh
```

Obtendría el siguiente resultado:

![Ejecutando script bash en múltiples servidores remotos](https://imgur.com/B1AmhUP.png)

## Conclusión

Este es solo un ejemplo realmente simple de cómo ejecutar un script simple en múltiples servidores sin tener que copiar el script en cada servidor y sin tener que acceder a los servidores individualmente.

Por supuesto, podrías ejecutar un script mucho más complejo y en muchos más servidores.

Si está interesado en la automatización, le recomendaría consultar la página de recursos de Ansible en el sitio web de DigitalOcean:

[Recursos de Ansible](https://www.digitalocean.com/community/tags/ansible)

>{aviso} Este contenido se publicó inicialmente en [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)