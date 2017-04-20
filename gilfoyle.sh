#!/bin/bash

# Path to files to monitor
FILE_PATH="/path/to/file"
# Name You want to Call the Server
SERVER_NAME="NAME OF SERVER"
# Add URL for Slack API Webhook
SLACK_API_KEY_URL="SLACK URL KEY"
# Set the desired channel (note: you must create this in slack)
SLACK_CHANNEL="SLACK CHANNEL NAME"
# Set your emoiji, we prefer Gilfoyle
SLACK_EMOIJI=":gilfoyle:"


inotifywait -e  modify,create,delete -m -r $FILE_PATH | while read FILECHANGED
do
/usr/bin/curl \
  -X POST \
  -s \
  --data-urlencode "payload={ \
    \"channel\": \"${SLACK_CHANNEL}\", \
    \"username\": \"Gilfoyle Says\", \
    \"icon_emoji\": \"${SLACK_EMOIJI}\", \
    \"text\": \"While you were busy minoring in gender studies at Sarah Lawrence, I wanted to let you know that your server *${SERVER_NAME}* is changing.\n\n *This File Changed:* \n\`${FILECHANGED}\`\" \
  }" \
  $SLACK_API_KEY_URL
done
