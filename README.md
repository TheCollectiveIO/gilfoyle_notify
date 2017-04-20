# Gilfoyle
Brought to you by The Collective's Reed Dunn

### Summary:
Like Gilfoyle on Silicon Valley our Gilfoyle will keep an eye on your servers and let you know when sh** is hitting the fan.

### Automated Install
1. Download this repo to your servers home(~) directory
```
git clone https://github.com/TheCollectiveIO/gilfoyle_notify.git
```
2. Add your Slack Channel, API key, Host Name, Slack Icon Variables
```
nano gilfoyle.sh
```
>Change the following variables
```
FILE_PATH="/path/to/file"
SERVER_NAME="NAME OF SERVER"
SLACK_API_KEY_URL="SLACK URL KEY"
SLACK_CHANNEL="SLACK CHANNEL NAME"
SLACK_EMOIJI=":gilfoyle:"
```
3. Run the Install Script
```
sudo sh INSTALL.sh
```
4. Restart your server
```
sudo shutdown -r now
```
* Alternative you can run ``nohup /usr/bin/gilfoyle.sh &`` to run the script in the background

5. Clean up your home directory
```
rm -rf /home/$USERNAME/gilfoyle_notify
```

### Manual Install
If you have a very customized hosting environment you it might be safer for you to run the commands in the installer through ther terminal.

1. Download this repo to your server
```
git clone https://github.com/TheCollectiveIO/gilfoyle_notify.git
```
2. Add your Slack Channel, API key, Host Name, Slack Icon Variables
```
nano gilfoyle.sh
```
>Change the following variables
```
FILE_PATH="/path/to/file"
SERVER_NAME="NAME OF SERVER"
SLACK_API_KEY_URL="SLACK URL KEY"
SLACK_CHANNEL="SLACK CHANNEL NAME"
SLACK_EMOIJI=":gilfoyle:"
```
3. Install inotify-tools
```
sudo apt-get install inotify-tools
```
4. move gilfoyle to `usr/bin`
```
mv gilfoyle.sh /usr/bin
```
5. Change the permissions and make the file executable just in case
```
sudo chown root:root /usr/bin/gilfoyle.sh
sudo chmod +x /usr/bin/gilfoyle.sh
```
6. Edit your `/etc/rc.local` file to have Gilfoyle run on startup
```
sudo nano /etc/rc.local
```
before the last line of the file which should be exit 0 add:
```
sh /usr/bin/gilfoyle.sh
```
7. Clean up your home directory
```
rm -rf /home/$USERNAME/gilfoyle_notify
```

### Stuff used to make this:

 * [Slack Webhook Formatting](https://api.slack.com/incoming-webhooks) for message formatting.
 * [Slack Webhook Integration](https://my.slack.com/services/new/incoming-webhook/) to add webhooks to slack and create a hook key.
 * [inotify-tools](https://github.com/rvoicilas/inotify-tools) for monitoring the files.