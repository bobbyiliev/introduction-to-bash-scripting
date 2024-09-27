# Bash Loops

As with any other language, loops are very convenient. With Bash you can use `for` loops, `while` loops, and `until` loops.

## For loops

Here is the structure of a for loop:

```bash
for var in ${list}
do
    your_commands
done
```

Example:

```bash
#!/bin/bash

users="devdojo bobby tony"

for user in ${users}
do
    echo "${user}"
done
```

A quick rundown of the example:

* First, we specify a list of users and store the value in a variable called `$users`.
* After that, we start our `for` loop with the `for` keyword.
* Then we define a new variable which would represent each item from the list that we give. In our case, we define a variable called `user`, which would represent each user from the `$users` variable.
* Then we specify the `in` keyword followed by our list that we will loop through.
* On the next line, we use the `do` keyword, which indicates what we will do for each iteration of the loop.
* Then we specify the commands that we want to run.
* Finally, we close the loop with the `done` keyword.

You can also use `for` to process a series of numbers. For example here is one way to loop through from 1 to 10:

```bash
#!/bin/bash

for num in {1..10}
do
    echo ${num}
done
```

## While loops

The structure of a while loop is quite similar to the `for` loop:

```bash
while [ your_condition ]
do
    your_commands
done
```

Here is an example of a `while` loop:

```bash
#!/bin/bash

counter=1
while [[ $counter -le 10 ]]
do
    echo $counter
    ((counter++))
done
```

First, we specified a counter variable and set it to `1`, then inside the loop, we added counter by using this statement here: `((counter++))`. That way, we make sure that the loop will run 10 times only and would not run forever. The loop will complete as soon as the counter becomes 10, as this is what we've set as the condition: `while [[ $counter -le 10 ]]`.

Let's create a script that asks the user for their name and not allow an empty input:

```bash
#!/bin/bash

read -p "What is your name? " name

while [[ -z ${name} ]]
do
    echo "Your name can not be blank. Please enter a valid name!"
    read -p "Enter your name again? " name
done

echo "Hi there ${name}"
```

Now, if you run the above and just press enter without providing input, the loop would run again and ask you for your name again and again until you actually provide some input.

## Until Loops

The difference between `until` and `while` loops is that the `until` loop will run the commands within the loop until the condition becomes true.

Structure:

```bash
until [[ your_condition ]]
do
    your_commands
done
```

Example:

```bash
#!/bin/bash

count=1
until [[ $count -gt 10 ]]
do
    echo $count
    ((count++))
done
```

## Continue and Break
As with other languages, you can use `continue` and `break` with your bash scripts as well:

* `continue` tells your bash script to stop the current iteration of the loop and start the next iteration.

The syntax of the continue statement is as follows:

```bash
continue [n]
```

The [n] argument is optional and can be greater than or equal to 1. When [n] is given, the n-th enclosing loop is resumed. continue 1 is equivalent to continue.

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    if [[ $i -eq 2 ]] 
    then
        echo "skipping number 2"
        continue
    fi
    echo "i is equal to $i"
done
```

We can also use continue command in similar way to break command for controlling multiple loops.

* `break` tells your bash script to end the loop straight away.

The syntax of the break statement takes the following form:

```bash
break [n]
```
[n] is an optional argument and must be greater than or equal to 1. When [n] is provided, the n-th enclosing loop is exited. break 1 is equivalent to break.

Example:

```bash
#!/bin/bash

num=1
while [[ $num -lt 10 ]] 
do
    if [[ $num -eq 5 ]] 
    then
        break
    fi
    ((num++))
done
echo "Loop completed"
```

We can also use break command with multiple loops. If we want to exit out of current working loop whether inner or outer loop, we simply use break but if we are in inner loop & want to exit out of outer loop, we use break 2.

Example:

```bash
#!/bin/bash

for (( a = 1; a < 10; a++ ))
do
    echo "outer loop: $a"
    for (( b = 1; b < 100; b++ ))
    do
        if [[ $b -gt 5 ]] 
        then
            break 2
        fi
        echo "Inner loop: $b "
    done
done
```

The bash script will begin with a=1 & will move to inner loop and when it reaches b=5, it will break the outer loop.
We can use break only instead of break 2, to break inner loop & see how it affects the output.
