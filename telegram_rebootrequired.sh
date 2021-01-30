#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`

if [ -f /var/run/reboot-required ]
       curl -X POST "https://api.telegram.org/bot<BOTID>:<AUTHTOKEN>/sendMessage?chat_id=<CHATID>&text=$DATE UPDATES%0A$Reboot Required!" &>/dev/null
fi
