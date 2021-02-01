# Bash Comments

As with any other programming language, you can add comments to your script. Comments are used to leave yourself notes through your code. 

To do that in Bash, you need to add the `#` symbol at the beginning of the line. Comments will never be rendered on the screen.

Here is an example of a comment:

```bash
# This is a comment and will not be rendered on the screen
```

Let's go ahead and add some comments to our script:

```bash
#!/bin/bash

# Ask the user for their name

read -p "What is your name? " name

# Greet the user
echo "Hi there $name"
echo "Welcome to DevDojo!"
```

Comments are a great way to describe some of the more complex functionality directly in your scripts so that other people could find their way around your code with ease.