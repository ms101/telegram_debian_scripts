#!/bin/bash
BOTID="" # bot token from botfather
CHATID="" # find with https://api.telegram.org/bot<YourBOTToken>/getUpdates
URL="https://api.telegram.org/bot$BOTID/sendMessage?chat_id=$CHATID"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)
TITLE="$DATE $HOST"

UFWS=$(ufw status | grep "Status:" | cut -d" " -f2)
UFWP=$(ufw status | grep ALLOW | grep -v 22)

if [ "$UFWS" = "inactive" ]
then
        curl -X POST \
                -d "text=$TITLE %0Aufw inactive!" \
                "$URL" #&>/dev/null
elif [ -n "$UFWP" ]
then
        curl -X POST \
                -d "text=$TITLE %0A$UFWP" \
                "$URL" #&>/dev/null
fi
