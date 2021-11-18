#!/bin/bash

_term() {
  echo "Caught SIGTERM signal!"
  wg-quick down wg0

}

trap _term SIGTERM

adduser -D trans
passwd -u trans


chown -R trans:trans /transmission
chmod -R 775 /transmission

su - trans -c '/usr/bin/transmission-daemon --config-dir /etc/transmission-daemon'

wg-quick up wg0

./dns.sh

sleep infinity &

wait
