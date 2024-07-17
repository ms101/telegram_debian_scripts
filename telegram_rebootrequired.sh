#!/bin/bash
BOTID="" # bot token from botfather
CHATID="" # get via https://api.telegram.org/bot<YourBOTToken>/getUpdates
URL="https://api.telegram.org/bot$BOTID/sendMessage?chat_id=$CHATID"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)
TITLE="$DATE $HOST"

if [ -f /var/run/reboot-required ]
then
        curl -X POST \
                -d "text=$TITLE %0AReboot required!" \
                "$URL" #&>/dev/null
fi

