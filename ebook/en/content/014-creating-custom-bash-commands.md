# Creating custom bash commands

As a developer or system administrator, you might have to spend a lot of time in your terminal. I always try to look for ways to optimize any repetitive tasks.

One way to do that is to either write short bash scripts or create custom commands also known as aliases. For example, rather than typing a really long command every time you could just create a shortcut for it.

## Example

Let's start with the following scenario, as a system admin, you might have to check the connections to your web server quite often, so I will use the `netstat` command as an example.

What I would usually do when I access a server that is having issues with the connections to port 80 or 443 is to check if there are any services listening on those ports and the number of connections to the ports.

The following `netstat` command would show us how many TCP connections on port 80 and 443 we currently have:

```bash
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l
```
This is quite a lengthy command so typing it every time might be time-consuming in the long run especially when you want to get that information quickly.

To avoid that, we can create an alias, so rather than typing the whole command, we could just type a short command instead. For example, lets say that we wanted to be able to type `conn` (short for connections) and get the same information. All we need to do in this case is to run the following command:

```bash
alias conn="netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

That way we are creating an alias called `conn` which would essentially be a 'shortcut' for our long `netstat` command. Now if you run just `conn`:

```bash
conn
```

You would get the same output as the long `netstat` command.
You can get even more creative and add some info messages like this one here:

```bash
alias conn="echo 'Total connections on port 80 and 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Now if you run `conn` you would get the following output:

```bash
Total connections on port 80 and 443:
12
```
Now if you log out and log back in, your alias would be lost. In the next step you will see how to make this persistent.

## Making the change persistent

In order to make the change persistent, we need to add the `alias` command in our shell profile file. 

By default on Ubuntu this would be the `~/.bashrc` file, for other operating systems this might be the `~/.bash_profile`. With your favorite text editor open the file:

```bash
nano ~/.bashrc
```

Go to the bottom and add the following:

```bash
alias conn="echo 'Total connections on port 80 and 443:' ; netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
```

Save and then exit.

That way now even if you log out and log back in again your change would be persisted and you would be able to run your custom bash command.

## Listing all of the available aliases

To list all of the available aliases for your current shell, you have to just run the following command:

```bash
alias
```

This would be handy in case that you are seeing some weird behavior with some commands.

## Conclusion

This is one way of creating custom bash commands or bash aliases.

Of course, you could actually write a bash script and add the script inside your `/usr/bin` folder, but this would not work if you don't have root or sudo access, whereas with aliases you can do it without the need of root access.

>{notice} This was initially posted on [DevDojo.com](https://devdojo.com/bobbyiliev/how-to-create-custom-bash-commands)
