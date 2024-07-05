# Bash Conditional Expressions

In computer science, conditional statements, conditional expressions, and conditional constructs are features of a programming language, which perform different computations or actions depending on whether a programmer-specified boolean condition evaluates to true or false.

In Bash, conditional expressions are used by the `[[` compound command and the `[`built-in commands to test file attributes and perform string and arithmetic comparisons. 

Here is a list of the most popular Bash conditional expressions. You do not have to memorize them by heart. You can simply refer back to this list whenever you need it!

## File expressions

* True if file exists.

```bash
[[ -a ${file} ]]
```

* True if file exists and is a block special file.

```bash
[[ -b ${file} ]]
```

* True if file exists and is a character special file.

```bash
[[ -c ${file} ]]
```

* True if file exists and is a directory.

```bash
[[ -d ${file} ]]
```

* True if file exists.

```bash
[[ -e ${file} ]]
```

* True if file exists and is a regular file.

```bash
[[ -f ${file} ]]
```

* True if file exists and is a symbolic link.

```bash
[[ -h ${file} ]]
```

* True if file exists and is readable.

```bash
[[ -r ${file} ]]
```

* True if file exists and has a size greater than zero.

```bash
[[ -s ${file} ]]
```

* True if file exists and is writable.

```bash
[[ -w ${file} ]]
```

* True if file exists and is executable.

```bash
[[ -x ${file} ]]
```

* True if file exists and is a symbolic link.

```bash
[[ -L ${file} ]]
```

## String expressions

* True if the shell variable varname is set (has been assigned a value).

```bash
[[ -v ${varname} ]]
```

True if the length of the string is zero.

```bash
[[ -z ${string} ]]
```

True if the length of the string is non-zero.

```bash
[[ -n ${string} ]]
```

* True if the strings are equal. `=` should be used with the test command for POSIX conformance. When used with the `[[` command, this performs pattern matching as described above (Compound Commands).

```bash
[[ ${string1} == ${string2} ]]
```

* True if the strings are not equal.

```bash
[[ ${string1} != ${string2} ]]
```

* True if string1 sorts before string2 lexicographically.

```bash
[[ ${string1} < ${string2} ]]
```

* True if string1 sorts after string2 lexicographically.

```bash
[[ ${string1} > ${string2} ]]
```

## Arithmetic operators

* Returns true if the numbers are **equal**

```bash
[[ ${arg1} -eq ${arg2} ]]
```

* Returns true if the numbers are **not equal**

```bash
[[ ${arg1} -ne ${arg2} ]]
```

* Returns true if arg1 is **less than** arg2

```bash
[[ ${arg1} -lt ${arg2} ]]
```

* Returns true if arg1 is **less than or equal** arg2

```bash
[[ ${arg1} -le ${arg2} ]]
```

* Returns true if arg1 is **greater than** arg2

```bash
[[ ${arg1} -gt ${arg2} ]]
```

* Returns true if arg1 is **greater than or equal** arg2

```bash
[[ ${arg1} -ge ${arg2} ]]
```

As a side note, arg1 and arg2 may be positive or negative integers.

As with other programming languages you can use `AND` & `OR` conditions:

```bash
[[ test_case_1 ]] && [[ test_case_2 ]] # And
[[ test_case_1 ]] || [[ test_case_2 ]] # Or
```

## Exit status operators

* returns true if the command was successful without any errors

```bash
[[ $? -eq 0 ]]
```

* returns true if the command was not successful or had errors

```bash
[[ $? -gt 0 ]]
```
