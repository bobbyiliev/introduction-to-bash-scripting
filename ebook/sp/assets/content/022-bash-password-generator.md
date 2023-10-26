# Envío de correos electrónicos con Bash y SSMTP

SSMTP es una herramienta que entrega correos electrónicos desde una computadora o un servidor a un host de correo configurado.

SSMTP no es un servidor de correo electrónico en sí y no recibe correos electrónicos ni administra una cola.

Uno de sus usos principales es reenviar correo electrónico automatizado (como alertas del sistema) desde su máquina a una dirección de correo electrónico externa.

## Requisitos previos

Necesitará lo siguiente para poder completar este tutorial con éxito:

* Acceso a un servidor Ubuntu 18.04 como usuario no root con privilegios sudo y un firewall activo instalado en su servidor. Para configurarlos, consulte nuestra [Guía de configuración inicial del servidor para Ubuntu 18.04] (https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

* Un servidor SMTP junto con un nombre de usuario y contraseña SMTP, esto también funcionaría con el servidor SMTP de Gmail, o puedes configurar tu propio servidor SMTP siguiendo los pasos de este tutorial sobre [Cómo instalar y configurar Postfix como SMTP de solo envío Servidor en Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16- 04)

## Instalación de SSMTP

Para instalar SSMTP, primero deberá actualizar su caché apt con:

```golpecito
actualización sudo apta
```

Luego ejecute el siguiente comando para instalar SSMTP:

```golpecito
sudo apto instalar ssmtp
```

Otra cosa que necesitarías instalar es `mailutils`, para ello ejecuta el siguiente comando:

```golpecito
sudo apto instalar mailutils
```

## Configurando SSMTP

Ahora que tiene instalado `ssmtp`, para configurarlo para usar su servidor SMTP al enviar correos electrónicos, necesita editar el archivo de configuración SSMTP.

Usando su editor de texto favorito, abra el archivo `/etc/ssmtp/ssmtp.conf`:

```golpecito
sudo nano /etc/ssmtp/ssmtp.conf
```

Debe incluir su configuración SMTP:

```
raíz = administrador de correo
mailhub=<^>tu_smtp_host.com<^>:587
nombre de host=<^>tu_nombre de host<^>
AuthUser=<^>tu_nombre_de_usuario_de_gmail@tu_smtp_host.com<^>
AuthPass=<^>tu_contraseña_de_gmail<^>
FromLineOverride=SÍ
UtiliceSTARTTLS=YES
```

Guarda el archivo y cierra.

## Envío de correos electrónicos con SSMTP

Una vez realizada la configuración, para enviar un correo electrónico simplemente ejecute el siguiente comando:

```golpecito
echo "<^>Aquí agregue el cuerpo de su correo electrónico<^>" | mail -s "<^>Aquí especifique el asunto de su correo electrónico<^>" <^>your_recepient_email@yourdomain.com<^>
```

Puede ejecutar esto directamente en su terminal o incluirlo en sus scripts bash.

## Envío de un archivo con SSMTP (opcional)

Si necesita enviar archivos como archivos adjuntos, puede utilizar `mpack`.

Para instalar `mpack` ejecute el siguiente comando:

```golpecito
sudo apto instalar mpack
```

A continuación, para enviar un correo electrónico con un archivo adjunto, ejecute el siguiente comando.

```golpecito
mpack -s "<^>Su asunto aquí<^>" your_file.zip <^>your_recepient_email@yourdomain.com<^>
```

El comando anterior enviaría un correo electrónico a `<^>your_recepient_email@yourdomain.com<^>` con el `<^>your_file.zip<^>` adjunto.

## Conclusión

SSMTP es una forma excelente y confiable de implementar la funcionalidad de correo electrónico SMTP directamente en scripts bash.

Para obtener más información sobre SSMTP, recomendaría consultar la documentación oficial [aquí](https://wiki.archlinux.org/index.php/SSMTP).

>{aviso} Este contenido se publicó inicialmente en el [foro de la comunidad DigitalOcean](https://www.digitalocean.com/community/questions/how-to-send-emails-from-a-bash-script-using-ssmtp ).