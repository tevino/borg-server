#!/bin/sh

if [ -n "${BORG_UID}" ]; then
    usermod -u ${BORG_UID} borg
fi

if [ -n "${BORG_GID}" ]; then
    groupmod -o -g ${BORG_GID} borg
    usermod -g ${BORG_GID} borg
fi

if [ -n "${GITHUB_USERNAME}" ]; then
    wget https://github.com/${GITHUB_USERNAME}.keys -O /home/borg/.ssh/authorized_keys \
    chown borg.borg /home/borg/.ssh/authorized_keys
    chmod 600 /home/borg/.ssh/authorized_keys
fi

chown -R borg.borg /home/borg
chown -R borg.borg /home/borg/.ssh

exec /usr/sbin/sshd -D -e

