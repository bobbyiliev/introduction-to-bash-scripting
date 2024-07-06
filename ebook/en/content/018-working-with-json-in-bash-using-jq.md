# Work with JSON in BASH using jq

The `jq` command-line tool is a lightweight and flexible command-line **JSON** processor. It is great for parsing JSON output in BASH.

One of the great things about `jq` is that it is written in portable C, and it has zero runtime dependencies. All you need to do is to download a single binary or use a package manager like apt and install it with a single command.

## Planning the script

For the demo in this tutorial, I would use an external REST API that returns a simple JSON output called the [QuizAPI](https://quizapi.io/):

> [https://quizapi.io/](https://quizapi.io/)

If you want to follow along make sure to get a free API key here:

> [https://quizapi.io/clientarea/settings/token](https://quizapi.io/clientarea/settings/token)

The QuizAPI is free for developers.

## Installing jq

There are many ways to install `jq` on your system. One of the most straight forward ways to do so is to use the package manager depending on your OS. 

Here is a list of the commands that you would need to use depending on your OS:

* Install jq on Ubuntu/Debian:

```bash
sudo apt-get install jq
```

* Install jq on Fedora:

```bash
sudo dnf install jq
```

* Install jq on openSUSE:

```bash
sudo zypper install jq
```

- Install jq on Arch:

```bash
sudo pacman -S jq
```

* Installing on Mac with Homebrew:

```bash
brew install jq
```

* Install on Mac with MacPort:

```bash
port install jq
```

If you are using other OS, I would recommend taking a look at the official documentation here for more information:

> [https://stedolan.github.io/jq/download/](https://stedolan.github.io/jq/download/)

Once you have jq installed you can check your current version by running this command:

```bash
jq --version
```

## Parsing JSON with jq

Once you have `jq` installed and your QuizAPI API Key, you can parse the JSON output of the QuizAPI directly in your terminal.

First, create a variable that stores your API Key:

```bash
API_KEY=YOUR_API_KEY_HERE
```

In order to get some output from one of the endpoints of the QuizAPI you can use the curl command:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10"
```

For a more specific output, you can use the QuizAPI URL Generator here:

> [https://quizapi.io/api-config](https://quizapi.io/api-config)

After running the curl command, the output which you would get would look like this:

![Raw Json output](https://imgur.com/KghOfzj.png)

This could be quite hard to read, but thanks to the jq command-line tool, all we need to do is pipe the curl command to jq and we would see a nice formatted JSON output:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq
```

> Note the `| jq` at the end.

In this case the output that you would get would look something like this:

![bash jq formatting](https://imgur.com/ebdTtVf.png)

Now, this looks much nicer! The jq command-line tool formatted the output for us and added some nice coloring!

## Getting the first element with jq

Let's say that we only wanted to get the first element from the JSON output, in order to do that we have to just specify the index that we want to see with the following syntax:

```bash
jq .[0]
```

Now, if we run the curl command again and pipe the output to jq .[0] like this:

```bash
curl "https://quizapi.io/api/v1/questions?apiKey=${API_KEY}&limit=10" | jq.[0]
```

You will only get the first element and the output will look like this:

![jq get first element only](https://imgur.com/h9bFMAL.png)

## Getting a value only for specific key

Sometimes you might want to get only the value of a specific key only, let's say in our example the QuizAPI returns a list of questions along with the answers, description and etc. but what if you wanted to get the Questions only without the additional information?

This is going to be quite straight forward with `jq`, all you need to do is add the key after jq command, so it would look something like this:

```bash
jq .[].question
```

We have to add  the `.[]` as the QuizAPI returns an array and by specifying `.[]` we tell jq that we want to get the .question value for all of the elements in the array.

The output that you would get would look like this:

![jq get a value only for specific key](https://imgur.com/0701wHD.png)

As you can see we now only get the questions without the rest of the values.

## Using jq in a BASH script

Let's go ahead and create a small bash script which should output the following information for us:

* Get only the first question from the output
* Get all of the answers for that question
* Assign the answers to variables
* Print the question and the answers
* To do that I've put together the following script:

>{notice} make sure to change the API_KEY part with your actual QuizAPI key:

```bash
#!/bin/bash

##
# Make an API call to QuizAPI and store the output in a variable
##
output=$(curl 'https://quizapi.io/api/v1/questions?apiKey=API_KEY&limit=10' 2>/dev/null)

##
# Get only the first question
##
output=$(echo $output | jq .[0])

##
# Get the question
##
question=$(echo $output | jq .question)

##
# Get the answers
##

answer_a=$(echo $output | jq .answers.answer_a)
answer_b=$(echo $output | jq .answers.answer_b)
answer_c=$(echo $output | jq .answers.answer_c)
answer_d=$(echo $output | jq .answers.answer_d)

##
# Output the question
##

echo "
Question: ${question}

A) ${answer_a}
B) ${answer_b}
C) ${answer_c}
D) ${answer_d}

"
```

If you run the script you would get the following output:

![Using jq in a bash script](https://imgur.com/LKEsrbq.png)

We can even go further by making this interactive so that we could actually choose the answer directly in our terminal.

There is already a bash script that does this by using the QuizAPI and `jq`:

You can take a look at that script here:

* [https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh](https://github.com/QuizApi/QuizAPI-BASH/blob/master/quiz.sh)

## Conclusion

The `jq` command-line tool is an amazing tool that gives you the power to work with JSON directly in your BASH terminal.

That way you can easily interact with all kinds of different REST APIs with BASH.

For more information, you could take a look at the official documentation here:

* [https://stedolan.github.io/jq/manual/](https://stedolan.github.io/jq/manual/)

And for more information on the **QuizAPI**, you could take a look at the official documentation here:

* [https://quizapi.io/docs/1.0/overview](https://quizapi.io/docs/1.0/overview)

>{notice} This content was initially posted on [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq)
