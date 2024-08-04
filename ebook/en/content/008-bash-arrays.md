# Bash Arrays

If you have ever done any programming, you are probably already familiar with arrays. 

But just in case you are not a developer, the main thing that you need to know is that unlike variables, arrays can hold several values under one name.

You can initialize an array by assigning values divided by space and enclosed in `()`. Example:

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

* As with command line arguments using `@` will return all elements in the array, as follows: `value 1 value 2 value 3 value 4`

```bash
echo ${my_array[@]}
```

* Prepending the array with a hash sign (`#`) would output the total number of elements in the array, in our case it is `4`:

```bash
echo ${#my_array[@]}
```

Make sure to test this and practice it at your end with different values.

## Array Slicing

While Bash doesn't support true array slicing, you can achieve similar results using a combination of array indexing and string slicing:

```bash
#!/bin/bash

array=("A" "B" "C" "D" "E")

# Print entire array
echo "${array[@]}"  # Output: A B C D E

# Access a single element
echo "${array[1]}"  # Output: B

# Print a range of elements (requires Bash 4.0+)
echo "${array[@]:1:3}"  # Output: B C D

# Print from an index to the end
echo "${array[@]:3}"  # Output: D E
```

When working with arrays, always use `[@]` to refer to all elements, and enclose the parameter expansion in quotes to preserve spaces in array elements.

## String Slicing

In Bash, you can extract portions of a string using slicing. The basic syntax is:

```bash
${string:start:length}
```

Where:
- `start` is the starting index (0-based)
- `length` is the maximum number of characters to extract

Let's look at some examples:

```bash
#!/bin/bash

text="ABCDE"

# Extract from index 0, maximum 2 characters
echo "${text:0:2}"  # Output: AB

# Extract from index 3 to the end
echo "${text:3}"    # Output: DE

# Extract 3 characters starting from index 1
echo "${text:1:3}"  # Output: BCD

# If length exceeds remaining characters, it stops at the end
echo "${text:3:3}"  # Output: DE (only 2 characters available)
```

Note that the second number in the slice notation represents the maximum length of the extracted substring, not the ending index. This is different from some other programming languages like Python. In Bash, if you specify a length that would extend beyond the end of the string, it will simply stop at the end of the string without raising an error.

For example:

```bash
text="Hello, World!"

# Extract 5 characters starting from index 7
echo "${text:7:5}"  # Output: World

# Attempt to extract 10 characters starting from index 7
# (even though only 6 characters remain)
echo "${text:7:10}"  # Output: World!
```

In the second example, even though we asked for 10 characters, Bash only returns the 6 available characters from index 7 to the end of the string. This behavior can be particularly useful when you're not sure of the exact length of the string you're working with.
