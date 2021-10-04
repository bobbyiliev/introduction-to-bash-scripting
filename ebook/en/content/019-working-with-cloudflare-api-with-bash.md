# Working with Cloudflare API with Bash

I host all of my websites on **DigitalOcean** Droplets and I also use Cloudflare as my CDN provider. One of the benefits of using Cloudflare is that it reduces the overall traffic to your user and also hides your actual server IP address behind their CDN.

My personal favorite Cloudflare feature is their free DDoS protection. It has saved my servers multiple times from different DDoS attacks. They have a cool API that you could use to enable and disable their DDoS protection easily.

This chapter is going to be an exercise! I challenge you to go ahead and write a short bash script that would enable and disable the Cloudflare DDoS protection for your server automatically if needed!

## Prerequisites

Before following this guide here, please set up your Cloudflare account and get your website ready. If you are not sure how to do that you can follow these steps here: [Create a Cloudflare account and add a website](https://support.cloudflare.com/hc/en-us/articles/201720164-Step-2-Create-a-Cloudflare-account-and-add-a-website).

Once you have your Cloudflare account, make sure to obtain the following information:

* A Cloudflare account
* Cloudflare API key
* Cloudflare Zone ID

Also, Make sure curl is installed on your server:

```bash
curl --version
```

If curl is not installed you need to run the following:

* For RedHat/CentOs:

```bash
yum install curl
```

* For Debian/Ubuntu

```bash
apt-get install curl
```

## Challenge - Script requirements

The script needs to monitor the CPU usage on your server and if the CPU usage gets high based on the number vCPU it would enable the Cloudflare DDoS protection automatically via the Cloudflare API.

The main features of the script should be:

* Checks the script CPU load on the server
* In case of a CPU spike the script triggers an API call to Cloudflare and enables the DDoS protection feature for the specified zone
* After the CPU load is back to normal the script would disable the "I'm under attack" option and set it back to normal

## Example script

I already have prepared a demo script which you could use as a reference. But I encourage you to try and write the script yourself first and only then take a look at my script!

To download the script just run the following command:

```bash
wget https://raw.githubusercontent.com/bobbyiliev/cloudflare-ddos-protection/main/protection.sh
```

Open the script with your favorite text editor:

```bash
nano protection.sh
```

And update the following details with your Cloudflare details:

```bash
CF_CONE_ID=YOUR_CF_ZONE_ID
CF_EMAIL_ADDRESS=YOUR_CF_EMAIL_ADDRESS
CF_API_KEY=YOUR_CF_API_KEY
```

After that make the script executable:

```bash
chmod +x ~/protection.sh
```

Finally, set up 2 Cron jobs to run every 30 seconds. To edit your crontab run:

```bash
crontab -e
```

And add the following content:

```bash
* * * * * /path-to-the-script/cloudflare/protection.sh
* * * * * ( sleep 30 ; /path-to-the-script/cloudflare/protection.sh )
```

Note that you need to change the path to the script with the actual path where you've stored the script at.

## Conclusion

This is quite straight forward and budget solution, one of the downsides of the script is that if your server gets unresponsive due to an attack, the script might not be triggered at all.

Of course, a better approach would be to use a monitoring system like Nagios and based on the statistics from the monitoring system then you can trigger the script, but this script challenge could be a good learning experience!

Here is another great resource on how to use the Discord API and send notifications to your Discord Channel with a Bash script:

[How To Use Discord Webhooks to Get Notifications for Your Website Status on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04)

>{notice} This content was initially posted on [DevDojo](https://devdojo.com/bobbyiliev/bash-script-to-automatically-enable-cloudflare-ddos-protection)
