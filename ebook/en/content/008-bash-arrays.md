# Bash Arrays

If you have ever done any programming, you are probably already familiar with arrays. 

But just in case you are not a developer, the main thing that you need to know is that unlike variables, arrays can hold several values under one name.

You can initialize an array by assigning values devided by space and enclosed in `()`. Example:

```bash
my_array=("value 1" "value 2" "value 3" "value 4")
```

To access the elements in the array, you need to reference them by their numeric index.

>{notice} keep in mind that you need to use curly brackets.

* Access a single element, this would output: `value 2`

```bash
echo ${my_array[1]}
```

* This would return the last element: `value 4`

```bash
echo ${my_array[-1]}
```

* As with command line arguments using `@` will return all arguments in the array, as follows: `value 1 value 2 value 3 value 4`

```bash
echo ${my_array[@]}
```

* Prepending the array with a hash sign (`#`) would output the total number of elements in the array, in our case it is `4`:

```bash
echo ${#my_array[@]}
```

Make sure to test this and practice it at your end with different values.

## Substring in Bash :: Slicing

Let's review the following example of slicing in a string in Bash:

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
echo ${letters[@]}
```

This command will print all the elements of an array.

Output:

```bash
$ ABCDE
```


Let's see a few more examples:

- Example 1  

```bash
#!/bin/bash

letters=( "A""B""C""D""E" ) 
b=${letters:0:2}
echo "${b}"
```

This command will print array from starting index 0 to 2 where 2 is exclusive.

```bash
$ AB
```
 
 - Example 2

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

- Example 3

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
