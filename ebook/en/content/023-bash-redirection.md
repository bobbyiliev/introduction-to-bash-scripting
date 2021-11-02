# Redirection in Bash

A Linux superuser must have a good knowledge of pipes and redirection in Bash. It is an essential component of the system and is often helpful in the field of Linux System Administration.

When you run a command like ``ls``, ``cat``, etc, you get some output on the terminal. If you write a wrong command, pass a wrong flag or an wrong command-line argument, you get error output on the terminal.
In both the cases, you are given some text. It may seem like "just text" to you, but the system treats this text differently. This identifier is known as a File Descriptor (fd).

In Linux, there are 3 File Descriptors, **STDIN** (0); **STDOUT** (1) and **STDERR** (2).

* **STDIN** (fd: 0): Manages the input in the terminal.
* **STDOUT** (fd: 1): Manages the output text in the terminal.
* **STDERR** (fd: 2): Manages the error text in the terminal.

# Difference between Pipes and Redirections

Both *pipes* and *redidertions* redirect streams `(file descriptor)` of process being executed. The main diffrence is that *redirections* deal with `files stream`, sending the output stream to a file or sending the content of a given file to the input stream of the process.

On the otherhand a pipe connects two commands by sending the output stream of the first one to the input stream of the second one. without any redidertions specified.

# Redirection in Bash

## STDIN (Standard Input)
When you enter some input text for a command that asks for it, you are actually entering the text to the **STDIN** file descriptor. Run the ``cat`` command without any command-line arguments.
It may seem that the process has paused but in fact it's ``cat`` asking for **STDIN**. ``cat`` is a simple program and will print the text passed to **STDIN**. However, you can extend the use case by redirecting the input to the commands that take **STDIN**.

Example with ``cat``:
```
cat << EOF
Hello World!
How are you?
EOF
```
This will simply print the provided text on the terminal screen:
```
Hello World!
How are you?
```

The same can be done with other commands that take input via STDIN. Like, ``wc``:
```
wc -l << EOF
Hello World!
How are you?
EOF
```
The ``-l`` flag with ``wc`` counts the number of lines.
This block of bash code will print the number of lines to the terminal screen:
```
2
```

## STDOUT (Standard Output)
The normal non-error text on your terminal screen is printed via the **STDOUT** file descriptor. The **STDOUT** of a command can be redirected into a file, in such a way that the output of the command is written to a file instead of being printed on the terminal screen.
This is done simply with the help of ``>`` and ``>>`` operators.

Example:
```
echo "Hello World!" > file.txt
```
The following command will not print "Hello World" on the terminal screen, it will instead create a file called ``file.txt`` and will write the "Hello World" string to it.
This can be verified by runnning the ``cat`` command on the ``file.txt`` file.
```
cat file.txt
```

However, everytime you redirect the **STDOUT** of any command multiple times to the same file, it will remove the existing contents of the file to write the new ones.

Example:
```
echo "Hello World!" > file.txt
echo "How are you?" > file.txt
```

On running ``cat`` on ``file.txt`` file:
```
cat file.txt
```

You will only get the "How are you?" string printed.
```
How are you?
```

This is because the "Hello World" string has been overwritten.
This behaviour can be avoided using the ``>>`` operator.

The above example can be written as:
```
echo "Hello World!" > file.txt
echo "How are you?" >> file.txt
```

On running ``cat`` on the ``file.txt`` file, you will get the desired result.
```
Hello World!
How are you?
```

Alternatively, the redirection operator for **STDOUT** can also be written as ``1>``. Like,
```
echo "Hello World!" 1> file.txt
```

## STDERR (Standard Error)

The error text on the terminal screen is printed via the **STDERR** of the the command. For example:
```
ls --hello
```
would give an error messages. This error message is the **STDERR** of the command.

**STDERR** can be redirected using the ``2>`` operator.

```
ls --hello 2> error.txt
```

This command will redirect the error message to the ``error.txt`` file and write it to it. This can be verified by running the ``cat`` command on the ``error.txt`` file.

You can also use the ``2>>`` operator for **STDERR** just like you used ``>>`` for **STDOUT**.

Error messages in Bash Scripts can be undesirable sometimes. You can choose to ignore them by redirecting the error message to the ``/dev/null`` file.
``/dev/null`` is pseudo-device that takes in text and then immediately discards it.

The above example can be written follows to ignore the error text completely:
```
ls --hello 2> /dev/null
```

Of course, you can redirect both **STDOUT** and **STDERR** for the same command or script.
```
./install_package.sh > output.txt 2> error.txt
```

Both of them can be redirected to the same file as well.
```
./install_package.sh > file.txt 2> file.txt
```

There is also a shorter way to do this.
```
./install_package.sh > file.txt 2>&1
```

# Piping

So far we have seen how to redirect the **STDOUT**, **STDIN** and **STDOUT** to and from a file.
To concatenate the output of program *(command)* as the input of another program *(command)* you can use a vertical bar `|`.

Example:
```
ls | grep ".txt"
```
This command will list the files in the current directory and pass output to *`grep`* command which then filter the output to only show the files that contain the string ".txt".

Syntax:
```
[time [-p]] [!] command1 [ | or |& command2 ] …
```

You can also build arbitrary chains of commands by piping them together to achieve a powerful result.

This examble create a listing of every user which owns a file in a given directory as well as how many files and directories they own:
```
ls -l /projects/bash_scripts | tail -n +2 | sed 's/\s\s*/ /g' | cut -d ' ' -f 3 | sort | uniq -c
```
Output:
```
8 anne
34 harry
37 tina
18 ryan
```

# HereDocument

The symbol `<<` can be used to create a temporary file [heredoc] and redirect from it at the command line.
```
COMMAND << EOF
	ContentOfDocument
	...
	...
EOF
```
Note here that `EOF` represents the delimiter (end of file) of the heredoc. In fact, we can use any alphanumeric word in it's place to signify the start and the end of the file. For instance, this is a valid heredoc:
```
cat << randomword1
	This script will print these lines on the terminal.
	Note that cat can read from standard input. Using this heredoc, we can
	create a temporary file with these lines as it's content and pipe that
	into cat.
randomword1
```

Effectively it will appear as if the contents of the heredoc are piped into the command. This can make the script very clean if multiple lines need to be piped into a program.

Further, we can attach more pipes as shown:
```
cat << randomword1 | wc
	This script will print these lines on the terminal.
	Note that cat can read from standard input. Using this heredoc, we can
	create a temporary file with these lines as it's content and pipe that
	into cat.
randomword1
```

Also, pre-defined variables can be used inside the heredocs.

# HereString

Herestrings are quite similar to heredocs but use `<<<`. These are used for single line strings that have to be piped into some program. This looks cleaner that heredocs as we don't have to specify the delimiter.

```
wc <<<"this is an easy way of passing strings to the stdin of a program (here wc)"
```

Just like heredocs, herestrings can contain variables.

## Summary
|**Operator**   |**Description**   |
|:---|:---|
|`>`|`Save output to a file`|
|`>>`|`Append output to a file`|
|`<`|`Read input from a file`|
|`2>`|`Redirect error messages`|
|`\|`|`Send the output from one program as input to another program`|
|`<<`|`Pipe multiple lines into a program cleanly`|
|`<<<`|`Pipe a single line into a program cleanly`|
