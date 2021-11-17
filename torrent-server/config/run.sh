#!/bin/bash

_term() {
  echo "Caught SIGTERM signal!"

}

trap _term SIGTERM

passwd -u trans

touch /success

sleep infinity &

wait
