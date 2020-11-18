# Bash Functions

Functions are a great way to reuse code. The structure of a function in bash is quite similar to most languages:

```bash
function function_name() {
    your_commands
}
```

You can also omit the `function` keyword in the beginning which would also work:

```bash
function_name() {
    your_commands
}
```

I prefer putting it there for better readability.

Example of a "Hello World!" function:

```bash
#!/bin/bash

function hello(){
    echo "Hello World Function!"
}

hello
```

One thing to keep in mind is that when you call the function, you should not add the parenthesis.

Passing arguments to a function works in the same way as passing arguments to a script:

```bash
#!/bin/bash

function hello(){
    echo "Hello $1!"
}

hello DevDojo
```