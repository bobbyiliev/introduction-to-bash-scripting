Math using dc
dc is one of the oldest language on Unix.

It is using the reverse polish notation, which means that you are first stacking numbers, then operations. For example 1+1 is written as 1 1+.

To print an element from the top of the stack use command p

echo '2 3 + p' | dc
5

or

dc <<< '2 3 + p'
5
You can print the top element many times

dc <<< '1 1 + p 2 + p'
2
4
For negative numbers use _ prefix

dc <<< '_1 p'
-1
You can also use capital letters from A to F for numbers between 10 and 15 and . as a decimal point

dc <<< 'A.4 p'
10.4
dc is using abitrary precision which means that the precision is limited only by the available memory. By default the precision is set to 0 decimals

dc <<< '4 3 / p'
1
We can increase the precision using command k. 2k will use

dc <<< '2k 4 3 / p'
1.33

dc <<< '4k 4 3 / p'
1.3333
You can also use it over multiple lines

dc << EOF
1 1 +
3 *
p
EOF
6
bc is a preprocessor for dc.

Math using bc
bc is an arbitrary precision calculator language. It could be used interactively or be executed from command line.

For example, it can print out the result of an expression:

echo '2 + 3' | bc
5

echo '12 / 5' | bc
2
For floating-post arithmetic, you can import standard library bc -l:

echo '12 / 5' | bc -l
2.40000000000000000000
It can be used for comparing expressions:

echo '8 > 5' | bc
1

echo '10 == 11' | bc
0

echo '10 == 10 && 8 > 3' | bc
1
Math using bash capabilities
Arithmetic computation can be also done without involving any other programs like this:

Multiplication:

echo $((5 * 2))
10
Division:

echo $((5 / 2))
2
Modulo:

echo $((5 % 2))
1
Exponentiation:

echo $((5 ** 2))
25
Math using expr
expr or Evaluate expressions evaluates an expression and writes the result on standard output

Basic arithmetics

expr 2 + 3
5
When multiplying, you need to escape the * sign

expr 2 \* 3
6
You can also use variables

a=2
expr $a + 3
5
Keep in mind that it only supports integers, so expression like this

expr 3.0 / 2
will throw an error expr: not a decimal number: '3.0'.

It supports regular expression to match patterns

expr 'Hello World' : 'Hell\(.*\)rld'
o Wo
Or find the index of the first char in the search string

This will throw expr: syntax error on Mac OS X, because it uses BSD expr which does not have the index command, while expr on Linux is generally GNU expr

expr index hello l
3

expr index 'hello' 'lo'
3