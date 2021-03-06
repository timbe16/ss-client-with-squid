#!/bin/bash

/root/set-iptables.sh
/usr/sbin/squid -f /root/squid.conf

echo "nameserver $NAMESERVER" > /etc/resolv.conf

cmd="/usr/bin/ss-redir -u -s $SERVER -p $SERVER_PORT -l $LOCAL_PORT -m $ENCRYPT_METHOD -k $PASSWORD -b 0.0.0.0";

exec $cmd;