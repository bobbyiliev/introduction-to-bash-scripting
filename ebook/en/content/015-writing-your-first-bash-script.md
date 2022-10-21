# Write your first Bash script

Let's try to put together what we've learned so far and create our first Bash script!

## Planning the script

As an example, we will write a script that would gather some useful information about our server like:

* Current Disk usage
* Current CPU usage
* Current RAM usage
* Check the exact Kernel version

Feel free to adjust the script by adding or removing functionality so that it matches your needs.

## Writing the script

The first thing that you need to do is to create a new file with a `.sh` extension. I will create a file called `status.sh` as the script that we will create would give us the status of our server.

Once you've created the file, open it with your favorite text editor.

As we've learned in chapter 1, on the very first line of our Bash script we need to specify the so-called [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)):

```bash
#!/bin/bash
```

All that the shebang does is to instruct the operating system to run the script with the /bin/bash executable.

## Adding comments

Next, as discussed in chapter 6, let's start by adding some comments so that people could easily figure out what the script is used for. To do that right after the shebang you can just add the following:

```bash
#!/bin/bash

# Script that returns the current server status
```

## Adding your first variable

Then let's go ahead and apply what we've learned in chapter 4 and add some variables which we might want to use throughout the script.

To assign a value to a variable in bash, you just have to use the `=` sign. For example, let's store the hostname of our server in a variable so that we could use it later:

```bash
server_name=$(hostname)
```

By using `$()` we tell bash to actually interpret the command and then assign the value to our variable.

Now if we were to echo out the variable we would see the current hostname:

```bash
echo $server_name
```

## Adding your first function

As you already know after reading chapter 12, in order to create a function in bash you need to use the following structure:

```bash
function function_name() {
    your_commands
}
```

Let's create a function that returns the current memory usage on our server:

```bash
function memory_check() {
    echo ""
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo ""
}
```

Quick run down of the function:

* `function memory_check() {` - this is how we define the function
* `echo ""` - here we just print a new line
* `echo "The current memory usage on ${server_name} is: "` - here we print a small message and the `$server_name` variable
* `}` - finally this is how we close the function

Then once the function has been defined, in order to call it, just use the name of the function:

```bash
# Define the function
function memory_check() {
    echo ""
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo ""
}

# Call the function
memory_check
```

## Adding more functions challenge

Before checking out the solution, I would challenge you to use the function from above and write a few functions by yourself.

The functions should do the following:

* Current Disk usage
* Current CPU usage
* Current RAM usage
* Check the exact Kernel version

Feel free to use google if you are not sure what commands you need to use in order to get that information.

Once you are ready, feel free to scroll down and check how we've done it and compare the results! 

Note that there are multiple correct ways of doing it!

## The sample script

Here's what the end result would look like:

```bash
#!/bin/bash

##
# BASH script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version
##

server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

all_checks
```

## Conclusion

Bash scripting is awesome! No matter if you are a DevOps/SysOps engineer, developer, or just a Linux enthusiast, you can use Bash scripts to combine different Linux commands and automate boring and repetitive daily tasks, so that you can focus on more productive and fun things!

>{notice} This was initially posted on [DevDojo.com](https://devdojo.com/bobbyiliev/introduction-to-bash-scripting)
