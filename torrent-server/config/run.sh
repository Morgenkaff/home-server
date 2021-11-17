#!/bin/bash

_term() {
  echo "Caught SIGTERM signal!"
  wg-quick down wg0

}

trap _term SIGTERM

passwd -u trans
wg-quick up wg0

touch /success

exec /usr/bin/transmission-daemon --foreground --config-dir /etc/transmission-daemon

sleep infinity &

wait
