# Bash Variables

As with any other programming language, you can use variables in Bash as well. However, there are no data types, and a variable in Bash can contain numbers and characters.

To assign a value to a variable, all you need to do is use the `=` sign:

```bash
name="DevDojo"
```

>{notice} as an important note, you can not have spaces before and after the `=` sign.

After that, to access the variable, you have to use the `$` and reference it like this:

```bash
echo $name
```

Wrapping the variable name between curly brackets is not required but is considered good practice, and I would advise to use them whenever you can:

```bash
echo ${name}
```

The above would output: `DevDojo` as this is the value of our variable.

Next, let's update our `devdojo.sh` script and include a variable.

Again, with your favorite text editor, open the file:

```bash
nano devdojo.sh
```

And update the file, so it looks like this:

```bash
#!/bin/bash

name="DevDojo"

echo "Hi there $name"
```

Save it and run it again:

```bash
./devdojo.sh
```

You would see the following output on your screen:

```bash
Hi there DevDojo
```

Here is a rundown of the script:

* `#!/bin/bash` - first, we specified our shebang
* `name=DevDojo` - then we defined a variable called `name` and assigned a value to it
* `echo "Hi there $name"` - finally we output the content of the variable on the screen by using `echo`

You can also add multiple variables:

```bash
#!/bin/bash

name="DevDojo"
greeting="Hello"

echo "$greeting $name"
```

Save it and run it again:

```bash
./devdojo.sh
```

You would see the following output on your screen:

```bash
Hello DevDojo
```

Note that you don't necessarily need to add semicolon `;` at the end of each line. It would work both ways, a bit like in JavaScript!