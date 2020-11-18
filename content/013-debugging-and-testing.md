# Debugging and testing

In order to debug your bash scripts, you can use `-x` when executing your scripts:

```bash
bash -x ./your_script.sh
```

Or you can add `set -x` before the specific line that you want to debug, `set -x` enables a mode of the shell where all executed commands are printed to the terminal.


Another way to test your scripts is to use this amazing tool here:

[https://www.shellcheck.net/](https://www.shellcheck.net/)

Just copy and paste your script into the textbox and the tool will give you some suggestions on how you can improve your script.

You can also run the tool directly in your terminal:

[https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)