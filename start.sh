#!/bin/sh

postconf -e "myhostname=$DOMAIN"
postconf -e "mydestination=$DOMAIN"

postconf -e "alias_maps = hash:/etc/aliases"
postconf -e 'recipient_delimiter = +-'

postconf -e "mailbox_command = "
postconf -e "home_mailbox = Maildir/"

while [ "$ACCOUNTS" ] ;do
    iter=${ACCOUNTS%%,*}
    echo "$iter: smtp" >> /etc/aliases
    [ "$ACCOUNTS" = "$iter" ] && \
        ACCOUNTS='' || \
        ACCOUNTS="${ACCOUNTS#*,}"
done
/usr/sbin/postalias /etc/aliases

/sbin/syslogd
/usr/sbin/postfix start

tail -f /var/log/messages
