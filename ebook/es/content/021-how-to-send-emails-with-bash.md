# Enviando emails con Bash y SSMTP

SSMTP es una herramienta que envía correos electrónicos desde un ordenador o un servidor a un host de correo configurado. 

SSMTP no es un servidor de correo electrónico en sí mismo y no recibe correos electrónicos ni gestiona una cola. 

Uno de sus usos primarios es para reenviar correo automatizado (como alertas del sistema) desde su máquina y a una dirección de correo externa.

## Requisitos previos

Necesitará lo siguiente para poder completar este tutorial satisfactoriamente:

* Acceso a un servidor Ubuntu 18.04 como usuario no root con privilegios sudo y un firewall activo instalado en su servidor. Para configurarlos, consulte nuestra [Guía de configuración inicial del servidor para Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

* Un servidor SMTP junto con el nombre de usuario y contraseña SMTP, esto también funcionaría con el servidor SMTP de Gmail, o puede configurar su propio servidor SMTP siguiendo los pasos de este tutorial en [Cómo instalar y configurar Postfix como servidor SMTP de sólo envío en Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04)

## Instalación de SSMTP

Para instalar SSMTP, primero tendrá que actualizar su caché apt con:

```bash
sudo apt update
```

Luego ejecute el siguiente comando para instalar SSMTP:

```bash
sudo apt install ssmtp
```

Otra cosa que necesitaría instalar es `mailutils`, para ello ejecute el siguiente comando:

```bash
sudo apt install mailutils
```

## Configurando SSMTP

Ahora que tiene `ssmtp` instalado, para configurarlo para usar su servidor SMTP cuando envíe emails, necesita editar el fichero de configuración SSMTP.

Utilice su editor de texto favorito para abrir el fichero `/etc/ssmtp/ssmtp.conf`:

```bash
sudo nano /etc/ssmtp/ssmtp.conf
```

Necesita incluir la configuración de su SMTP:

```
root=postmaster
mailhub=<^>su_host_smtp.com<^>:587
hostname=<^>su_nombre_de_host<^>
AuthUser=<^>su_usuario_gmail@su_host_smtp.com<^>
AuthPass=<^>su_password_gmail<^>
FromLineOverride=YES
UseSTARTTLS=YES
```

Guarde el archivo y salga.

## Enviando emails con SSMTP

Una vez realizada la configuración, para enviar un email basta con ejecutar el siguiente comando:

```bash
echo "<^>Aquí añade el cuerpo de su email<^>" | mail -s "<^>Aquí especifique el asunto de su email<^>" <^>email_de_su_destinatario@sudominio.com<^>
```

Puede ejecutar esto directamente en su terminal o incluirlo en sus scripts bash.

## Enviar un archivo con SSMTP (opcional)

Si necesita enviar archivos como adjuntos, puede usar `mpack`.

Para instalar `mpack` ejecute el siguiente comando:

```bash
sudo apt install mpack
```

A continuación, para enviar un correo electrónico con un archivo adjunto, ejecute el siguiente comando.

```bash
mpack -s "<^>Su asunto aquí<^>" su_archivo.zip <^>email_de_su_destinatario@sudominio.com<^>
```

El comando anterior enviaría un correo electrónico a `<^>email_de_su_destinatario@sudominio.com<^>` con el archivo `<^>su_archivo.zip<^>` como adjunto.

## Conclusión

SSMTP es una excelente y confiable manera de implementar la funcionalidad de correo SMTP directamente en scripts bash.

Para más información sobre SSMTP recomiendo consultar la documentación oficial [aquí](https://wiki.archlinux.org/index.php/SSMTP).

>Aviso Este contenido fue publicado inicialmente en el [foro de la comunidad DigitalOcean](https://www.digitalocean.com/community/questions/how-to-send-emails-from-a-bash-script-using-ssmtp).
