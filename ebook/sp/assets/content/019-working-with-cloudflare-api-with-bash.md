# Trabajar con la API de Cloudflare con Bash

Alojo todos mis sitios web en **DigitalOcean** Droplets y también uso Cloudflare como mi proveedor de CDN. Uno de los beneficios de usar Cloudflare es que reduce el tráfico general hacia su usuario y también oculta la dirección IP real de su servidor detrás de su CDN.

Mi característica favorita de Cloudflare es su protección DDoS gratuita. Ha salvado mis servidores varias veces de diferentes ataques DDoS. Tienen una API interesante que puedes usar para habilitar y deshabilitar su protección DDoS fácilmente.

¡Este capítulo va a ser un ejercicio! ¡Te reto a que sigas adelante y escribas un breve script bash que habilite y deshabilite la protección DDoS de Cloudflare para tu servidor automáticamente si es necesario!

## Requisitos previos

Antes de seguir esta guía aquí, configure su cuenta de Cloudflare y prepare su sitio web. Si no está seguro de cómo hacerlo, puede seguir estos pasos aquí: [Cree una cuenta de Cloudflare y agregue un sitio web](https://support.cloudflare.com/hc/en-us/articles/201720164-Step-2 -Crear-una-cuenta-de-Cloudflare-y-agregar-un-sitio-web).

Una vez que tenga su cuenta de Cloudflare, asegúrese de obtener la siguiente información:

* Una cuenta de Cloudflare
* Clave API de Cloudflare
* ID de zona de Cloudflare

Además, asegúrese de que curl esté instalado en su servidor:

```golpecito
rizo --versión
```

Si curl no está instalado, debe ejecutar lo siguiente:

* Para RedHat/CentO:

```golpecito
mmm instalar curl
```

* Para Debian/Ubuntu

```golpecito
apt-get instalar curl
```

## Desafío: requisitos del guión

El script necesita monitorear el uso de la CPU en su servidor y, si el uso de la CPU aumenta según el número de vCPU, habilitará la protección DDoS de Cloudflare automáticamente a través de la API de Cloudflare.

Las principales características del guión deben ser:

* Comprueba la carga de la CPU del script en el servidor.
* En caso de un pico de CPU, el script activa una llamada API a Cloudflare y habilita la función de protección DDoS para la zona especificada.
* Después de que la carga de la CPU vuelva a la normalidad, el script desactivará la opción "Estoy bajo ataque" y la restablecerá a la normalidad.

## Guión de ejemplo

Ya he preparado un script de demostración que podrías utilizar como referencia. ¡Pero te animo a que primero intentes escribir el guión tú mismo y solo después le eches un vistazo al mío!

Para descargar el script simplemente ejecute el siguiente comando:

```golpecito
wget https://raw.githubusercontent.com/bobbyiliev/cloudflare-ddos-protection/main/protection.sh
```

Abra el script con su editor de texto favorito:

```golpecito
nanoprotección.sh
```

Y actualice los siguientes detalles con sus datos de Cloudflare:

```golpecito
CF_CONE_ID=TU_CF_ZONE_ID
CF_EMAIL_ADDRESS=TU_CF_EMAIL_ADDRESS
CF_API_KEY=TU_CF_API_KEY
```

Después de eso, haga que el script sea ejecutable:

```golpecito
chmod +x ~/protección.sh
```

Finalmente, configure 2 trabajos Cron para que se ejecuten cada 30 segundos. Para editar su crontab ejecute:

```golpecito
crontab-e
```

Y agregue el siguiente contenido:

```golpecito
* * * * * /ruta-al-script/cloudflare/protection.sh
* * * * * (dormir 30; /ruta-al-script/cloudflare/protection.sh)
```

Tenga en cuenta que debe cambiar la ruta al script con la ruta real donde almacenó el script.

## Conclusión

Esta es una solución bastante sencilla y económica, una de las desventajas del script es que si su servidor no responde debido a un ataque, es posible que el script no se active en absoluto.

Por supuesto, un mejor enfoque sería utilizar un sistema de monitoreo como Nagios y, basándose en las estadísticas del sistema de monitoreo, puede activar el script, ¡pero este desafío de script podría ser una buena experiencia de aprendizaje!

Aquí hay otro gran recurso sobre cómo usar la API de Discord y enviar notificaciones a su canal de Discord con un script Bash:

[Cómo utilizar Discord Webhooks para recibir notificaciones sobre el estado de su sitio web en Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for- el-estado-de-su-sitio-web-en-ubuntu-18-04)

>{aviso} Este contenido se publicó inicialmente en [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-automatically-enable-cloudflare-ddos-protection)