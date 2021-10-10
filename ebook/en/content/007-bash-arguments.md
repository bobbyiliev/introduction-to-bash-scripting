# Bash Arguments

You can pass arguments to your shell script when you execute it. To pass an argument, you just need to write it right after the name of your script. For example:

```bash
./devdojo.com your_argument
```

In the script, we can then use `$1` in order to reference the first argument that we specified. 

If we pass a second argument, it would be available as `$2` and so on.

Let's create a short script called `arguments.sh` as an example:

```bash
#!/bin/bash

echo "Argument one is $1"
echo "Argument two is $2"
echo "Argument three is $3"
```

Save the file and make it executable:

```bash
chmod +x arguments.sh
```

Then run the file and pass **3** arguments:

```bash
./arguments.sh dog cat bird
```

The output that you would get would be:

```bash
Argument one is dog
Argument two is cat
Argument three is bird
```

To reference all arguments, you can use `$@`:

```bash
#!/bin/bash

echo "All arguments: $@"
```

If you run the script again:

```bash
./arguments.sh dog cat bird
```

You will get the following output:

```
All arguments: dog cat bird
```

Another thing that you need to keep in mind is that `$0` is used to reference the script itself.

This is an excellent way to create self destruct the file if you need to or just get the name of the script.

For example, let's create a script that prints out the name of the file and deletes the file after that:

```bash
#!/bin/bash

echo "The name of the file is: $0 and it is going to be self-deleted."

rm -f $0
```

You need to be careful with the self deletion and ensure that you have your script backed up before you self-delete it.


## Substring in Bash :: Slicing

<!-- slicing in string -->

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
echo ${letters[@]}
```

This command will print all the elements of an array.

```bash
$ ABCDE
```


Lets see some other ways...

- 1  

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
b=${letters:0:2}
echo "${b}"
```

This command wil print array from starting index 0 to 2 where 2 is exclusive.

```bash
$ AB
```
 
 - 2

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
b=${letters::5}
echo "${b}"
```

This command will print from base index 0 to 5, where 5 is exclusive and starting index is default set to 0 .

```bash
$ ABCDE
```

- 3

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
b=${letters:3}
echo "${b}"
```

This command will print from starting index
 3 to end of array inclusive .

 ```bash
 $ DE
 ```






