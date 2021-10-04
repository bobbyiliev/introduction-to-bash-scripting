# BASH Script parser to Summarize Your NGINX and Apache Access Logs

One of the first things that I would usually do in case I notice a high CPU usage on some of my Linux servers would be to check the process list with either top or htop and in case that I notice a lot of Apache or Nginx process I would quickly check my access logs to determine what has caused or is causing the CPU spike on my server or to figure out if anything malicious is going on.

Sometimes reading the logs could be quite intimidating as the log might be huge and going though it manually could take a lot of time. Also, the raw log format could be confusing for people with less experience.

Just like the previous chapter, this chapter is going to be a challenge! You need to write a short bash script that would summarize the whole access log for you without the need of installing any additional software.

# Script requirements

This BASH script needs to parse and summarize your access logs and provide you with very useful information like:

* The 20 top pages with the most POST requests
* The 20 top pages with the most GET requests
* Top 20 IP addresses and their geo-location

## Example script

I already have prepared a demo script which you could use as a reference. But I encourage you to try and write the script yourself first and only then take a look at my script!

In order to download the script, you can either clone the repository with the following command:

```bash
git clone https://github.com/bobbyiliev/quick_access_logs_summary.git
```

Or run the following command which would download the script in your current directory:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/quick_access_logs_summary/master/spike_check
```

The script does not make any changes to your system, it only reads the content of your access log and summarizes it for you, however, once you've downloaded the file, make sure to review the content yourself.

## Running the script

All that you have to do once the script has been downloaded is to make it executable and run it.

To do that run the following command to make the script executable:

```bash
chmod +x spike_check
```

Then run the script:

```bash
./spike_check /path/to/your/access_log
```

Make sure to change the path to the file with the actual path to your access log. For example if you are using Apache on an Ubuntu server, the exact command would look like this:

```bash
./spike_check /var/log/apache2/access.log
```

If you are using Nginx the exact command would be almost the same, but with the path to the Nginx access log:

```bash
./spike_check /var/log/nginx/access.log
```

## Understanding the output

Once you run the script, it might take a while depending on the size of the log.

The output that you would see should look like this:

![Summarized access log](https://imgur.com/WWHVMrj.png)

Essentially what we can tell in this case is that we've received 16 POST requests to our xmlrpc.php file which is often used by attackers to try and exploit WordPress websites by using various username and password combinations.

In this specific case, this was not a huge brute force attack, but it gives us an early indication and we can take action to prevent a larger attack in the future.

We can also see that there were a couple of Russian IP addresses accessing our site, so in case that you do not expect any traffic from Russia, you might want to block those IP addresses as well.

## Conclusion

This is an example of a simple BASH script that allows you to quickly summarize your access logs and determine if anything malicious is going on.

Of course, you might want to also manually go through the logs as well but it is a good challenge to try and automate this with Bash!

>{notice} This content was initially posted on [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-summarize-your-nginx-and-apache-access-logs)
