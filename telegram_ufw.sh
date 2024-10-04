#!/bin/bash
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
BOTID="" # bot token from botfather
CHATID="" # find with https://api.telegram.org/bot<YourBOTToken>/getUpdates
URL="https://api.telegram.org/bot$BOTID/sendMessage?chat_id=$CHATID"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)
TITLE="$DATE $HOST"

tmsg () {
        curl -s -X POST -d "text=$TITLE %0A$1" "$URL"
}

command -v ufw || tmsg "ufw not found"

UFWS=$(ufw status | grep "Status:" | cut -d" " -f2)
UFWP=$(ufw status | grep ALLOW | grep -v 22)

if [ "$UFWS" = "inactive" ]
then
        echo "$DATE ufw inactive"
        tmsg "ufw inactive"
elif [ -n "$UFWP" ]
then
        echo "$DATE open ports found"
        tmsg "$UFWP"
fi
