# Trabajar con la API de Cloudflare en Bash

Alojo todos mis sitios web en Droplets de **DigitalOcean** y también uso Cloudflare como mi proveedor de CDN. Uno de los beneficios de usar Cloudflare es que reduce el tráfico general a tu usuario y también oculta la dirección IP real de tu servidor detrás de su CDN.

Mi característica personal favorita de Cloudflare es su protección DDoS gratuita. Ha salvado mis servidores varias veces de diferentes ataques DDoS. Tienen una API genial que puedes usar para habilitar y deshabilitar su protección DDoS fácilmente.

¡Este capítulo va a ser un ejercicio! ¡Te desafío a que sigas adelante y escribas un breve script de bash que habilitaría y deshabilitaría la protección DDoS de Cloudflare para tu servidor automáticamente si es necesario!

## Prerequisitos

Antes de seguir esta guía, configura tu cuenta de Cloudflare y prepara tu sitio web. Si no estás seguro de cómo hacerlo, puedes seguir estos pasos de aquí (en inglés): [Crear una cuenta de Cloudflare y agregar un sitio web](https://support.cloudflare.com/hc/en-us/articles/201720164-Step-2-Create-a-Cloudflare-account-and-add-a-website).

Una vez que tengas tu cuenta de Cloudflare, asegúrate de obtener la siguiente información:

* Una cuenta de Cloudflare
* Clave API de Cloudflare
* ID de zona de Cloudflare

Además, asegúrate de que curl esté instalado en tu servidor:

```bash
curl --version
```

Si curl no está instalado, debes ejecutar lo siguiente:

* Para RedHat/CentOs:

```bash
yum install curl
```

* Para Debian/Ubuntu:

```bash
apt-get install curl
```

## Desafío - Requisitos del script

La secuencia de comandos debe monitorizar el uso de la CPU en tu servidor y, si el uso de la CPU aumenta según el número de vCPU, habilitaría la protección DDoS de Cloudflare automáticamente a través de la API de Cloudflare.

Las características principales del script deben ser:

* Comprueba la carga de la CPU del script en el servidor
* En caso de un pico de CPU, el script activa una llamada API a Cloudflare y habilita la función de protección DDoS para la zona especificada
* Después de que la carga de la CPU vuelva a la normalidad, el script deshabilitará la opción "Estoy bajo ataque" y la restablecerá a la normalidad


## Script de ejemplo


Ya he preparado un script de demostración que podrías usar como referencia. ¡Pero te animo a que intentes escribir el script tú mismo primero y luego eches un vistazo a mi script!

Para descargar el script simplemente ejecuta el siguiente comando:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/cloudflare-ddos-protection/main/protection.sh
```

Abre el script con tu editor de texto favorito:

```bash
nano protection.sh
```

Y actualiza los siguientes detalles con tus datos de Cloudflare:

```bash

CF_CONE_ID=TU_ID_DE_ZONA_DE_CLOUDFLARE
CF_EMAIL_ADDRESS=TU_CORREO_ELECTRÓNICO_DE_LA_CUENTA_DE_CLOUDFLARE
CF_API_KEY=TU_CLAVE_API_DE_CLOUDFLARE

```

Después de eso, haz que el script sea ejecutable:

```bash
chmod +x ~/protection.sh
```

Finalmente, configura 2 trabajos Cron para que se ejecuten cada 30 segundos. Para editar tu ejecución de crontab:

```bash
crontab -e
```

Y agrega el siguiente contenido:

```bash

* * * * * /ruta-al-script/cloudflare/protection.sh
* * * * * ( sleep 30 ; /ruta-al-script/cloudflare/protection.sh )

```

Ten en cuenta que debes cambiar la ruta al script con la ruta real donde guardaste el script.

## Conclusión

Esta es una solución bastante sencilla y económica, una de las desventajas de la secuencia de comandos es que si tu servidor no responde debido a un ataque, es posible que la secuencia de comandos no se active en absoluto.

Por supuesto, un mejor enfoque sería usar un sistema de monitorización como Nagios y, en función de las estadísticas del sistema de monitorización, puedes activar el script, ¡pero el desafío de este script podría ser una buena experiencia de aprendizaje!

Aquí hay otro gran recurso (en inglés) sobre cómo usar la API de Discord y enviar notificaciones a su canal de Discord con un script Bash:


[Cómo usar Webhooks de Discord para recibir notificaciones sobre el estado de tu sitio web en Ubuntu 18.04 (En inglés)](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04)

>{aviso} Este contenido se publicó inicialmente en [DevDojo (En inglés)](https://devdojo.com/bobbyiliev/bash-script-to-automatically-enable-cloudflare-ddos-protection)

