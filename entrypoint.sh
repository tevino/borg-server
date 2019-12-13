#!/bin/sh

if [ -n "${BORG_UID}" ]; then
    usermod -u ${BORG_UID} borg
fi

if [ -n "${BORG_GID}" ]; then
    groupmod -o -g ${BORG_GID} borg
    usermod -g ${BORG_GID} borg
fi

exec /usr/sbin/sshd -D -e

