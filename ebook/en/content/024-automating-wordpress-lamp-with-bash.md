# Automatic WordPress on LAMP installation with BASH

Here is an example of a full LAMP and WordPress installation that works on any Debian-based machine.

# Prerequisites

- A Debian-based machine (Ubuntu, Debian, Linux Mint, etc.)

# Planning the functionality

Let's start again by going over the main functionality of the script:

**Lamp Installation**

* Update the package manager
* Install a firewall (ufw)
* Allow SSH, HTTP and HTTPS traffic
* Install Apache2
* Install & Configure MariaDB
* Install PHP and required plugins
* Enable all required Apache2 mods

**Apache Virtual Host Setup**

* Create a directory in `/var/www`
* Configure permissions to the directory
* Create the `$domain` file under `/etc/apache2/sites-available` and append the required Virtualhost content
* Enable the site
* Restart Apache2

**SSL Config**

* Generate the OpenSSL certificate
* Append the SSL certificate to the `ssl-params.conf` file
* Append the SSL config to the Virtualhost file
* Enable SSL
* Reload Apache2

**Database Config**

* Create a database
* Create a user
* Flush Privileges

**WordPress Config**

* Install required WordPress PHP plugins
* Install WordPress
* Append the required information to `wp-config.php` file

Without further ado, let's start writing the script.

# The script

We start by setting our variables and asking the user to input their domain:

```bash
echo 'Please enter your domain of preference without www:'
read DOMAIN
echo "Please enter your Database username:"
read DBUSERNAME
echo "Please enter your Database password:"
read DBPASSWORD
echo "Please enter your Database name:"
read DBNAME

ip=`hostname -I | cut -f1 -d' '`
```

We are now ready to start writing our functions. Start by creating the `lamp_install()` function. Inside of it, we are going to update the system, install ufw, allow SSH, HTTP and HTTPS traffic, install Apache2, install MariaDB and PHP. We are also going to enable all required Apache2 mods.

```bash
lamp_install () {
	apt update -y
	apt install ufw
	ufw enable
	ufw allow OpenSSH
	ufw allow in "WWW Full"

	apt install apache2 -y
	apt install mariadb-server
	mysql_secure_installation -y
	apt install php libapache2-mod-php php-mysql -y
	sed -i "2d" /etc/apache2/mods-enabled/dir.conf
	sed -i "2i\\\tDirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" /etc/apache2/mods-enabled/dir.conf
	systemctl reload apache2
	
}
```

Next, we are going to create the `apache_virtualhost_setup()` function. Inside of it, we are going to create a directory in `/var/www`, configure permissions to the directory, create the `$domain` file under `/etc/apache2/sites-available` and append the required Virtualhost content, enable the site and restart Apache2.

```bash
apache_virtual_host_setup () {
	mkdir /var/www/$DOMAIN
	chown -R $USER:$USER /var/www/$DOMAIN

	echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerName $DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerAlias www.$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tDocumentRoot /var/www/$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e '\tErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e '\tCustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/$DOMAIN.conf
	echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf
	a2ensite $DOMAIN
	a2dissite 000-default
	systemctl reload apache2

}
```

Next, we are going to create the `ssl_config()` function. Inside of it, we are going to generate the OpenSSL certificate, append the SSL certificate to the `ssl-params.conf` file, append the SSL config to the Virtualhost file, enable SSL and reload Apache2.

```bash
ssl_config () {
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
	
	echo "SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLProtocol All -SSLv2 -SSLv3 -TLSv1 -TLSv1.1" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLHonorCipherOrder On" >> /etc/apache2/conf-available/ssl-params.conf
	echo "Header always set X-Frame-Options DENY" >> /etc/apache2/conf-available/ssl-params.conf
	echo "Header always set X-Content-Type-Options nosniff" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLCompression off" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLUseStapling on" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLStaplingCache \"shmcb:logs/stapling-cache(150000)\"" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLSessionTickets Off" >> /etc/apache2/conf-available/ssl-params.conf
	
	cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
	sed -i "s/var\/www\/html/var\/www\/$DOMAIN/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "s/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/etc\/ssl\/certs\/apache-selfsigned.crt/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "s/etc\/ssl\/private\/ssl-cert-snakeoil.key/etc\/ssl\/private\/apache-selfsigned.key/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "4i\\\t\tServerName $ip" /etc/apache2/sites-available/default-ssl.conf
	sed -i "22i\\\tRedirect permanent \"/\" \"https://$ip/\"" /etc/apache2/sites-available/000-default.conf
	a2enmod ssl
	a2enmod headers
	a2ensite default-ssl
	a2enconf ssl-params
	systemctl reload apache2
}
```

Next, we are going to create the `db_setup()` function. Inside of it, we are going to create the database, create the user and grant all privileges to the user.

```bash
db_config () {
	mysql -e "CREATE DATABASE $DBNAME;"
	mysql -e "GRANT ALL ON $DBNAME.* TO '$DBUSERNAME'@'localhost' IDENTIFIED BY '$DBPASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
}
```

Next, we are going to create the `wordpress_config()` function. Inside of it, we are going to download the latest version of WordPress, extract it to the `/var/www/$DOMAIN` directory, create the `wp-config.php` file and append the required content to it.

```bash
wordpress_config () {
	db_config

	
	apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
	systemctl restart apache2
	sed -i "8i\\\t<Directory /var/www/$DOMAIN/>" /etc/apache2/sites-available/$DOMAIN.conf
	sed -i "9i\\\t\tAllowOverride All" /etc/apache2/sites-available/$DOMAIN.conf
	sed -i "10i\\\t</Directory>" /etc/apache2/sites-available/$DOMAIN.conf

	a2enmod rewrite
	systemctl restart apache2

	apt install curl
	cd /tmp
	curl -O https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	touch /tmp/wordpress/.htaccess
	cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
	mkdir /tmp/wordpress/wp-content/upgrade
	cp -a /tmp/wordpress/. /var/www/$DOMAIN
	chown -R www-data:www-data /var/www/$DOMAIN
	find /var/www/$DOMAIN/ -type d -exec chmod 750 {} \;
	find /var/www/$DOMAIN/ -type f -exec chmod 640 {} \;
	curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/$DOMAIN/wp-config.php
	echo "define('FS_METHOD', 'direct');" >> /var/www/$DOMAIN/wp-config.php
	sed -i "51,58d" /var/www/$DOMAIN/wp-config.php
	sed -i "s/database_name_here/$DBNAME/1" /var/www/$DOMAIN/wp-config.php
	sed -i "s/username_here/$DBUSERNAME/1" /var/www/$DOMAIN/wp-config.php
	sed -i "s/password_here/$DBPASSWORD/1" /var/www/$DOMAIN/wp-config.php
}
```

And finally, we are going to create the `execute()` function. Inside of it, we are going to call all the functions we created above.

```bash
execute () {
	lamp_install
	apache_virtual_host_setup
	ssl_config
	wordpress_config
}
```

With this, you have the script ready and you are ready to run it. And if you need the full script, you can find it in the next section.

# The full script

```bash
#!/bin/bash

echo 'Please enter your domain of preference without www:'
read DOMAIN
echo "Please enter your Database username:"
read DBUSERNAME
echo "Please enter your Database password:"
read DBPASSWORD
echo "Please enter your Database name:"
read DBNAME

ip=`hostname -I | cut -f1 -d' '`

lamp_install () {
	apt update -y
	apt install ufw
	ufw enable
	ufw allow OpenSSH
	ufw allow in "WWW Full"

	apt install apache2 -y
	apt install mariadb-server
	mysql_secure_installation -y
	apt install php libapache2-mod-php php-mysql -y
	sed -i "2d" /etc/apache2/mods-enabled/dir.conf
	sed -i "2i\\\tDirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" /etc/apache2/mods-enabled/dir.conf
	systemctl reload apache2
	
}

apache_virtual_host_setup () {
	mkdir /var/www/$DOMAIN
	chown -R $USER:$USER /var/www/$DOMAIN

	echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerName $DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerAlias www.$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e "\tDocumentRoot /var/www/$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e '\tErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/$DOMAIN.conf
	echo -e '\tCustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/$DOMAIN.conf
	echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf
	a2ensite $DOMAIN
	a2dissite 000-default
	systemctl reload apache2

}


ssl_config () {
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
	
	echo "SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLProtocol All -SSLv2 -SSLv3 -TLSv1 -TLSv1.1" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLHonorCipherOrder On" >> /etc/apache2/conf-available/ssl-params.conf
	echo "Header always set X-Frame-Options DENY" >> /etc/apache2/conf-available/ssl-params.conf
	echo "Header always set X-Content-Type-Options nosniff" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLCompression off" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLUseStapling on" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLStaplingCache \"shmcb:logs/stapling-cache(150000)\"" >> /etc/apache2/conf-available/ssl-params.conf
	echo "SSLSessionTickets Off" >> /etc/apache2/conf-available/ssl-params.conf
	
	cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
	sed -i "s/var\/www\/html/var\/www\/$DOMAIN/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "s/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/etc\/ssl\/certs\/apache-selfsigned.crt/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "s/etc\/ssl\/private\/ssl-cert-snakeoil.key/etc\/ssl\/private\/apache-selfsigned.key/1" /etc/apache2/sites-available/default-ssl.conf
	sed -i "4i\\\t\tServerName $ip" /etc/apache2/sites-available/default-ssl.conf
	sed -i "22i\\\tRedirect permanent \"/\" \"https://$ip/\"" /etc/apache2/sites-available/000-default.conf
	a2enmod ssl
	a2enmod headers
	a2ensite default-ssl
	a2enconf ssl-params
	systemctl reload apache2
}
	
db_config () {
	mysql -e "CREATE DATABASE $DBNAME;"
	mysql -e "GRANT ALL ON $DBNAME.* TO '$DBUSERNAME'@'localhost' IDENTIFIED BY '$DBPASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
}

wordpress_config () {
	db_config

	
	apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
	systemctl restart apache2
	sed -i "8i\\\t<Directory /var/www/$DOMAIN/>" /etc/apache2/sites-available/$DOMAIN.conf
	sed -i "9i\\\t\tAllowOverride All" /etc/apache2/sites-available/$DOMAIN.conf
	sed -i "10i\\\t</Directory>" /etc/apache2/sites-available/$DOMAIN.conf

	a2enmod rewrite
	systemctl restart apache2

	apt install curl
	cd /tmp
	curl -O https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	touch /tmp/wordpress/.htaccess
	cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
	mkdir /tmp/wordpress/wp-content/upgrade
	cp -a /tmp/wordpress/. /var/www/$DOMAIN
	chown -R www-data:www-data /var/www/$DOMAIN
	find /var/www/$DOMAIN/ -type d -exec chmod 750 {} \;
	find /var/www/$DOMAIN/ -type f -exec chmod 640 {} \;
	curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/$DOMAIN/wp-config.php
	echo "define('FS_METHOD', 'direct');" >> /var/www/$DOMAIN/wp-config.php
	sed -i "51,58d" /var/www/$DOMAIN/wp-config.php
	sed -i "s/database_name_here/$DBNAME/1" /var/www/$DOMAIN/wp-config.php
	sed -i "s/username_here/$DBUSERNAME/1" /var/www/$DOMAIN/wp-config.php
	sed -i "s/password_here/$DBPASSWORD/1" /var/www/$DOMAIN/wp-config.php
}

execute () {
	lamp_install
	apache_virtual_host_setup
	ssl_config
	wordpress_config
}
```

## Summary

The script does the following:

  * Install LAMP
  * Create a virtual host
  * Configure SSL
  * Install WordPress
  * Configure WordPress

With this being said, I hope you enjoyed this example. If you have any questions, please feel free to ask me directly at [@denctl](https://twitter.com/denctl).
