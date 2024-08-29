# Bash Conditionals

In the last section, we covered some of the most popular conditional expressions. We can now use them with standard conditional statements like `if`, `if-else` and `switch case` statements.

## If statement

The format of an `if` statement in Bash is as follows:

```bash
if [[ some_test ]]
then
    <commands>
fi
```

Here is a quick example which would ask you to enter your name in case that you've left it empty:

```bash
#!/bin/bash

# Bash if statement example

read -p "What is your name? " name

if [[ -z ${name} ]]
then
    echo "Please enter your name!"
fi
```

## If Else statement

With an `if-else` statement, you can specify an action in case that the condition in the `if` statement does not match. We can combine this with the conditional expressions from the previous section as follows:

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

You can use the above if statement with all of the conditional expressions from the previous chapters:

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

Here is another example of an `if` statement which would check your current `User ID` and would not allow you to run the script as the `root` user:

```bash
#!/bin/bash

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
fi
```

If you put this on top of your script it would exit in case that the EUID is 0 and would not execute the rest of the script. This was discussed on [the DigitalOcean community forum](https://www.digitalocean.com/community/questions/how-to-check-if-running-as-root-in-a-bash-script).

You can also test multiple conditions with an `if` statement. In this example we want to make sure that the user is neither the admin user nor the root user to ensure the script is incapable of causing too much damage. We'll use the `or` operator in this example, noted by `||`. This means that either of the conditions needs to be true. If we used the `and` operator of `&&` then both conditions would need to be true.

```bash
#!/bin/bash

admin="devdojo"

read -p "Enter your username? " username

# Check if the username provided is the admin

if [[ "${username}" != "${admin}" ]] && [[ $EUID != 0 ]] ; then
    echo "You are not the admin or root user, but please be safe!"
else
    echo "You are the admin user! This could be very destructive!"
fi
```

If you have multiple conditions and scenarios, then can use `elif` statement with `if` and `else` statements.

```bash
#!/bin/bash

read -p "Enter a number: " num

if [[ $num -gt 0 ]] ; then
    echo "The number is positive"
elif [[ $num -lt 0 ]] ; then
    echo "The number is negative"
else
    echo "The number is 0"
fi
```

## Switch case statements

As in other programming languages, you can use a `case` statement to simplify complex conditionals when there are multiple different choices. So rather than using a few `if`, and `if-else` statements, you could use a single `case` statement.

The Bash `case` statement syntax looks like this:

```bash
case $some_variable in

  pattern_1)
    commands
    ;;

  pattern_2| pattern_3)
    commands
    ;;

  *)
    default commands
    ;;
esac
```

A quick rundown of the structure:

* All `case` statements start with the `case` keyword.
* On the same line as the `case` keyword, you need to specify a variable or an expression followed by the `in` keyword.
* After that, you have your `case` patterns, where you need to use `)`  to identify the end of the pattern.
* You can specify multiple patterns divided by a pipe: `|`.
* After the pattern, you specify the commands that you would like to be executed in case that the pattern matches the variable or the expression that you've specified.
* All clauses have to be terminated by adding `;;` at the end.
* You can have a default statement by adding a `*` as the pattern.
* To close the `case` statement, use the `esac` (case typed backwards) keyword.

Here is an example of a Bash `case` statement:

```bash
#!/bin/bash

read -p "Enter the name of your car brand: " car

case $car in

  Tesla)
    echo -n "${car}'s car factory is in the USA."
    ;;

  BMW | Mercedes | Audi | Porsche)
    echo -n "${car}'s car factory is in Germany."
    ;;

  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "${car}'s car factory is in Japan."
    ;;

  *)
    echo -n "${car} is an unknown car brand"
    ;;

esac
```

With this script, we are asking the user to input a name of a car brand like Telsa, BMW, Mercedes and etc.

Then with a `case` statement, we check the brand name and if it matches any of our patterns, and if so, we print out the factory's location.

If the brand name does not match any of our `case` statements, we print out a default message: `an unknown car brand`.

## Conclusion

I would advise you to try and modify the script and play with it a bit so that you could practice what you've just learned in the last two chapters!

For more examples of Bash `case` statements, make sure to check chapter 16, where we would create an interactive menu in Bash using a `cases` statement to process the user input.
