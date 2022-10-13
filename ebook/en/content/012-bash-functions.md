# Bash Functions

Functions are a great way to reuse code. The structure of a function in bash is quite similar to most languages:

```bash
function function_name() {
    your_commands
}
```

You can also omit the `function` keyword at the beginning, which would also work:

```bash
function_name() {
    your_commands
}
```

I prefer putting it there for better readability. But it is a matter of personal preference.

Example of a "Hello World!" function:

```bash
#!/bin/bash

function hello() {
    echo "Hello World Function!"
}

hello
```

>{notice} One thing to keep in mind is that you should not add the parenthesis when you call the function.

Passing arguments to a function work in the same way as passing arguments to a script:

```bash
#!/bin/bash

function hello() {
    echo "Hello $1!"
}

hello DevDojo
```

Functions should have comments mentioning description, global variables, arguments, outputs, and returned values, if applicable

```bash
#######################################
# Description: Hello function
# Globals:
#   None
# Arguments:
#   Single input argument
# Outputs:
#   Value of input argument
# Returns:
#   0 if successful, non-zero on error.
#######################################
function hello() {
    echo "Hello $1!"
}
```

In the next few chapters we will be using functions a lot!
