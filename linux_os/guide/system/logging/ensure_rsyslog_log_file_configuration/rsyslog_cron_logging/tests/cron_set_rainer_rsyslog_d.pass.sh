#!/bin/bash

RSYSLOG_CONF='/etc/rsyslog.conf'
RSYSLOG_D_FOLDER='/etc/rsyslog.d'
RSYSLOG_D_FILE=$RSYSLOG_D_FOLDER'/test'

# Ensure that rsyslog.d folder exists and contains our 'test' file
mkdir -p $RSYSLOG_D_FOLDER
touch $RSYSLOG_D_FILE

sed -i '/^[[:space:]]*cron\.\*/d' $RSYSLOG_CONF

echo 'cron.* action(name="local-cron" type="omfile" FileCreateMode="0600" fileOwner="root" fileGroup="root" File="/var/log/cron")' >> "$RSYSLOG_D_FILE"
