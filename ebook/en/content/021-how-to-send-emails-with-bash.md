# Sending emails with Bash and SSMTP

SSMTP is a tool that delivers emails from a computer or a server to a configured mail host. 

SSMTP is not an email server itself and does not receive emails or manage a queue. 

One of its primary uses is for forwarding automated email (like system alerts) off your machine and to an external email address.

## Prerequisites

You would need the following things in order to be able to complete this tutorial successfully:

* Access to an Ubuntu 18.04 server as a non-root user with sudo privileges and an active firewall installed on your server. To set these up, please refer to our [Initial Server Setup Guide for Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

* An SMTP server along with SMTP username and password, this would also work with Gmail's SMTP server, or you could set up your own SMTP server by following the steps from this tutorial on [How to Install and Configure Postfix as a Send-Only SMTP Server on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04)

## Installing SSMTP

In order to install SSMTP, you’ll need to first update your apt cache with:

```bash
sudo apt update
```

Then run the following command to install SSMTP:

```bash
sudo apt install ssmtp
```

Another thing that you would need to install is `mailutils`, to do that run the following command:

```bash
sudo apt install mailutils
```

## Configuring SSMTP

Now that you have `ssmtp` installed, in order to configure it to use your SMTP server when sending emails, you need to edit the SSMTP configuration file.

Using your favourite text editor to open the `/etc/ssmtp/ssmtp.conf` file:

```bash
sudo nano /etc/ssmtp/ssmtp.conf
```

You need to include your SMTP configuration:

```
root=postmaster
mailhub=<^>your_smtp_host.com<^>:587
hostname=<^>your_hostname<^>
AuthUser=<^>your_gmail_username@your_smtp_host.com<^>
AuthPass=<^>your_gmail_password<^>
FromLineOverride=YES
UseSTARTTLS=YES
```

Save the file and exit.

## Sending emails with SSMTP

Once your configuration is done, in order to send an email just run the following command:

```bash
echo "<^>Here add your email body<^>" | mail -s "<^>Here specify your email subject<^>" <^>your_recepient_email@yourdomain.com<^>
```

You can run this directly in your terminal or include it in your bash scripts.

## Sending A File with SSMTP (optional)

If you need to send files as attachments, you can use `mpack`.

To install `mpack` run the following command:

```bash
sudo apt install mpack
```

Next, in order to send an email with a file attached, run the following command.

```bash
mpack -s "<^>Your Subject here<^>" your_file.zip <^>your_recepient_email@yourdomain.com<^>
```

The above command would send an email to `<^>your_recepient_email@yourdomain.com<^>` with the `<^>your_file.zip<^>` attached.

## Conclusion

SSMTP is a great and reliable way to implement SMTP email functionality directly in bash scripts.

For more information about SSMTP I would recommend checking the official documentation [here](https://wiki.archlinux.org/index.php/SSMTP).

>{notice} This content was initially posted on the [DigitalOcean community forum](https://www.digitalocean.com/community/questions/how-to-send-emails-from-a-bash-script-using-ssmtp).
