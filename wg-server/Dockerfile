FROM alpine

RUN apk update
RUN apk add bash curl
RUN apk add openssh-server wireguard-tools

# Some pre SSH setup
RUN ssh-keygen -A
#RUN adduser -D ssh-user

# WG setup:
COPY ./config/wg0.conf /etc/wireguard/wg0.conf
# A ugly pathed wg-quict without the sysctrl-call
COPY ./config/wg-quick.patched /usr/bin/wg-quick

# SSH setup:
COPY ./config/sshd_config /etc/ssh/sshd_config
COPY ./config/authorized_keys /home/ssh-user/.ssh/authorized_keys
COPY ./config/run.sh /run.sh

COPY ./config/dns.sh /dns.sh
