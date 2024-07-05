# Creating an interactive menu in Bash

In this tutorial, I will show you how to create a multiple-choice menu in Bash so that your users could choose between what action should be executed!

We would reuse some of the code from the previous chapter, so if you have not read it yet make sure to do so.

## Planning the functionality

Let's start again by going over the main functionality of the script:

* Checks the current Disk usage
* Checks the current CPU usage
* Checks the current RAM usage
* Checks the check the exact Kernel version

In case that you don't have it on hand, here is the script itself:

```bash
#!/bin/bash

##
# BASH menu script that checks:
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
```

We will then build a menu that allows the user to choose which function to be executed.

Of course, you can adjust the function or add new ones depending on your needs.

## Adding some colors

In order to make the menu a bit more 'readable' and easy to grasp at first glance, we will add some color functions.

At the beginning of your script add the following color functions:

```bash
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
```

You can use the color functions as follows:

```bash
echo -ne $(ColorBlue 'Some text here')
```

The above would output the `Some text here` string and it would be blue!

# Adding the menu

Finally, to add our menu, we will create a separate function with a case switch for our menu options:

```bash
menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
			0) exit 0 ;;
			*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
```

### A quick rundown of the code

First we just echo out the menu options with some color:

```
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections 
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
```

Then we read the answer of the user and store it in a variable called `$a`:

```bash
        read a
```

Finally, we have a switch case which triggers a different function depending on the value of `$a`:

```bash
        case $a in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
```

At the end we need to call the menu function to actually print out the menu:

```bash
# Call the menu function
menu
```

## Testing the script

In the end, your script will look like this:

```bash
#!/bin/bash

##
# BASH menu script that checks:
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

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections 
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
```

To test the script, create a new filed with a `.sh` extension, for example: `menu.sh` and then run it:

```bash
bash menu.sh
```

The output that you would get will look like this:

```bash
My First Menu
1) Memory usage
2) CPU load
3) Number of TCP connections
4) Kernel version
5) Check All
0) Exit
Choose an option:
```

You will be able to choose a different option from the list and each number will call a different function from the script:

![Nice Bash interactive menu](https://imgur.com/8EgxX4m.png)

## Conclusion

You now know how to create a Bash menu and implement it in your scripts so that users could select different values!

>{notice} This content was initially posted on [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)
