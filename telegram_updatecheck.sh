#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`

apt-get update -qq
AVAIL=`apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "$1 $2 -> $3\n"}'`

if [ ! -z "$AVAIL" ]
then
		curl -X POST "https://api.telegram.org/bot<BOTID>:<AUTHTOKEN>/sendMessage?chat_id=<CHATID>&text=$DATE UPDATES%0A$AVAIL" &>/dev/null
fi
