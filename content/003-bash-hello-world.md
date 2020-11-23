# Bash Hello World

Once we have our `devdojo.sh` file created and we've specified the bash shebang on the very first line, we are ready to create our first `Hello World` bash script.

To do that, open the `devdojo.sh` file again and add the following after the `#!/bin/bash` line:

```bash
#!/bin/bash

echo "Hello World!"
```

Save the file and exit.

After that make the script executable by running:

```bash
chmod +x devdojo.sh
```

After that execute the file:

```bash
./devdojo.sh
```

You will see a "Hello World" message on the screen.

Another way to run the script would be:

```bash
bash devdojo.sh
```

As bash can be used interactively, you could run the following command directly in your terminal and you would get the same result:

```bash
echo "Hello DevDojo!"
```

Putting a script together is useful once you have to combine multiple commands together.
