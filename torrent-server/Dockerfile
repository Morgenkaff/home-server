FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add wireguard-tools

RUN apk add transmission-daemon

RUN adduser -D trans

# WG setup:
COPY ./config/wg0.conf /etc/wireguard/wg0.conf
# A ugly pathed wg-quict without the sysctrl-call
COPY ./config/wg-quick.patched /usr/bin/wg-quick
COPY ./config/settings.json /etc/transmission-daemon/

# Copying the runs script over
COPY ./config/run.sh /run.sh

COPY ./config/dns.sh /dns.sh
