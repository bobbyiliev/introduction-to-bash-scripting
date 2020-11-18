# Bash Conditionals

In the last section we covered some of the most popular conditional expressions, we can now use them with standard conditional statements like `if` and `if-else` statements.

The format of an `if` statement in bash is as follows:

```bash
if [[ some_test ]]
then
    <commands>
fi
```

We can then combine this with the conditional expressions from the previous section as follows:

```bash
#!/bin/bash

# Bash if statement example

read -p "What is your name? " name

if [[ -z ${name} ]]
then
    echo "Please enter your name!"
else
    echo "Hi there ${name}"
fi
```

You can use the above if statement with all of the conditional expressions from the previous secton!

```bash
#!/bin/bash

admin="devdojo"

read -p "Enter your username? " username

# Check if the username provided is the admin

if [[ "${username}" == "${admin}" ]] ; then
    echo "You are the admin user!"
else
    echo "You are NOT the admin user!"
fi
```