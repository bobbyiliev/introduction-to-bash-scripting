# Debugging, testing and shortcuts

In order to debug your bash scripts, you can use `-x` when executing your scripts:

```bash
bash -x ./your_script.sh
```

Or you can add `set -x` before the specific line that you want to debug, `set -x` enables a mode of the shell where all executed commands are printed to the terminal.

Another way to test your scripts is to use this fantastic tool here:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Just copy and paste your code into the textbox, and the tool will give you some suggestions on how you can improve your script.

You can also run the tool directly in your terminal:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)

If you like the tool, make sure to star it on GitHub and contribute!

As a SysAdmin/DevOps, I spend a lot of my day in the terminal. Here are my favorite shortcuts that help me do tasks quicker while writing Bash scripts or just while working in the terminal.

The below two are particularly useful if you have a very long command.

* Delete everything from the cursor to the end of the line:

```
Ctrl + k
```

* Delete everything from the cursor to the start of the line:

```
Ctrl + u
```

* Delete one word backward from cursor:

```
Ctrl + w
```

* Search your history backward. This is probably the one that I use the most. It is really handy and speeds up my work-flow a lot:

```
Ctrl + r
```

* Clear the screen, I use this instead of typing the `clear` command:

```
Ctrl + l
```

* Stops the output to the screen:

```
Ctrl + s
```

* Enable the output to the screen in case that previously stopped by `Ctrl + s`:

```
Ctrl + q
```

* Terminate the current command

```
Ctrl + c
```

* Throw the current command to background:

```
Ctrl + z
```

I use those regularly every day, and it saves me a lot of time.

If you think that I've missed any feel free to join the discussion on [the DigitalOcean community forum](https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-shortcuts)!