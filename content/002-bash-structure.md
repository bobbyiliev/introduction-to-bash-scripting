# Bash Structure

Let's start by creating a new file with a `.sh` extension. As an example, we could create a file called `devdojo.sh`.

To create that file, you can use the `touch` command:

```bash
touch devdojo.sh
```

Or you can use your text editor instead:

```bash
nano devdojo.sh
```

In order to execute/run a bash script file with the bash shell interpreter, the first line of a script file must indicate the absolute path to the bash executable:

```bash
#!/bin/bash
```

This is also called a [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)).

All that the shebang does is to instruct the operating system to run the script with the `/bin/bash` executable.
