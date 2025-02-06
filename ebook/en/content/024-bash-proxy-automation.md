# Automating proxy configuration using bash

Many private organizations like Corporates, schools, colleges, etc. nowadays use a proxy server that adds a protective layer for its users to surf the internet safely.

However, it is observed that proxy servers do not enable Internet access from terminal. Thus the users are not able to update their systems, download their favourite packages or perform simple tasks like pinging a web-server.

This bash script helps automating the proxy configuration.

<hr />

## Prerequisites

You would need the following things in order to be able to complete this tutorial successfully:

* Ubuntu/Debian-like operating system.

* A proxy server, generally provided by your organization or a paid proxy provider if you will, free proxies are also available just in case you want to try. However paid proxies always provide better services.

<hr />

## At the end, commands will work with in the following manner
TURN ON:
```
myproxy on
source /etc/profile.d/proxy.sh
```

TURN OFF:
```
myproxy on
source /etc/profile.d/proxy.sh
```

We will require 3 scripts in total:

* proxy_setup.sh
* myproxy.sh
* uninstall.sh

<hr />

# proxy_setup script

```
echo "-------------------------------------------------------------"
echo "Welcome to the proxy setup program!"
echo "-------------------------------------------------------------"
echo ""
```

Take the username and store in a variable for further use.
```
PCUSER="$(whoami)"
```

Initializing main script:
```
echo "Initializing proxy setup process..."
echo "Enter the IP address for your proxy server : "
read proxy
echo "Enter the port number : "
read port
echo "Enter the username (your MIS) : "
read username
echo "Enter the password : "
read password
```

Displaying the information acquired thus far:
```
echo "display information given so far..."
echo "proxy : $proxy, port : $port, username : $username, password : $password"
```

Check if the information above is properly entered:
```
if [[ -z $proxy ]] || [[ -z $port ]] || [[ -z username ]] || [[ -z password ]]; then
	echo "Please enter the proper credentials"
	exit 0
fi
```
```
echo "NOTE :
The proxy setup requires to be done in 4 phases - 
1. Manually configuring the proxy in Settings -> Network -> Network Proxy -> Manual -> \"Enter credentials\"
2. Set system-wide proxy settings 
3. Set proxy for APT package manager
4. Set proxy for wget CLI only
You need to complete the first step before moving to the second before you can actually connect to the internet from the terminal or even browser when behind a proxy.
Manually fill in the proxy settings as told above.
The steps 2, 3 and 4 have been automated using this interactive script written in bash. 

Let's begin..."
```
```
echo "Setting up global proxy in /etc/profile.d/proxy.sh"

touch /etc/profile.d/proxy.sh       
path_to_global_proxy="/etc/profile.d/proxy.sh"   
```
**path_to_global_proxy** variable stores the environment variables and curl configuration

To unset variables:
```
unset_vars="/etc/profile.d/unset_proxy.sh"
sudo touch /etc/profile.d/unset_proxy.sh
```

Writing into unset_proxy.sh the variables to be unset:
```
cat <<EOF > $unset_vars
#!/bin/bash

unset no_proxy
unset ftp_proxy
unset https_proxy
unset NO_PROXY
unset FTP_PROXY
unset HTTPS_PROXY
unset HTTP_PROXY
unset http_proxy
EOF
```

Writing to the /etc/profile.d/proxy.sh file
```
cat <<EOF > $path_to_global_proxy
# set proxy config via profile.d - should apply for all users

# For http/https/ftp/no_proxy
export http_proxy="http://$username:$password@$proxy:$port/"
export https_proxy="http://$username:$password@$proxy:$port/"
export ftp_proxy="http://$username:$password@$proxy:$port/"
export no_proxy="127.0.0.1,localhost"

# For curl
export HTTP_PROXY="http://$username:$password@$proxy:$port/"
export HTTPS_PROXY="http://$username:$password@$proxy:$port/"
export FTP_PROXY="http://$username:$password@$proxy:$port/"
export NO_PROXY="127.0.0.1,localhost"
EOF
```

Take user permission whether the script can be sourced in order for it to function else, it will load up after the next boot.
```
echo "The proxy file created needs to be sourced. Do you wish to continue? (y/n)"
```
```
if [ $choice = 'y' ]; then 
	source $path_to_global_proxy

	echo "To check if the proxy variables have been initialized, enter the following command on the terminal : "
	echo "env | grep -i proxy"
elif [ $choice = "n" ]; then
	sudo rm $path_to_global_proxy
	printf "\\n exiting..."
	exit 0
fi
```

```
echo "Completed step 2. Initializing step 3."
```

Create and write in the 80proxy file -  **apt configuration**
```
touch /etc/apt/apt.conf.d/80proxy       

apt_proxy="/etc/apt/apt.conf.d/80proxy"	

cat <<EOF > $apt_proxy
Acquire::http::proxy "http://$username:$password@$proxy:$port/";
Acquire::https::proxy "http://$username:$password@$proxy:$port/";
Acquire::ftp::proxy "http://$username:$password@$proxy:$port/";
EOF
```

```
echo "Completed step 3. Initializing the final step."
```

Create and write in the .wgetrc file - **wget configuration**
```
sudo touch /home/$PCUSER/.wgetrc       

wget_proxy="/home/$PCUSER/.wgetrc"	
touch ./tocopy

cat <<EOF > $wget_proxy
use_proxy = on
http_proxy = http://$username:$password@$proxy:$port/
https_proxy = http://$username:$password@$proxy:$port/
ftp_proxy = http://$username:$password@$proxy:$port/
EOF


cat <<EOF > ./tocopy
use_proxy = on
http_proxy = http://$username:$password@$proxy:$port/
https_proxy = http://$username:$password@$proxy:$port/
ftp_proxy = http://$username:$password@$proxy:$port/
EOF
```

```
if [ ! -f "/home/$PCUSER/.wgetrc" ]; then
	echo "Cannot create .wgetrc file in the home directory
	"
	echo "Please follow the following instructions to setup wget proxy
	"
	echo "cd ~"
	echo "sudo touch .wgetrc"
	echo "copy paste the contents of tocopy file created in the proxies folder to ~/.wgetrc folder manually"
	echo "Delete the tocopy file after copying by typing sudo rm tocopy inside the proxies folder"
else
	echo "Completed the final step"
fi
```

## NOTE:

Here, it is observed that in some PCs, /home/$USER/.wgetrc file is not created from within the script thus we cannot write to the file. In order to avoid missing wget configuration, we will write the contents that are to be written in the .wgetrc file into a ***tocopy*** file in the current working directory. And then we will manually copy the contents of ./tocopy file and paste in the /home/$USER/.wgetrc file.


### Ending notes:
```
echo "--------------------------------------------------------------------------------------"

echo "
Since you are behind a proxy server, you cannot use the ping command. So you have to install httping to ensure that your proxy server is running."

echo "
Install httping using \"sudo apt install httping\"."

echo "
Now try running the following commands to check that your proxy is up and running:"

echo "
httping -x <proxy>:<port> -g google.com"

echo "
Check your curl and wget by trying out those commands"

echo "
In case of any issues/errors, feel free to contact."

echo "
Thank you!"

exit 0
```

<hr />

# myproxy script

Now that the proxy is set up, we can you use the proxy server very well. However if we happen to switch to a regular wifi network without proxy, we need to comment out those config files and unset the environment variables. Thus we are writing this script.

#!/bin/bash

We need two files - (i) proxy.sh to be sourced while turning on the proxy and (ii) unset_proxy.sh to unset all the proxy environment variables set by proxy.sh. 
We store their paths in the global variables hereby. 
```
set_proxy="/etc/profile.d/proxy.sh"
unset_vars="/etc/profile.d/unset_proxy.sh"
```

Check if "myproxy" command has an argument or not (expected argument : on/off):
```
if [ "$#" -ne 1 ] ; then
	echo "$0: exactly 1 argument is expected : (on/off)"
	exit 3
fi
```

We will be checking if these three files exist or not : 
1. For curl and system-wide ( /etc/profile.d/proxy.sh)
2. For apt ( /etc/apt/apt.conf.d/80proxy )
3. For wget ( /home/$USER/.wgetrc)

Check if .wgetrc exists:
```
if [ -f /home/$USER/.wgetrc ]; then
	wget_proxy_path="/home/$USER/.wgetrc"
fi
```

Check if 80proxy exists:
```
if [ -f /etc/apt/apt.conf.d/80proxy ]; then
	apt_proxy_path="/etc/apt/apt.conf.d/80proxy"
fi 
```

### Turn off the overall proxy
```
if [ $1 = 'off' ];
then	echo "Turning proxy off ...."
	gsettings set org.gnome.system.proxy mode none
	sudo sed -i 's/^/#/' "$wget_proxy_path" "$apt_proxy_path"
	
	if [ -f /etc/profile.d/unset_proxy.sh ]; then
		. $unset_vars	
	fi
fi
```

The sed command is used to manipulate a file stream. We use the sed command to comment out (i.e. add the '#' symbol at the start of the line) the configuration files that we have edited using the **proxy_setup** script.

### Turn on the overall proxy
```
if [ $1 = "on" ];
then	echo "turning proxy on...."
	gsettings set org.gnome.system.proxy mode manual
	sudo sed -i 's/#//g' "$wget_proxy_path" "$apt_proxy_path"
	. $set_proxy 
fi
```

<hr />

# TO UNINSTALL THE PROXY SCRIPT:

First run the two commands to turn off the proxy:
myproxy off
source /etc/profile.d/unset_proxy.sh

```
#!/bin/bash

# to uninstall apt proxy configuration
sudo rm /etc/apt/apt.conf.d/80proxy

# to uninstall wget proxy configurations
sudo rm /home/$USER/.wgetrc

# to uninstall system-wide proxy
sudo rm /etc/profile.d/proxy.sh
sudo rm /etc/profile.d/unset_proxy.sh
```


The above script is self-explanatory. We are simply removing the configuration files that we setup.

<hr />

## Final touch-up to execute the script

Open a terminal in the working directory:

### Running the proxy_setup.sh script
* Make the script executable
```
sudo chmod +x proxy_setup.sh
```
* Execute the script
```
sudo ./proxy_setup.sh
```
* Setup the environment variables
```
source /etc/profile.d/proxy.sh
```
<hr />

### Running the myproxy.sh script

```
sudo chmod +x myproxy
```
Move the **myproxy** script to **/usr/local/bin**. Thus the user can now toggle proxy from any directory.
```
sudo mv ./myproxy /usr/local/bin/
```
<hr />

### To uninstall the myproxy functionality
Run the uninstall script
```
sudo ./uninstall.sh
```

