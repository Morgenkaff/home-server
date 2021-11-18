#!/bin/bash

_term() {
  echo "Caught SIGTERM signal!"
  wg-quick down wg0
}

trap _term SIGTERM

adduser -D ssh-user
passwd -u ssh-user

chown ssh-user /home/ssh-user/.ssh
chown ssh-user /home/ssh-user/.ssh/authorized_keys
chmod 700 /home/ssh-user/.ssh
chmod 600 /home/ssh-user/.ssh/authorized_keys

/usr/sbin/sshd

wg-quick up wg0

sleep 5

./dns.sh

sleep infinity &

wait
