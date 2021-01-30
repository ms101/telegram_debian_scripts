#!/bin/bash
# alert on reboot
# trigger by creating a simple systemd service (e.g. /etc/systemd/system/telegram-reboot.service):
#[Unit]
#After=network.target
#Description=Alert reboots via telegram bot
#
#[Service]
#ExecStart=/home/<USER>/telegram_alertonboot.sh
#
#[Install]
#WantedBy=multi-user.target
# finally execute: systemctl daemon-reload; systemctl enable telegram-reboot.service

DATE=`date '+%Y-%m-%d %H:%M:%S'`

curl -X POST "https://api.telegram.org/bot<BOTID>:<AUTHTOKEN>/sendMessage?chat_id=<CHATID>&text=$DATE INFO%0AServer rebooted" &>/dev/null
