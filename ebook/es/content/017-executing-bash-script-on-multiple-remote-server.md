# Ejecutando scripts de BASH en múltiples servidores remotos

Cualquier comando que quieras ejecutar desde línea de comandos puede ser usado en scripts de bash. Los scripts son usados para ejecutar una serie de comandos. Bash está disponible por defecto en Linux y en los sistemas operativos de mac.

Tenemos un escenario hipotético en el cual necesitas ejecutar un script de BASH en múltiples servidores remotos pero no quieres copiar el script en cada servidor manualmente, luego loguearte en cada servidor uno por uno y entonces ejecutar el script.

Evidentemente usarías una herramienta como Ansible pero aprendamos como hacerlo con Bash.

## Prerrequisitos

Para este ejemplo usaré 3 servidores remotos con Ubuntu desplegados en Digital Ocean. Si todavía no tienes una cuenta de DigitalOcean puedes inscribirte y conseguir 100$ de crédito gratuito clicando en el siguiente enlace:

[https://m.do.co/c/2a9bba940f39](https://m.do.co/c/2a9bba940f39)

Una vez que tengas la cuenta de Digital Ocean lista sigue adelante y despliega 3 droplets.

Me he adelanado y he creado 3 servidores Ubuntu:

![Servidores Ubuntu de DigitalOcean](https://imgur.com/09xmq41.png)

Pondré las IP's de esos servidores en un archivo `servers.txt`que usaré para crear un bucle en nuestro script de Bash.

Si eres nuevo en DigitalOcean puedes seguir estos pasos para crear un Droplet aqui:

* [Cómo crear un Droplet desde el panel de control de DigitalOcean (en inglés)](https://www.digitalocean.com/docs/droplets/how-to/create/)

También puedes seguir los pasos de como hacer la configuración inicial de un servidor en este vídeo:

* [Cómo hacer la configuración inicial de tu servidor con Ubuntu (en inglés)](https://youtu.be/7NL2_4HIgKU)

O incluso mejor, en este articulo te explica como automatizar la configuración inicial de tu servidor con Bash:

[Automatizando la configuración inicial de un servidor con Ubuntu 18.04 con Bash (en inglés)](https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ubuntu-18-04)


Con los 3 nuevos servidores listos podemos seguir adelante y enfocarnos en ejecutar nuestro script en Bash en todos ellos con un sólo comando.

## El script en BASH

Reutilizaré el script de ejemplo del anterior capítulo con algunos ligeros cambios. Simplemente ejecuta unos controles como el uso de memoria actual, el uso de CPU actual, el número de conexiones TCP y la versión del kernel.

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

todos_los_chequeos
```

Copia el código y añádelo a un archivo llamado `remote_check.sh`. También puedes descargarlo [aquí] (https://devdojo.com/bobbyiliev/executing-bash-script-on-multiple-remote-server).

## Ejecutando el script en todos los servidores

Ahora que ya tenemos el script y los servidores preparados y que hemos añadido esos servidores al archivo servers.txt podemos ejecutar el siguiente comando en bucle a través de todos los servidores y ejecutar el script remotamente sin tener que copiarlo en cada servidor conectándonos de uno en uno.  


```bash
for server in $(cat servers.txt) ; do ssh tu_usuario@${server} 'bash -s' < ./remote_check.sh ; done
```

Lo que el bucle hace es ir a través de cada servidor que está en el archivo servers.txt y ejecutar el siguiente comando para cada ítem de la lista:

```bash
ssh tu_usuario@ip_del_servidor 'bash -s' < ./remote_check.sh
```

Obtendrás el siguiente resultado:

![Ejecutando un script bash en múltiples servidores remotos](https://imgur.com/B1AmhUP.png)

## Conclusión

Este es un ejemplo muy simple de como ejecutar fácilmente un script en múltiples servidores sin tener que copiar el script en cada uno de ellos ni tener que conectarse a cada uno.

Sin duda podrías ejecutar un script mucho más complejo y en muchos más servidores.

Si estas interesado en la automatización, te recomendaría que revises los recursos de Ansible en la página web de DigitalOcean:

[Recursos de Ansible (en inglés)](https://www.digitalocean.com/community/tags/ansible)

>{aviso} Este contenido fue inicialmente publicado en [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
