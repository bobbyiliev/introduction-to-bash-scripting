# Executing BASH scripts on Multiple Remote Servers

Any command that you can run from the command line can be used in a bash script. Scripts are used to run a series of commands. Bash is available by default on Linux and macOS operating systems.

Let's have a hypothetical scenario where you need to execute a BASH script on multiple remote servers, but you don't want to manually copy the script to each server, then again login to each server individually and only then execute the script.

Of course you could use a tool like Ansible but let's learn how to do that with Bash!

## Prerequisites

For this example I will use 3 remote Ubuntu servers deployed on DigitalOcean. If you don't have a Digital Ocean account yet, you can sign up for DigitalOcean and get $100 free credit via this referral link here:

[https://m.do.co/c/2a9bba940f39](https://m.do.co/c/2a9bba940f39)

Once you have your Digital Ocean account ready go ahead and deploy 3 droplets. 

I've gone ahead and created 3 Ubuntu servers:

![DigitalOcean Ubuntu servers](https://imgur.com/09xmq41.png)

I'll put a those servers IP's in a `servers.txt` file which I would use to loop though with our Bash script.

If you are new to DigitalOcean you can follow the steps on how to create a Droplet here:

* [How to Create a Droplet from the DigitalOcean Control Panel](https://www.digitalocean.com/docs/droplets/how-to/create/)

You can also follow the steps from this video here on how to do your initial server setup:

* [How to do your Initial Server Setup with Ubuntu](https://youtu.be/7NL2_4HIgKU)

Or even better, you can follow this article here on how to automate your initial server setup with Bash:

[Automating Initial Server Setup with Ubuntu 18.04 with Bash](https://www.digitalocean.com/community/tutorials/automating-initial-server-setup-with-ubuntu-18-04)

With the 3 new servers in place, we can go ahead and focus on running our Bash script on all of them with a single command!

## The BASH Script

I will reuse the demo script from the previous chapter with some slight changes. It simply executes a few checks like the current memory usage, the current CPU usage, the number of TCP connections and the version of the kernel.

```bash
#!/bin/bash

##
# BASH script that checks the following:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version
##

##
# Memory check
##
server_name=$(hostname)

function memory_check() {
    echo "#######"
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo "#######"
}


function cpu_check() {
    echo "#######"
	echo "The current CPU load on ${server_name} is: "
    echo ""
	uptime
    echo "#######"
}

function tcp_check() {
    echo "#######"
	echo "Total TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo "#######"
}

function kernel_check() {
    echo "#######"
	echo "The exact Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo "#######"
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

all_checks
```

Copy the code bellow and add this in a file called `remote_check.sh`. You can also get the script from [here](https://devdojo.com/bobbyiliev/executing-bash-script-on-multiple-remote-server).

## Running the Script on all Servers

Now that we have the script and the servers ready and that we've added those servers in our servers.txt file we can run the following command to loop though all servers and execute the script remotely without having to copy the script to each server and individually connect to each server.

```bash
for server in $(cat servers.txt) ; do ssh your_user@${server} 'bash -s' < ./remote_check.sh ; done
```

What this for loop does is, it goes through each server in the servers.txt file and then it runs the following command for each item in the list:

```bash
ssh your_user@the_server_ip 'bash -s' < ./remote_check.sh
```

You would get the following output:

![Running bash script on multiple remote servers](https://imgur.com/B1AmhUP.png)

## Conclusion

This is just a really simple example on how to execute a simple script on multiple servers without having to copy the script to each server and without having to access the servers individually.

Of course you could run a much more complex script and on many more servers.

If you are interested in automation, I would recommend checking out the Ansible resources page on the DigitalOcean website:

[Ansible Resources](https://www.digitalocean.com/community/tags/ansible)

>{notice} This content was initially posted on [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
