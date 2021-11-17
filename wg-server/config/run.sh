#!/bin/bash

_term() {
  echo "Caught SIGTERM signal!"
  wg-quick down wg0
}

trap _term SIGTERM

passwd -u ssh-user

/usr/sbin/sshd

wg-quick up wg0

sleep

./dns.sh

sleep infinity &

wait
