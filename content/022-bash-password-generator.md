# Password Generator Bash Script

It's not uncommon situation where you will need to generate a random password that you can use for any software installation or when you sign-up to any website.

There are a lot of options in order to achieve this. You can use a password manager/vault where you often have the option to randomly generate a password or to use a website that can generate the password on your behalf.

You can also use Bash in your terminal (command-line) to generate a password that you can quickly use. There are a lot of ways to achieve that and I will make sure to cover few of them and will leave up to you to choose which option is most suitable with your needs.

## :warning: Security

**This script is intended to practice your bash scripting skills. You can have fun while doing simple projects with BASH, but security is not a joke, so please make sure you do not save your passwords in plain text in a local file or write them down by hand on a piece of paper.**

**I will highly recommend everyone to use secure and trusted providers to generate and save the passwords.**

## Script summary

Let me first do a quick summary of what our script is going to do.:

1. We will have to option to choose the password characters length when the script is executed.
2. The script will then generate 5 random passwords with the length that was specified in step 1

## Prerequisites

You would need a bash terminal and a text editor. You can use any text editor like vi, vim, nano or Visual Studio Code.

I'm running the script locally on my Linux laptop but if you're using Windows PC you can ssh to any server of your choice and execute the script there.

Although the script is pretty simple, having some basic BASH scripting knowledge will help you to better understand the script and how it's working.

## Generate a random password
One of the great benefits of Linux is that you can do a lot of things using different methods. When it comes to generating a random string of characters it's not different as well.

You can use several commands in order to generate a random string of characters. I will cover few of them and will provide some examples.

- Using the ```date``` command.
The date command will output the current date and time. However we also further manipulate the output in order to use it as randomly generated password. We can hash the date using md5, sha or just run it through base64. These are few examples:

```
date | md5sum
94cb1cdecfed0699e2d98acd9a7b8f6d  -
```
using sha256sum:

```
date | sha256sum
30a0c6091e194c8c7785f0d7bb6e1eac9b76c0528f02213d1b6a5fbcc76ceff4  -
```
using base64:
```
date | base64
0YHQsSDRj9C90YMgMzAgMTk6NTE6NDggRUVUIDIwMjEK
```

- We can also use openssl in order to generate pseudo-random bytes and run the output through base64. An example output will be:
```
openssl rand -base64 10
9+soM9bt8mhdcw==
```
Keep in mind that openssl might not be installed on your system so it's likely that you will need to install it first in order to use it.

- The most preferred way is to use the pseudorandom number generator - /dev/urandom
since it is intended for most cryptographic purposes. We would also need to manipulate the output using ```tr``` in order to translate it. An example command is:

```
tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n 1
```
With this command we take the output from /dev/urandom and translate it with ```tr``` while using all letters and digits and print the desired number of characters.

## The script
First we begin the script with the shebang. We use it to tell the operating system which interpreter to use to parse the rest of the file.
```
#!/bin/bash
```
We can then continue and ask the user for some input. In this case we would like to know how many characters the password needs to be:

```
# Ask user for password length
clear
printf "\n"
read -p "How many characters you would like the password to have? " pass_length
printf "\n"
``` 
Generate the passwords and then print it so the user can use it.
```
# This is where the magic happens!
# Generate a list of 10 strings and cut it to the desired value provided from the user

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_lenght} | head -n 1); done

# Print the strings
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"
```

## The full script:
```
#!/bin/bash
#=======================================
# Password generator with login option
#=======================================

# Ask user for the string length
clear
printf "\n"
read -p "How many characters you would like the password to have? " pass_lenght
printf "\n"

# This is where the magic happens!
# Generate a list of 10 strings and cut it to the desired value provided from the user

for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_lenght} | head -n 1); done

# Print the strings
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"
```

## Conclusion
This is pretty much how you can use simple bash script to generate random passwords. 

:warning: **As already mentioned, please make sure to use strong passwords in order to make sure your account is protected. Also whenever is possible use 2 factor authentication as this will provide additional layer of security for your account.**

While the script is working fine, it expects that the user will provide the requested input.  In order to prevent any issues you would need to do some more advance checks on the user input in order to make sure the script will continue to work fine even if the provided input does not match our needs.

## Contributed by
[Alex Georgiev](https://twitter.com/alexgeorgiev17)
