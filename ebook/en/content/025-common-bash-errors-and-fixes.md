# Common Bash Errors and Fixes

Bash scripting is widely used for automation in Linux, but beginners often face errors that can be confusing.
This chapter explains common Bash errors, why they occur, and how to fix them.
Each explanation includes examples to make it easy to understand and apply in real scenarios.

By learning these common mistakes, you can debug scripts faster, write cleaner code, and avoid repeated errors.


## 1. Permission Denied
### Error:
```bash
bash: ./script.sh: Permission denied
```
### Cause:

The script file is not executable, which prevents the shell from running it.

### Fix:
Grant execute permission using:
```bash
chmod +x script.sh
```
Then run the script:
```bash
./script.sh
```
### Example:
```bash
#!/bin/bash
echo "Hello, world!"
```
Without `chmod +x`, running the script results in an error.
After granting execute permission, the script runs successfully.

**Explanation:** Linux requires explicit permission to run scripts for security reasons. Always set execute permission before running a new script.


## 2. Bad Interpreter or No Such File
### Error:
```bash
bash: ./script.sh: bad interpreter: /bin/bash^M: No such file or directory
```
### Cause:

This occurs when a script is created on Windows. Windows uses carriage return characters (`\r\n`) which Linux cannot read.

### Fix:

Convert the file to Unix format:
```bash
dos2unix script.sh
```
Or recreate the file using a Linux text editor such as **nano** or **vim**.

**Explanation:** The first line of a script (`#!/bin/bash`) tells the shell which interpreter to use. Extra Windows characters break this line, causing the error.

## 3. Command Not Found
### Error:
```bash
bash: myscript: command not found
```
### Cause:
The shell cannot locate the command or script. It might not be in the system PATH or is executed without specifying the path.

### Fix:
Run the script from its current directory:
```bash
./myscript.sh
```
Or add its directory to PATH:
```bash
export PATH=$PATH:/path/to/script
```

**Explanation:** The shell searches for commands in directories listed in `$PATH`. Scripts outside these directories require an explicit path.

## 4. Syntax Error Near Unexpected Token
### Error:
```
syntax error near unexpected token `then'
```
### Cause:

A missing `then`, semicolon (`;`) , or incorrect control structure causes Bash to fail parsing the script.

### Fix:

Ensure correct syntax for conditional statements.

**Incorrect:**
```bash
if [ $num -gt 10 ]
echo "Number greater than 10"
fi
```

**Correct:**
```bash
if [ $num -gt 10 ]; then
  echo "Number greater than 10"
fi
```

**Explanation:** Bash requires a specific structure for `if` statements: `[condition]; then` followed by commands and closed with `fi`.


## 5. Unexpected End of File (EOF)
### Error:
```
syntax error: unexpected end of file
```
### Cause:

A block (like `if`, `for`, or `while`) or a quote is not properly closed.

### Example:

**Incorrect:**
```bash
if [ $num -gt 5 ]; then
  echo "Greater"
```

**Correct:**
```
if [ $num -gt 5 ]; then
  echo "Greater"
fi
```

**Explanation:** Every opening keyword like `if` or `for` must have a corresponding closing keyword (`fi, done`) for Bash to understand the block.


## 6. Variable Not Expanding
## Issue:

A variable prints empty or does not display its value.

### Cause:

The variable is not initialized or not exported correctly.

### Fix:
```bash
username="Nishika"
echo "User is $username"
```

**Explanation:** Variables must be assigned a value before usage. Otherwise, Bash prints nothing.

## 7. Integer Expression Expected
### Error:
```bash
[: 5a: integer expression expected
```
### Cause:

A non-numeric value is used in an arithmetic comparison.

### Fix:
```bash
num=5
if [ $num -gt 3 ]; then
  echo "Yes"
fi
```

**Explanation:** Bash arithmetic comparisons work only with integers. Make sure the variable contains a number.

## 8. Bad Substitution
### Error:
```bash
bad substitution
```
### Cause:

Bash-specific syntax is used in a shell that does not support it (like `sh`).

### Fix:

Run the script with Bash explicitly:
```bash
bash script.sh
```

**Explanation:** Not all shells support Bash extensions. Always use Bash when using advanced syntax.


## 9. File Redirection Permission Denied
### Error:
```bash
bash: output.txt: Permission denied
```
### Cause:

The user does not have permission to write to the file or directory.

### Fix:

Redirect output to a writable location:
```bash
./script.sh > ~/output.txt
```

Or run with elevated permissions:
```bash
sudo ./script.sh
```

**Explanation:** Linux enforces strict file permissions. Writing to protected directories requires proper rights.


## 10. Script Not Found
### Error:
```bash
bash: script.sh: command not found
```
### Cause:

The script is executed without specifying the relative or absolute path.

### Fix:
```bash
./script.sh
```   

Or provide full path:
```bash
/path/to/script.sh
```

**Explanation:** Bash will only execute scripts it can locate. Use relative or absolute paths when needed.

## Practical Example: Loop Over Files

Beginners often write loops that process a directory itself instead of the files inside it. This is a logical mistake that runs without a syntax error but produces unexpected results.

**Incorrect:**
```bash
for file in /home/user/docs
do
  echo Processing $file
done
```

### Output:
```bash
Processing /home/user/docs
```
**Correct:**
```bash
for file in /home/user/docs/*; do
  echo "Processing $file"
done
```

**Explanation:** Adding `/*` ensures the loop iterates over each file inside the directory, rather than the directory itself.

## Debugging Tips

- `set -x` – Display each command before execution.

- `$?` – Check the exit status of the last command.

- `bash -n script.sh` – Validate syntax without running the script.

- `bash -v script.sh` – Display commands as they execute.

- `2> error.log` – Redirect errors to a file.

- `trap 'echo "Error on line $LINENO"' ERR` – Catch runtime errors  with line numbers.

## Key Takeaways

Most common Bash errors result from:

- Missing permissions

- Syntax mistakes

- Unset variables

- Running scripts with the wrong shell

Understanding these errors and using debugging techniques will help you write reliable and maintainable Bash scripts.